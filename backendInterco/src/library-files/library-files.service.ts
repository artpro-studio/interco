import { Inject, Injectable, forwardRef } from '@nestjs/common';
import {AuthService} from '../auth/auth.service';
import {InjectRepository} from '@nestjs/typeorm';
import { Repository, IsNull, ILike } from 'typeorm';
import {LibraryFilesEntity} from './entities/library-files.entity';
import * as Minio from 'minio';
import { ConfigService } from '@nestjs/config';
import * as crypto from 'crypto';
import { UserService } from 'src/user/user.service';
import { FileType, FileTypeData, MainFile } from './interface';
import { ResponseLibraryFiles, ResponseLibraryFilesList, ResponseLibraryListDto } from './dto/response-library-files.dto';
import { CreateLibraryFilesDto } from './dto/create-library-files.dto';
import { ResultDto } from 'src/dto/reponse.dto';
import { Role } from 'src/user/role-interface';
import { UserDto } from 'src/user/dto/user.dto';
import * as sharp from 'sharp';
import { Readable } from 'stream';

@Injectable()
export class LibraryFilesService {
    private minioClient: Minio.Client;
    private bucketName: string;

    constructor(
        @InjectRepository(LibraryFilesEntity)
        private readonly libraryFilesRepository: Repository<LibraryFilesEntity>,

        private readonly configService: ConfigService,

        @Inject(forwardRef(() => UserService))
        private readonly usersService: UserService,

        @Inject(forwardRef(() => AuthService))
        private readonly authService: AuthService,
    ) {
        this.minioClient = new Minio.Client({
            endPoint: this.configService.get('MINIO_ENDPOINT'),
            port: Number(this.configService.get('MINIO_PORT')),
            useSSL: this.configService.get('MINIO_USE_SSL') === 'true',
            accessKey: this.configService.get('MINIO_ACCESS_KEY'),
            secretKey: this.configService.get('MINIO_SECRET_KEY')
        });
        this.bucketName = this.configService.get('MINIO_BUCKET_NAME');
    }

    async getListDirectory(page: number, search: string | null = null): Promise<ResponseLibraryListDto> {
        const take = 10;
        const skip = page === 1 ? 0 : (page - 1) * take;
        const query = this.libraryFilesRepository.createQueryBuilder('library_files').skip(skip).take(take).andWhere({
            type: FileType.DIRECTORY
        });

        if (search) {
            query.andWhere({
                name: ILike(`%${search}%`)
            });
        }

        return {
            isSuccess: true,
            entity: {
                count: await query.getCount(),
                entity: await query.getMany()
            }
        };

    }

    // Буфер файла
    async getFileBuffer(filename: string) {
       return await this.minioClient.getObject(this.bucketName, filename);
    }

    // Получение url файла в облаке
    getUrlCloud(filename: string): string {
        return `${this.configService.get('MINIO_DOMEN')}:${this.configService.get('MINIO_PORT')}/${this.bucketName}/${filename}`;
    }

    // URL от MINIO с периодом жизни 7 дней
    async getPresignedUrl(filename: string): Promise<string> {
        console.log(await this.minioClient.getObject(this.bucketName, filename));
        return await this.minioClient.presignedUrl('GET', this.bucketName, filename);
    }

    // Загрузка файла
    async uploadFile(files: MainFile,  authorization: string, pareantID: number): Promise<ResponseLibraryFiles> {
        try {
            let user: UserDto | null = null;
            if (authorization) {
                const token = authorization.split(' ')[1];
                const userID = this.authService.decodeToken(token).id;
                user = await (await this.usersService.getOne(userID)).entity;
            }

            let parent: CreateLibraryFilesDto | undefined = undefined;

            if (pareantID) {
                parent = await this.libraryFilesRepository.findOne({
                    where: {
                        id: pareantID
                    }
                });
            }

            const timestamp = Date.now().toString();
            const hashedFileName = crypto .createHash('md5').update(timestamp).digest('hex');
            const extension = files.originalname.substring(
                files.originalname.lastIndexOf('.'),
                files.originalname.length,
            );
            const metaData = {
                'Content-Type': files.mimetype,
            };

            const fileName = hashedFileName + extension;
            let thisFiles: any = files.buffer;

            if (FileTypeData[files.mimetype] === FileType.IMAGES) {
                const optimizedBuffer = await sharp(files.buffer)
                    .jpeg({ quality: 80 }) // Сжатие JPEG с качеством 80
                    .png({quality: 80})
                    .toBuffer();
                const stream = Readable.from(optimizedBuffer);
                thisFiles = stream
            }

            await this.minioClient.putObject(
                this.bucketName,
                fileName,
                thisFiles,
                files.size,
                metaData,
                (err, obj) => {
                    console.log(err, obj)
                }
            );
            const entity = this.libraryFilesRepository.create({
                name: files.originalname,
                filename: fileName,
                path: '',
                size: files.size,
                type: FileTypeData[files.mimetype],
                parent,
            });
            await this.libraryFilesRepository.save(entity);

            entity.path = this.getUrlCloud(entity.filename);

            return {isSuccess: true, entity};
        } catch (e) {
            console.log(e)
            return {isSuccess: false};
        }
    }

    // Список файлов
    async get(page: number, limit: number = 100, directory: number | undefined, fileName: string | null, type: FileType | null): Promise<ResponseLibraryListDto> {
        try {
            const take = limit;
            const skip = page === 1 ? 0 : (page - 1) * take;
            const query = this.libraryFilesRepository.createQueryBuilder('dropzona').skip(skip).take(take)
            .where({
                deletedAt: IsNull(),
            })
            .orderBy('dropzona.type', 'ASC');

            if (directory) {
                query.andWhere({
                    parent: directory
                });
            } else {
                query.andWhere({
                    parent: IsNull()
                });
            }

            if (fileName) {
                query.andWhere({
                    name: ILike(`%${fileName}%`)
                });
            }

            if (type) {
                query.andWhere({
                    type
                });
            }

            const library: any = (await query.getMany()).map((el) => {
                return {
                    ...el,
                    path: el.filename ? this.getUrlCloud(el.filename) : ''
                };
            });

            const entity: ResponseLibraryListDto = {
                isSuccess: true,
                entity: {
                    count: await query.getCount(),
                    entity: library
                }
            };

            return { ...entity };
        } catch (error) {
            console.log(error);
            return {isSuccess: false, entity: null };
        }
    }

    // Получение одного файла по ID
    async getOne(id: number): Promise<ResponseLibraryFiles> {
      const entity = await this.libraryFilesRepository.findOne({
          where: {
              id,
              deletedAt: IsNull(),
          },
          relations: ['parent']
      });
      if (!entity) {
          return {isSuccess: false, message:'Файл не найден'};
      }

      entity.path = this.getUrlCloud(entity.filename);
      return {isSuccess: true, entity};
    }

    async getFilesForDirectory(id: number): Promise<ResponseLibraryFilesList> {

        const query = this.libraryFilesRepository.createQueryBuilder('dropzona').leftJoinAndSelect('dropzona.parent', 'parent')
            .where({
                deletedAt: IsNull(),
            }).andWhere({
                parent: {
                    id
                }
            });

        let entity: CreateLibraryFilesDto[] = await query.getMany();
        entity = entity.map((el: CreateLibraryFilesDto) => {
            if (el.type !== FileType.DIRECTORY) {
                return {
                    ...el,
                    path: `${this.configService.get('MINIO_DOMEN')}:${this.configService.get('MINIO_PORT')}/${this.bucketName}/${el.filename}`
                };
            } else {
                return el;
            }        });

        return {isSuccess: true, entity};
    }

    async create(body: CreateLibraryFilesDto): Promise<ResponseLibraryFiles> {
        const entity = this.libraryFilesRepository.create(body);
        await this.libraryFilesRepository.save(entity);

        return {isSuccess: true, entity};
    }

    // Обновление название у файла
    async update(id: number, name: string): Promise<ResultDto> {
        const entity = await this.libraryFilesRepository.findOne({
            where: {
                id
            }
        });
        if (!entity) {
            return {isSuccess: false, message: 'Файл не найден'};
        }

        entity.name = name;

        await this.libraryFilesRepository.save(entity);

        return {isSuccess: true};
    }

    // Удаление файла
    async deleteFile(id: number, req: any): Promise<ResultDto> {
        try {
            const user = (await this.usersService.getCurrentInfo(req)).entity;
            const entity = await this.libraryFilesRepository.findOne({
                where: {
                    id
                }
            });
            if (user.role !== Role.Admin) {
                return {isSuccess: false, message: 'У вас нет доступа'};
            }
            if (!entity) {
                return { isSuccess: false, message: 'Файл не найден' };
            }

            if (entity.isSystem) {
                return { isSuccess: false, message: 'Нельзя удалить системную папку' };
            }

            if (entity.type !== FileType.DIRECTORY && entity.filename) {
                await this.minioClient.removeObject(this.bucketName, entity.filename);
            }

            await this.libraryFilesRepository.softDelete(id);

            return { isSuccess: true };
        } catch (e) {
            console.log(e);
            return { isSuccess: false };
        }
    }

    // Удаление файла
    async deleteFileIds(ids: number[], req: any): Promise<ResultDto> {
        try {
            const user = (await this.usersService.getCurrentInfo(req)).entity;
            const entity: CreateLibraryFilesDto[] = await this.libraryFilesRepository.createQueryBuilder('library')
                .where('library.id IN (:...ids)', {
                    ids
                })
                .getMany();

            if (user.role !== Role.Admin) {
                return {isSuccess: false, message: 'У вас нет доступа'};
            }
            if (entity.length === 0) {
                return { isSuccess: false, message: 'Файлы не найден' };
            }

            const notDeleteFileName = entity.filter((el) => el.isSystem).map((el) => el.name)
            const fileNameDeletesFile = entity.filter((el) => !el.isSystem && el.type !== FileType.DIRECTORY && el.name).map((el) => el.filename)
            const idsDeletesFileAndDirectory = entity.filter((el) => !el.isSystem).map((el) => el.id)
            if (fileNameDeletesFile.length) {
                await this.minioClient.removeObjects(this.bucketName, fileNameDeletesFile);
            }

            await this.libraryFilesRepository
                .createQueryBuilder('library')
                .where('id IN (:...ids)', {
                    ids: idsDeletesFileAndDirectory,
                })
                .softDelete()
                .execute();
            return {
                isSuccess: true,
                message: notDeleteFileName.length ? 'Нельзя удалить файлы:' + notDeleteFileName.join(',') : undefined
            };
        } catch (e) {
            console.log(e);
            return { isSuccess: false };
        }
    }
}

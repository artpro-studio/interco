import { Injectable } from '@nestjs/common';
import { PagesListDto, PagesQuery, ResultPagesDto, ResultPagesFullDto } from '../dto/pages/response-pages.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { PagesEntity } from '../entity/pages.entity';
import { ILike, IsNull, Repository } from 'typeorm';
import { PagesDto } from '../dto/pages/create-pages.dto';
import { BaseQuery, ResultDto } from 'src/dto/reponse.dto';
import { DropDownDto, ResultDropDownDto } from 'src/dto/response-drop-down.dto';
import { PagesType } from '../interface';

@Injectable()
export class PagesService {
    constructor(
        @InjectRepository(PagesEntity) private readonly pagesRepository: Repository<PagesEntity>,
    ){}

    async getPagesBlogs(): Promise<PagesListDto> {
        const query = this.pagesRepository.createQueryBuilder('pages')
            .orderBy('pages.id', 'ASC')
            .andWhere({
                type: PagesType.BLOG
            });
        return {
            isSuccess: true,
            entity: {
                count: await query.getCount(),
                entity: await query.getMany()
            }
        }
    }

     // Получение одной страницы по slug
     async getOneForSlug(slug: string): Promise<ResultPagesFullDto> {
        let entity = null;
        if (!slug) {
            entity = await this.pagesRepository.findOne({
                where: {
                    slug,
                }
            })
        } else {
            entity = await this.pagesRepository.findOne({
                where: {
                    slug,
                }
            })
        }


        return {isSuccess: !!entity, entity, message: !entity ? 'Запись не найдна' : ''}
    }

    // Получение одной страницы
    async getOne(id: number): Promise<ResultPagesFullDto> {
        const entity = await this.pagesRepository.findOne({
            where: {
                id,
            },
            relations: ['records']
        })

        return {isSuccess: !!entity, entity, message: !entity ? 'Запись не найдна' : ''}
    }

    // Создание страницы
    async create(body: PagesDto): Promise<ResultPagesDto> {
        const entity = this.pagesRepository.create(body);
        await this.pagesRepository.save(entity);

        return {isSuccess: true, entity}
    }

    // Обновление страницы
    async update(body: PagesDto): Promise<ResultPagesDto> {
        const page = await this.pagesRepository.findOne({
            where: {
                id: body.id,
            },
            relations: ['records']
        })
        const entity = {
            ...page,
            ...body,
        };
        await this.pagesRepository.save(entity);

        return {isSuccess: true, entity}
    }

    // Список страниц
    async get(body: PagesQuery): Promise<PagesListDto> {
        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.pagesRepository.createQueryBuilder('pages').take(take).skip(skip).orderBy('pages.id', 'ASC');

        if (body.pagesType !== undefined) {
            query.andWhere({
                type: body.pagesType
            })
        }
        if (body.search) {
            query.orWhere({
                name: ILike(`%${body.search}%`)
            }).orWhere({
                description: ILike(`%${body.search}%`)
            })
        }

        return {
            isSuccess: true,
            entity: {
                count: await query.getCount(),
                entity: await query.getMany()
            }
        }
    }

    // Удаление страницы
    async delete(id: number): Promise<ResultDto> {
        const query = await this.pagesRepository
        .createQueryBuilder('pages')
        .where('id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return {
        isSuccess: !!query.affected,
        message: !!query.affected
            ? 'Страница удалена'
            : 'Не удалось удалить страницу',
        };
    }

    // Массовое удаление страниц
    async deleteIds(ids: number[]): Promise<ResultDto> {
        const query = await this.pagesRepository
        .createQueryBuilder('pages')
        .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
        })
        .softDelete()
        .execute();

        return {
        isSuccess: !!query.affected,
        message: !!query.affected
            ? 'Страницы удалены'
            : 'Не удалось удалить страницы',
        };
    }

    // Проверка есть ли страница
    async isPage(id: number): Promise<ResultDto> {
        const entity = this.pagesRepository.findOne({
            where: {
                id
            }
        })

        return {isSuccess: !!entity, message: !entity ? 'Страница не найдена' : ''}
    }

    // Select страниц
    async getSelect(body: BaseQuery): Promise<ResultDropDownDto> {
        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.pagesRepository.createQueryBuilder('pages').take(take).skip(skip).orderBy('pages.id', 'ASC');
        query.select('id', 'value').addSelect('name', 'label')

        const entity: DropDownDto[] = await query.execute()

        return {
            isSuccess: true,
            entity: {
                count: await query.getCount(),
                entity
            }
        }
    }

    // Select страниц
    async getSelectIds(ids: number[]): Promise<ResultDropDownDto> {
        const query = this.pagesRepository.createQueryBuilder('pages').orderBy('pages.id', 'ASC');
        query.select('id', 'value').addSelect('name', 'label')

        if (Array.isArray(ids)) {
            query.where('id IN (:...ids)', {
                ids,
            })
        } else {
            query.andWhere({
                id: ids
            })
        }

        query.andWhere({
            deletedAt: IsNull(),
        })

        const entity: DropDownDto[] = await query.execute()

        return {
            isSuccess: true,
            entity: {
                count: await query.getCount(),
                entity
            }
        }
    }
}

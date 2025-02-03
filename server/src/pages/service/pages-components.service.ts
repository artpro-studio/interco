import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { PagesComponentsEntity } from '../entity/pages-components.entity';
import { Repository } from 'typeorm';
import { PagesComponentsListDto, ResultPagesComponentsDto } from '../dto/pages-components/response-pages-components.dto';
import { ResultDto } from 'src/dto/reponse.dto';
import { PagesEntity } from '../entity/pages.entity';
import { CreatePagesComponents } from '../dto/pages-components/create-pages-components.dto';
import { PagesComponentsDto } from '../dto/pages-components/create-pages-components.dto';

@Injectable()
export class PagesComponentsService {
    constructor(
        @InjectRepository(PagesComponentsEntity) private readonly pagesComponentsRepository: Repository<PagesComponentsEntity>,
        @InjectRepository(PagesEntity) private readonly pagesRepository: Repository<PagesEntity>,
    ){}

    // Получение компонентов страницы
    async getComponentsForSlug(slug: string): Promise<PagesComponentsListDto> {
        const query = this.pagesComponentsRepository.createQueryBuilder('pagesComponents')
        .leftJoin('pagesComponents.pages', 'pages')
        .andWhere('pages.slug = :slug', {
            slug: slug || '/'
        })
        .orderBy('pagesComponents.order', 'ASC')

        return {
            isSuccess: true,
            entity: {
                count: await query.getCount(),
                entity: await query.getMany()
            }
        }
    }

    // Создание компонентов страницы
    async create(body: CreatePagesComponents): Promise<ResultPagesComponentsDto> {
        const pages = await this.pagesRepository.findOne({
            where: {
                id: body.idPage
            }
        })
        if (!pages) {
            return {isSuccess: false, message:'Страница не найдена'}
        }

        const bodyContent = body.fields.map((el: PagesComponentsDto) => {
            return {
                ...el,
                pages
            }
        })

        const entityes = this.pagesComponentsRepository.create(bodyContent)

        await this.pagesComponentsRepository.save(entityes)

        return {isSuccess: true}

    }

    async update(body: CreatePagesComponents): Promise<ResultPagesComponentsDto> {
        const pages = await this.pagesRepository.findOne({
            where: {
                id: body.idPage
            }
        })
        if (!pages) {
            return {isSuccess: false, message:'Страница не найдена'}
        }

        const bodyUpdate: PagesComponentsDto[] = body.fields.filter((el) => el.id)
        const bodyCreate: PagesComponentsDto[] = body.fields.filter((el) => !el.id)

        if (bodyCreate && bodyCreate.length) {
            for(let i = 0; i < bodyCreate.length; i++) {
                const entityes = this.pagesComponentsRepository.create({
                    ...bodyCreate[i],
                    pages
                })
                await this.pagesComponentsRepository.save(entityes)

                await this.pagesComponentsRepository.save(entityes)
            }
        }
        if (bodyUpdate && bodyUpdate.length) {
            for(let i = 0; i < bodyUpdate.length; i++) {
                await this.pagesComponentsRepository.save({
                    ...bodyUpdate[i]
                })
            }
        }

        return {isSuccess: true}
    }

    // Получение одного компонента
    async getOne(id: number): Promise<ResultPagesComponentsDto> {
        const entity = await this.pagesComponentsRepository.findOne({
            where: {
                id,
            }
        })

        return {isSuccess: true, entity}
    }

    // Получение компонентов страницы
    async get(id: number): Promise<PagesComponentsListDto> {
        console.log(id);
        const query = this.pagesComponentsRepository.createQueryBuilder('pagesComments')
        .andWhere('pagesComments.pages = :id', {id})
        .orderBy('pagesComments.order', 'ASC')

        return {
            isSuccess: true,
            entity: {
                count: await query.getCount(),
                entity: await query.getMany()
            }
        }
    }

    // Удаление компонента
    async delete(id: number): Promise<ResultDto> {
        const query = await this.pagesComponentsRepository
        .createQueryBuilder('comments')
        .where('id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return {
        isSuccess: !!query.affected,
        message: !!query.affected
            ? 'Запись удалена'
            : 'Не удалось удалить запись',
        };
    }

    // Массовое удаление компонентов
    async deleteIds(ids: number[]): Promise<ResultDto> {
        const query = await this.pagesComponentsRepository
        .createQueryBuilder('comments')
        .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
        })
        .softDelete()
        .execute();

        return {
        isSuccess: !!query.affected,
        message: !!query.affected
            ? 'Записи удалены'
            : 'Не удалось удалить записи',
        };
    }
}

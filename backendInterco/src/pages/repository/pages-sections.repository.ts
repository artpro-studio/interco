import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { PagesSectionsEntity } from "../entity/pages-sections.entity";
import { Repository } from "typeorm";
import { PagesSectionsDto } from "../dto/pages-sections/pages-sections.dto";
import { getFieldsPages, getFieldsSectionsValue } from "../helpers";
import { PagesSectionsQuery } from "../dto/pages-sections/response-pages-sections.dto";

@Injectable()
export class PagesSectionsRepository {
    constructor(
        @InjectRepository(PagesSectionsEntity) private readonly pagesSectionsRepository: Repository<PagesSectionsEntity>,
    ) {}

    async get(body: PagesSectionsQuery): Promise<{count: number, limit: number, entity: PagesSectionsDto[]}> {
        const fieldsValue = getFieldsSectionsValue('value')

        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.pagesSectionsRepository.createQueryBuilder('sections').take(take).skip(skip)
            .leftJoin('sections.value', 'value')
            .leftJoin('sections.value', 'pages')
            .addSelect(fieldsValue)
            .where('pages.id = :pagesId', {pagesId: body.pages});

        return {
            count: await query.getCount(),
            limit: take,
            entity: await query.getMany()
        }
    }

    async getOne(id: number): Promise<PagesSectionsDto> {
        const fieldsValue = getFieldsSectionsValue('value')
        const fieldsPages = getFieldsPages('pages')

        const query = this.pagesSectionsRepository.createQueryBuilder('sections')
            .leftJoin('sections.value', 'value')
            .leftJoin('sections.value', 'pages')
            .addSelect(fieldsValue)
            .addSelect(fieldsPages)
            .where('sections.id = :id', {id})

        return await query.getOne();
    }

    // Создание
    async create(body: PagesSectionsDto): Promise<PagesSectionsDto> {
        const entity = this.pagesSectionsRepository.create(body);
        await this.pagesSectionsRepository.save(entity);

        return entity
    }

     // Удаление записи
     async delete(id: number): Promise<boolean> {
        const query = await this.pagesSectionsRepository
        .createQueryBuilder('sections')
        .where('id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return !!query.affected
    }

    // Массовое удаление записей
    async deleteIds(ids: number[]): Promise<boolean> {
        const query = await this.pagesSectionsRepository
        .createQueryBuilder('sections')
        .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
        })
        .softDelete()
        .execute();

        return !!query.affected;
    }
}

import { InjectRepository } from "@nestjs/typeorm";
import { ILike, Repository } from "typeorm";
import { PagesIblockEntity } from "../entity/pages-iblock.entity";
import { PagesIblockDto } from "../dto/iblock/pages-iblock.dto";
import { BaseQuery } from "src/dto/reponse.dto";
import { PagesIblockQuery } from "../dto/iblock/response-iblock.dto";
import { Injectable } from "@nestjs/common";
import { getFieldsIblockFields, getFieldsIblockFieldsLabel } from "../helpers";

@Injectable()
export class PagesIblockRepository {
    constructor(
        @InjectRepository(PagesIblockEntity) private readonly pagesIblockRepository: Repository<PagesIblockEntity>
    ) {}

    async getOneForSlug(slug: string): Promise<PagesIblockDto> {
        const fieldsFields = getFieldsIblockFields('fields');
        const fieldsFieldsLabel = getFieldsIblockFieldsLabel('label');

        const query = this.pagesIblockRepository.createQueryBuilder('iblock')
            .leftJoin('iblock.fields', 'fields')
            .leftJoin('fields.label', 'label')
            .addSelect(fieldsFields)
            .addSelect(fieldsFieldsLabel)
            .where('iblock.slug = :slug', {slug});

        return await query.getOne()
    }

    async getOne(id: number): Promise<PagesIblockDto> {
        const fieldsFields = getFieldsIblockFields('fields');
        const fieldsFieldsLabel = getFieldsIblockFieldsLabel('label');

        const query = this.pagesIblockRepository.createQueryBuilder('iblock')
            .leftJoin('iblock.fields', 'fields')
            .leftJoin('fields.label', 'label')
            .addSelect(fieldsFields)
            .addSelect(fieldsFieldsLabel)
            .where('iblock.id = :id', {id});

        return await query.getOne()
    }

    async get(body: PagesIblockQuery): Promise<{count: number, limit: number, entity: PagesIblockDto[]}> {
        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.pagesIblockRepository.createQueryBuilder('iblock')
            .take(take)
            .skip(skip)
            .orderBy('iblock.id', 'ASC')
            .leftJoin('iblock.page', 'page');

        if (body.pageID) {
            query.andWhere('page.id = :pageID', {pageID: body.pageID})
        }
        if (body.search) {
            query.orWhere({
                name: ILike(`%${body.search}%`)
            }).orWhere({
                slug: ILike(`%${body.search}%`)
            })
        }

        return {
            limit: take,
            count: await query.getCount(),
            entity: await query.getMany()
        }
    }

    async create(body: PagesIblockDto): Promise<PagesIblockDto> {
        const entity = this.pagesIblockRepository.create(body);
        await this.pagesIblockRepository.save(entity);

        return entity;
    }

    async update(body: PagesIblockDto): Promise<PagesIblockDto> {
        const entity = await this.pagesIblockRepository.save(body);

        return entity;
    }

     async delete(id: number): Promise<boolean> {
        const query = await this.pagesIblockRepository
        .createQueryBuilder('iblock')
        .where('id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return !!query.affected;
    }

    // Массовое удаление страниц
    async deleteIds(ids: number[]): Promise<boolean> {
        const query = await this.pagesIblockRepository
        .createQueryBuilder('iblock')
        .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
        })
        .softDelete()
        .execute();

        return !!query.affected;
    }
}

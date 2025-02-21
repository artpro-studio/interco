import { InjectRepository } from "@nestjs/typeorm";
import { ILike, Repository } from "typeorm";
import { PagesIblockEntity } from "../entity/pages-iblock.entity";
import { PagesIblockDto } from "../dto/iblock/pages-iblock.dto";
import { BaseQuery } from "src/dto/reponse.dto";
import { PagesIblockQuery } from "../dto/iblock/response-iblock.dto";
import { Injectable } from "@nestjs/common";
import { getFieldsIblockFields, getFieldsIblockFieldsLabel, getFieldsIblockSectionValue, getFieldsPagesIblockRecordsFieldValue } from "../helpers";
import { PagesIblockSectionValueDto } from '../dto/iblock/section/pages-iblock-section-value.dto';

@Injectable()
export class PagesIblockRepository {
    constructor(
        @InjectRepository(PagesIblockEntity) private readonly pagesIblockRepository: Repository<PagesIblockEntity>
    ) {}

    async getOneForSlugsArray(slugs: string[]): Promise<PagesIblockDto[]> {
        try {
            const fieldsFields = getFieldsIblockFields('fields');
            const fieldsFieldsLabel = getFieldsIblockFieldsLabel('label');
            const fieldsSectionValue = getFieldsIblockSectionValue('sectionsValue')
            const fieldIblockRecordsField = getFieldsIblockFields('recordsField');
            const fieldIblockRecordsFieldValue = getFieldsPagesIblockRecordsFieldValue('recordsValue')

            const query = this.pagesIblockRepository.createQueryBuilder('iblock')
                .leftJoin('iblock.fields', 'fields')
                .leftJoin('fields.label', 'label')
                .leftJoin('iblock.sections', 'sections')
                .leftJoin('sections.value', 'sectionsValue')
                .addSelect(['sections.id'])
                .addSelect(fieldsSectionValue)
                .addSelect(fieldsFields)
                .addSelect(fieldsFieldsLabel)

                .leftJoin('iblock.records', 'records')
                .leftJoin('records.fields', 'recordsFields')
                .leftJoin('recordsFields.field', 'recordsField')
                .leftJoin('recordsFields.value', 'recordsValue')
                .addSelect(['records.id'])
                .addSelect(['recordsFields.id'])
                .addSelect(fieldIblockRecordsField)
                .addSelect(fieldIblockRecordsFieldValue)

                .andWhere('iblock.slug IN (:...slugs)', {slugs});

            return await query.getMany()
        } catch (e) {
            console.log(e)
        }
    }

    async getOneForSlug(slug: string): Promise<PagesIblockDto> {
        const fieldsFields = getFieldsIblockFields('fields');
        const fieldsFieldsLabel = getFieldsIblockFieldsLabel('label');
        const fieldsSectionValue = getFieldsIblockSectionValue('sectionsValue')
        const fieldIblockRecordsField = getFieldsIblockFields('recordsField');
        const fieldIblockRecordsFieldValue = getFieldsPagesIblockRecordsFieldValue('recordsValue')

        const query = this.pagesIblockRepository.createQueryBuilder('iblock')
            .leftJoin('iblock.fields', 'fields')
            .leftJoin('fields.label', 'label')
            .leftJoin('iblock.sections', 'sections')
            .leftJoin('sections.value', 'sectionsValue')
            .addSelect(['sections.id'])
            .addSelect(fieldsSectionValue)
            .addSelect(fieldsFields)
            .addSelect(fieldsFieldsLabel)

            .leftJoin('iblock.records', 'records')
            .leftJoin('records.fields', 'recordsFields')
            .leftJoin('recordsFields.field', 'recordsField')
            .leftJoin('recordsFields.value', 'recordsValue')
            .addSelect(['records.id'])
            .addSelect(['recordsFields.id'])
            .addSelect(fieldIblockRecordsField)
            .addSelect(fieldIblockRecordsFieldValue)
            .where('iblock.slug = :slug', {slug});

        return await query.getOne()
    }

    async getOne(id: number): Promise<PagesIblockDto> {
        const fieldsFields = getFieldsIblockFields('fields');
        const fieldsFieldsLabel = getFieldsIblockFieldsLabel('label');
        const fieldsSectionValue = getFieldsIblockSectionValue('sectionsValue')

        const query = this.pagesIblockRepository.createQueryBuilder('iblock')
            .leftJoin('iblock.fields', 'fields')
            .leftJoin('fields.label', 'label')
            .leftJoin('iblock.sections', 'sections')
            .leftJoin('sections.value', 'sectionsValue')
            .addSelect(['sections.id'])
            .addSelect(fieldsSectionValue)
            .addSelect(fieldsFields)
            .addSelect(fieldsFieldsLabel)
            .where('iblock.id = :id', {id});

        const entity = await query.getOne();
        // Добавим сортировку для разделов чтобы языки были по порядку создания
        entity.sections = entity.sections.map((el) => {
            el.value = el.value.sort((a: PagesIblockSectionValueDto, b: PagesIblockSectionValueDto) => a.id - b.id)
            return el;
        })

        return entity;
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

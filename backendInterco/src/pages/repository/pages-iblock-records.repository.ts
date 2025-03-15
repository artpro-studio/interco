import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { PagesIblockRecordsEntity } from '../entity/pages-iblock-records.entity';
import { Repository } from 'typeorm';
import { PagesIblockRecordsDto } from '../dto/iblock/records/pages-iblock-records.dto';
import {
    getFieldsIblockFields,
    getFieldsIblockSectionValue,
    getFieldsPagesIblockRecordsFieldValue,
} from '../helpers';
import {
    PagesIblockRecordsQuery,
    RecordsForSlugAndSectionQuery,
} from '../dto/iblock/records/response-iblock-records.dto';

@Injectable()
export class PagesIblockRecordsRepository {
    constructor(
        @InjectRepository(PagesIblockRecordsEntity)
        private readonly pagesIblockRecordsRepository: Repository<PagesIblockRecordsEntity>
    ) {}

    async getForSlugAndSection(body: RecordsForSlugAndSectionQuery): Promise<{
        count: number;
        limit: number;
        entity: PagesIblockRecordsDto[];
    }> {
        try {
            const fieldsFields = getFieldsIblockFields('field');
            const fieldsPagesIblockRecordsFieldValue =
                getFieldsPagesIblockRecordsFieldValue('value');
            const fieldsSectionValue =
                getFieldsIblockSectionValue('sectionsValue');

            const take = Number(body.limit);
            const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
            const query = this.pagesIblockRecordsRepository
                .createQueryBuilder('records')
                .take(take)
                .skip(skip)
                .orderBy('records.id', 'ASC')
                .leftJoin('records.fields', 'fields')
                .leftJoin('records.iblock', 'iblock')
                .leftJoin('fields.field', 'field')
                .leftJoin('fields.value', 'value')
                .leftJoin('records.sections', 'sections')
                .leftJoin('sections.value', 'sectionsValue')
                .addSelect(['sections.id'])
                .addSelect(fieldsSectionValue)
                .addSelect(['fields.id'])
                .addSelect(fieldsFields)
                .addSelect(fieldsPagesIblockRecordsFieldValue);

            if (body.slug) {
                query.andWhere('iblock.slug = :slug', { slug: body.slug });
            }

            if (body.sectionId) {
                query.andWhere('sections.id = :sectionId', {
                    sectionId: body.sectionId,
                });
            }

            return {
                limit: take,
                count: await query.getCount(),
                entity: await query.getMany(),
            };
        } catch (e) {
            console.log(e);
        }
    }

    async get(body: PagesIblockRecordsQuery): Promise<{
        count: number;
        limit: number;
        entity: PagesIblockRecordsDto[];
    }> {
        try {
            const fieldsFields = getFieldsIblockFields('field');
            const fieldsPagesIblockRecordsFieldValue =
                getFieldsPagesIblockRecordsFieldValue('value');
            const fieldsSectionValue =
                getFieldsIblockSectionValue('sectionsValue');

            const take = Number(body.limit);
            const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
            const query = this.pagesIblockRecordsRepository
                .createQueryBuilder('records')
                .take(take)
                .skip(skip)
                .orderBy('records.id', 'ASC')
                .leftJoin('records.fields', 'fields')
                .leftJoin('records.iblock', 'iblock')
                .leftJoin('fields.field', 'field')
                .leftJoin('fields.value', 'value')
                .leftJoin('records.sections', 'sections')
                .leftJoin('sections.value', 'sectionsValue')
                .addSelect(['sections.id'])
                .addSelect(fieldsSectionValue)
                .addSelect(['fields.id'])
                .addSelect(fieldsFields)
                .addSelect(fieldsPagesIblockRecordsFieldValue);

            if (body.iblockID) {
                query.andWhere('iblock.id = :iblockID', {
                    iblockID: body.iblockID,
                });
            }

            return {
                limit: take,
                count: await query.getCount(),
                entity: await query.getMany(),
            };
        } catch (e) {
            console.log(e);
        }
    }

    async getOne(id: number): Promise<PagesIblockRecordsDto> {
        const fieldsFields = getFieldsIblockFields('field');
        const fieldsPagesIblockRecordsFieldValue =
            getFieldsPagesIblockRecordsFieldValue('value');
        const fieldsSectionValue = getFieldsIblockSectionValue('sectionsValue');

        const query = this.pagesIblockRecordsRepository
            .createQueryBuilder('records')
            .leftJoin('records.fields', 'fields')
            .leftJoin('fields.field', 'field')
            .leftJoin('fields.value', 'value')
            .leftJoin('records.sections', 'sections')
            .leftJoin('sections.value', 'sectionsValue')
            .addSelect(['sections.id'])
            .addSelect(fieldsSectionValue)
            .addSelect(['fields.id'])
            .addSelect(fieldsFields)
            .addSelect(fieldsPagesIblockRecordsFieldValue)
            .where('records.id = :id', { id });

        return await query.getOne();
    }

    async create(body: PagesIblockRecordsDto): Promise<PagesIblockRecordsDto> {
        const entity = this.pagesIblockRecordsRepository.create(body);
        await this.pagesIblockRecordsRepository.save(entity);

        return entity;
    }

    async update(body: PagesIblockRecordsDto): Promise<PagesIblockRecordsDto> {
        const entity = await this.pagesIblockRecordsRepository.save(body);

        return entity;
    }
    async delete(id: number): Promise<boolean> {
        const query = await this.pagesIblockRecordsRepository
            .createQueryBuilder('records')
            .where('id = :id AND deletedAt is NULL', {
                id,
            })
            .softDelete()
            .execute();

        return !!query.affected;
    }

    // Массовое удаление страниц
    async deleteIds(ids: number[]): Promise<boolean> {
        const query = await this.pagesIblockRecordsRepository
            .createQueryBuilder('records')
            .where('id IN (:...ids) AND deletedAt is NULL', {
                ids,
            })
            .softDelete()
            .execute();

        return !!query.affected;
    }
}

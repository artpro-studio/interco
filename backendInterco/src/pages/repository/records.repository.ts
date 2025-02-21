import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { RecordsEntity } from "../entity/records.entity";
import { ILike, Repository } from "typeorm";
import { BaseQuery } from "src/dto/reponse.dto";
import { DropDownDto } from "src/dto/response-drop-down.dto";
import { CreateRecordsDto, FullRecordsDto, RecordsDto } from "../dto/records/create-records.dto";
import { RecordsQuery, RecordsQuerySlug } from "../dto/records/response-records.dto";
import { getFieldsRecordsDescriptionValue, getFieldsRecordsTitleValue, getFieldsSeoParams } from "../helpers";


@Injectable()
export class RecordsRepository {
    constructor(
        @InjectRepository(RecordsEntity) private readonly recordsRepository: Repository<RecordsEntity>,
    ) {}

    async getSelect(body: BaseQuery): Promise<{
        entity: DropDownDto[],
        count: number
    }> {
        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.recordsRepository.createQueryBuilder('records').take(take).skip(skip).orderBy('records.id', 'ASC');
        query.select('id', 'value').addSelect('title', 'label')

        return {
            count: await query.getCount(),
            entity: await query.execute()
        }
    }

    // Список записей
    async getForSlug(body: RecordsQuerySlug): Promise<{
        entity: FullRecordsDto[],
        count: number
    }> {
        const fieldsRecordsTitleValue = getFieldsRecordsTitleValue('titleValue');
        const fieldsRecordsDescriptionValue = getFieldsRecordsDescriptionValue('descriptionValue');
        const fieldsSeoParams = getFieldsSeoParams('seoParms');

        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.recordsRepository.createQueryBuilder('records').take(take).skip(skip)
            .orderBy('records.id', 'ASC')
            .leftJoinAndSelect('records.pages', 'pages')
            .leftJoin('records.seo', 'seo')
            .addSelect(['seo.id'])
            .leftJoin('seo.params', 'seoParms')
            .addSelect(fieldsSeoParams)

            .leftJoin('records.title', 'title')
            .addSelect(['title.id'])
            .leftJoin('title.value', 'titleValue')
            .addSelect(fieldsRecordsTitleValue)

            .leftJoin('records.description', 'description')
            .addSelect(['description.id'])
            .leftJoin('description.value', 'descriptionValue')
            .addSelect(fieldsRecordsDescriptionValue)

            .leftJoin('records.paramsField', 'paramsField')
            .leftJoin('paramsField.value', 'paramsFieldValue')
            .leftJoin('paramsField.params', 'params')
            .addSelect(['paramsField.id'])
            .addSelect(['paramsFieldValue.id', 'paramsFieldValue.lang', 'paramsFieldValue.value'])
            .addSelect(['params.id', 'params.name', 'params.slug', 'params.type']);

        if (body.slug) {
            query.andWhere('pages.slug = :slug', {
                slug: body.slug,
            })
        }

        if (body.search) {
            query.orWhere({
                title: ILike(`%${body.search}%`)
            }).orWhere({
                description: ILike(`%${body.search}%`)
            })
        }

        return {
            count: await query.getCount(),
            entity:  await query.getMany()
        }
    }

    // Список записей по id
    async get(body: RecordsQuery): Promise<{
        entity: FullRecordsDto[],
        count: number
    }> {
        const fieldsRecordsTitleValue = getFieldsRecordsTitleValue('titleValue');
        const fieldsRecordsDescriptionValue = getFieldsRecordsDescriptionValue('descriptionValue');
        const fieldsSeoParams = getFieldsSeoParams('seoParms');

        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.recordsRepository.createQueryBuilder('records').take(take).skip(skip)
        .orderBy('records.id', 'ASC')
        .leftJoinAndSelect('records.pages', 'pages')
        .leftJoin('records.seo', 'seo')
        .addSelect(['seo.id'])
        .leftJoin('seo.params', 'seoParms')
        .addSelect(fieldsSeoParams)

        .leftJoin('records.title', 'title')
        .addSelect(['title.id'])
        .leftJoin('title.value', 'titleValue')
        .addSelect(fieldsRecordsTitleValue)

        .leftJoin('records.description', 'description')
        .addSelect(['description.id'])
        .leftJoin('description.value', 'descriptionValue')
        .addSelect(fieldsRecordsDescriptionValue)

        .leftJoin('records.paramsField', 'paramsField')
        .leftJoin('paramsField.value', 'paramsFieldValue')
        .leftJoin('paramsField.params', 'params')
        .addSelect(['paramsField.id'])
        .addSelect(['paramsFieldValue.id', 'paramsFieldValue.lang', 'paramsFieldValue.value'])
        .addSelect(['params.id', 'params.name', 'params.slug', 'params.type']);
        if (body.id) {
            query.andWhere({
                pages: body.id
            })
        }

        if (body.search) {
            query.orWhere({
                title: ILike(`%${body.search}%`)
            }).orWhere({
                description: ILike(`%${body.search}%`)
            })
        }

        return {
            count: await query.getCount(),
            entity:  await query.getMany()
        }
    }

    async getOne(id: number): Promise<FullRecordsDto> {
        const fieldsRecordsTitleValue = getFieldsRecordsTitleValue('titleValue');
        const fieldsRecordsDescriptionValue = getFieldsRecordsDescriptionValue('descriptionValue');
        const fieldsSeoParams = getFieldsSeoParams('seoParms');

        const query = this.recordsRepository.createQueryBuilder('records')
            .leftJoinAndSelect('records.pages', 'pages')

            .leftJoin('records.seo', 'seo')
            .addSelect(['seo.id'])
            .leftJoin('seo.params', 'seoParms')
            .addSelect(fieldsSeoParams)

            .leftJoin('records.title', 'title')
            .addSelect(['title.id'])
            .leftJoin('title.value', 'titleValue')
            .addSelect(fieldsRecordsTitleValue)

            .leftJoin('records.description', 'description')
            .addSelect(['description.id'])
            .leftJoin('description.value', 'descriptionValue')
            .addSelect(fieldsRecordsDescriptionValue)

            .leftJoin('records.paramsField', 'paramsField')
            .leftJoin('paramsField.value', 'paramsFieldValue')
            .leftJoin('paramsField.params', 'params')
            .addSelect(['paramsField.id'])
            .addSelect(['paramsFieldValue.id', 'paramsFieldValue.lang', 'paramsFieldValue.value'])
            .addSelect(['params.id', 'params.name', 'params.slug', 'params.type'])
            .andWhere('records.id = :id', {id})

        return await query.getOne();
    }

    async getCreateOrUpdate(id: number): Promise<CreateRecordsDto> {
        const fieldsRecordsTitleValue = getFieldsRecordsTitleValue('titleValue');
        const fieldsRecordsDescriptionValue = getFieldsRecordsDescriptionValue('descriptionValue');
        const fieldsSeoParams = getFieldsSeoParams('seoParms');

        const query = this.recordsRepository.createQueryBuilder('records')
            .leftJoin('records.seo', 'seo')
            .addSelect(['seo.id'])
            .leftJoin('seo.params', 'seoParms')
            .addSelect(fieldsSeoParams)

            .leftJoin('records.title', 'title')
            .addSelect(['title.id'])
            .leftJoin('title.value', 'titleValue')
            .addSelect(fieldsRecordsTitleValue)

            .leftJoin('records.description', 'description')
            .addSelect(['description.id'])
            .leftJoin('description.value', 'descriptionValue')
            .addSelect(fieldsRecordsDescriptionValue)

            .leftJoin('records.pages', 'pages')
            .addSelect(['pages.id', 'pages.name'])

             .leftJoin('records.paramsField', 'paramsField')
            .leftJoin('paramsField.value', 'paramsFieldValue')
            .leftJoin('paramsField.params', 'params')
            .addSelect(['paramsField.id'])
            .addSelect(['paramsFieldValue.id', 'paramsFieldValue.lang', 'paramsFieldValue.value'])
            .addSelect(['params.id', 'params.name', 'params.slug', 'params.type'])
            .andWhere('records.id = :id', {id});

        const record = await query.getOne();

        const entity = {
            ...record,
            // TODO костыль посмотреть как преобразовать в DropDown
            pages: {value: record.pages.id, label: record.pages.name }
        }

        return entity
    }

    async create(record: FullRecordsDto): Promise<FullRecordsDto> {
        const entity = this.recordsRepository.create(record)
        await this.recordsRepository.save(entity)

        return entity;
    }

    async update(record: FullRecordsDto): Promise<FullRecordsDto> {
        return await this.recordsRepository.save(record)
    }

    // Удаление записи
    async delete(id: number): Promise<boolean> {
        const query = await this.recordsRepository
        .createQueryBuilder('records')
        .where('id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return !!query.affected
    }

    // Массовое удаление записей
    async deleteIds(ids: number[]): Promise<boolean> {
        const query = await this.recordsRepository
        .createQueryBuilder('records')
        .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
        })
        .softDelete()
        .execute();

        return !!query.affected;
    }
}

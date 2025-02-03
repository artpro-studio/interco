import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { RecordsEntity } from "../entity/records.entity";
import { ILike, Repository } from "typeorm";
import { BaseQuery } from "src/dto/reponse.dto";
import { DropDownDto } from "src/dto/response-drop-down.dto";
import { CreateRecordsDto, FullRecordsDto, RecordsDto } from "../dto/records/create-records.dto";
import { RecordsQuery, RecordsQuerySlug } from "../dto/records/response-records.dto";


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
        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.recordsRepository.createQueryBuilder('records').take(take).skip(skip)
        .orderBy('records.id', 'ASC')
        .leftJoinAndSelect('records.pages', 'pages')
        .leftJoin('records.paramsValue', 'paramsValue')
        .leftJoin('paramsValue.params', 'params')
        .addSelect(['paramsValue.id', 'paramsValue.value', 'paramsValue.valueJson'])
        .addSelect(['params.id', 'params.name', 'params.slug']);

        if (body.slug) {
            query.orWhere('pages.slug = :slug', {
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
        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.recordsRepository.createQueryBuilder('records').take(take).skip(skip)
        .orderBy('records.id', 'ASC')
        .leftJoinAndSelect('records.pages', 'pages')
        .leftJoin('records.paramsValue', 'paramsValue')
        .leftJoin('paramsValue.params', 'params')
        .addSelect(['paramsValue.id', 'paramsValue.value', 'paramsValue.valueJson'])
        .addSelect(['params.id', 'params.name', 'params.slug']);

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
        const query = this.recordsRepository.createQueryBuilder('records')
        .andWhere({
            id,
        })
        .leftJoinAndSelect('records.pages', 'pages')
        .leftJoin('records.paramsValue', 'paramsValue')
        .leftJoin('paramsValue.params', 'params')
        .addSelect(['paramsValue.id', 'paramsValue.value', 'paramsValue.valueJson'])
        .addSelect(['params.id', 'params.name', 'params.slug', 'params.type']);

        return await query.getOne();
    }

    async getCreateOrUpdate(id: number): Promise<CreateRecordsDto> {
        const query = this.recordsRepository.createQueryBuilder('records')
        .andWhere({
            id,
        })
        .leftJoin('records.pages', 'pages')
        .addSelect(['pages.id', 'pages.name'])
        .leftJoin('records.paramsValue', 'paramsValue')
        .addSelect(['paramsValue.id', 'paramsValue.value', 'paramsValue.valueJson'])
        .leftJoin('paramsValue.params', 'params')
        .addSelect(['params.id', 'params.name', 'params.slug', 'params.type']);

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

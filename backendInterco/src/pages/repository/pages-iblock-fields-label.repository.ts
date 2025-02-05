import { InjectRepository } from "@nestjs/typeorm";
import { ILike, Repository } from "typeorm";
import { BaseQuery } from "src/dto/reponse.dto";
import { PagesIBlockFieldsEntity } from "../entity/pages-iblock-fields.entity";
import { PagesIBlockFieldsDto } from "../dto/iblock/fields/pages-iblock-fields.dto";
import { PagesIblockFieldsLabelEntity } from "../entity/pages-iblock-fields-label.entity";
import { PagesIblockFieldsLabelDto } from '../dto/iblock/label/pages-iblock-fields-label.dto';
import { Injectable } from "@nestjs/common";

@Injectable()
export class PagesIblockFieldsLabelRepository {
    constructor(
        @InjectRepository(PagesIblockFieldsLabelEntity) private readonly pagesIblockFieldsLabelRepository: Repository<PagesIblockFieldsLabelEntity>
    ) {}

    async getOne(id: number): Promise<PagesIblockFieldsLabelDto> {
        const query = this.pagesIblockFieldsLabelRepository.createQueryBuilder('label')
            .where('label.id = :id', {id});

        return await query.getOne()
    }

    async get(body: BaseQuery): Promise<{count: number, limit: number, entity: PagesIblockFieldsLabelDto[]}> {
        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.pagesIblockFieldsLabelRepository.createQueryBuilder('label').take(take).skip(skip).orderBy('label.id', 'ASC');

        return {
            limit: take,
            count: await query.getCount(),
            entity: await query.getMany()
        }
    }

    async create(body: PagesIblockFieldsLabelDto): Promise<PagesIblockFieldsLabelDto> {
        const entity = this.pagesIblockFieldsLabelRepository.create(body);
        await this.pagesIblockFieldsLabelRepository.save(entity);

        return entity;
    }

    async update(body: PagesIblockFieldsLabelDto): Promise<PagesIblockFieldsLabelDto> {
        const entity = await this.pagesIblockFieldsLabelRepository.save(body);

        return entity;
    }

     async delete(id: number): Promise<boolean> {
        const query = await this.pagesIblockFieldsLabelRepository
        .createQueryBuilder('label')
        .where('id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return !!query.affected;
    }

    // Массовое удаление страниц
    async deleteIds(ids: number[]): Promise<boolean> {
        const query = await this.pagesIblockFieldsLabelRepository
        .createQueryBuilder('label')
        .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
        })
        .softDelete()
        .execute();

        return !!query.affected;
    }
}

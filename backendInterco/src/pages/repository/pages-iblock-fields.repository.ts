import { InjectRepository } from "@nestjs/typeorm";
import { ILike, Repository } from "typeorm";
import { BaseQuery } from "src/dto/reponse.dto";
import { PagesIBlockFieldsEntity } from "../entity/pages-iblock-fields.entity";
import { PagesIBlockFieldsDto } from "../dto/iblock/fields/pages-iblock-fields.dto";
import { Injectable } from "@nestjs/common";

@Injectable()
export class PagesIblockFieldsRepository {
    constructor(
        @InjectRepository(PagesIBlockFieldsEntity) private readonly pagesIBlockFieldsRepository: Repository<PagesIBlockFieldsEntity>
    ) {}

    async getOneForSlug(slug: string): Promise<PagesIBlockFieldsDto> {
        const query = this.pagesIBlockFieldsRepository.createQueryBuilder('fields')
            .where('fields.slug = :slug', {slug});

        return await query.getOne()
    }

    async getOne(id: number): Promise<PagesIBlockFieldsDto> {
        const query = this.pagesIBlockFieldsRepository.createQueryBuilder('fields')
            .where('fields.id = :id', {id});

        return await query.getOne()
    }

    async get(body: BaseQuery): Promise<{count: number, limit: number, entity: PagesIBlockFieldsDto[]}> {
        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.pagesIBlockFieldsRepository.createQueryBuilder('fields').take(take).skip(skip).orderBy('fields.id', 'ASC');

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

    async create(body: PagesIBlockFieldsDto): Promise<PagesIBlockFieldsDto> {
        const entity = this.pagesIBlockFieldsRepository.create(body);
        await this.pagesIBlockFieldsRepository.save(entity);

        return entity;
    }

    async update(body: PagesIBlockFieldsDto): Promise<PagesIBlockFieldsDto> {
        const entity = await this.pagesIBlockFieldsRepository.save(body);

        return entity;
    }

     async delete(id: number): Promise<boolean> {
        const query = await this.pagesIBlockFieldsRepository
        .createQueryBuilder('fields')
        .where('id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return !!query.affected;
    }

    // Массовое удаление страниц
    async deleteIds(ids: number[]): Promise<boolean> {
        const query = await this.pagesIBlockFieldsRepository
        .createQueryBuilder('fields')
        .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
        })
        .softDelete()
        .execute();

        return !!query.affected;
    }
}

import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { PagesIblockSectionValueEntity } from "../entity/pages-iblock-section-value.entity";
import { PagesIblockSectionValueDto } from '../dto/iblock/section/pages-iblock-section-value.dto';

@Injectable()
export class PagesIblockSectionValueRepository {
    constructor(
        @InjectRepository(PagesIblockSectionValueEntity) private readonly pagesIblockSectionValueRepository: Repository<PagesIblockSectionValueEntity>
    ) {}

    async create(body: PagesIblockSectionValueDto): Promise<PagesIblockSectionValueDto> {
        const entity = this.pagesIblockSectionValueRepository.create(body);
        await this.pagesIblockSectionValueRepository.save(entity);

        return entity;
    }

     async update(body: PagesIblockSectionValueDto): Promise<PagesIblockSectionValueDto> {
        const entity = await this.pagesIblockSectionValueRepository.save(body);

        return entity;
    }

    async delete(id: number): Promise<boolean> {
        const query = await this.pagesIblockSectionValueRepository
        .createQueryBuilder('section')
        .where('id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return !!query.affected;
    }

    // Массовое удаление страниц
    async deleteIds(ids: number[]): Promise<boolean> {
        const query = await this.pagesIblockSectionValueRepository
        .createQueryBuilder('section')
        .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
        })
        .softDelete()
        .execute();

        return !!query.affected;
    }
}

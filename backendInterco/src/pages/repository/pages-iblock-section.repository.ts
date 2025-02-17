import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { PagesIblockSectionEntity } from "../entity/pages-iblock-section.entity";
import { Repository } from "typeorm";
import { PagesIblockSectionDto } from "../dto/iblock/section/pages-iblock-section.dto";

@Injectable()
export class PagesIblockSectionRepository {
    constructor(
        @InjectRepository(PagesIblockSectionEntity) private readonly pagesIblockSectionRepository: Repository<PagesIblockSectionEntity>
    ) {}

    async create(body: PagesIblockSectionDto): Promise<PagesIblockSectionDto> {
        const entity = this.pagesIblockSectionRepository.create(body);
        await this.pagesIblockSectionRepository.save(entity);

        return entity;
    }

    async delete(id: number): Promise<boolean> {
        const query = await this.pagesIblockSectionRepository
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
        const query = await this.pagesIblockSectionRepository
        .createQueryBuilder('section')
        .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
        })
        .softDelete()
        .execute();

        return !!query.affected;
    }
}

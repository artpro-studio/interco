import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { PagesIblockRecordsFieldValueEntity } from "../entity/pages-iblock-records-field-value.entity";
import { PagesIblockRecordsFieldValueDto } from "../dto/iblock/records/field/pages-iblock-records-field-value.dto";

@Injectable()
export class PagesIblockRecordsFieldValueRepository {
    constructor(
        @InjectRepository(PagesIblockRecordsFieldValueEntity) private readonly pagesIblockRectodsFieldValueRepository: Repository<PagesIblockRecordsFieldValueEntity>
    ) {}

    async create(body: PagesIblockRecordsFieldValueDto): Promise<PagesIblockRecordsFieldValueDto> {
        const entity = this.pagesIblockRectodsFieldValueRepository.create(body);
        await this.pagesIblockRectodsFieldValueRepository.save(entity);
        return entity;
    }

    async update(body: PagesIblockRecordsFieldValueDto): Promise<PagesIblockRecordsFieldValueDto> {
        const entity = await this.pagesIblockRectodsFieldValueRepository.save(body);
        return entity;
    }
}

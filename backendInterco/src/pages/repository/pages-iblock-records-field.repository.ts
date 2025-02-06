import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { PagesIblockRecordsFieldEntity } from "../entity/pages-iblock-records-field.entity";
import { PagesIblockRecordsFieldDto } from '../dto/iblock/records/field/pages-iblock-records-field.dto';

@Injectable()
export class PagesIblockRecordsFieldRepository {
    constructor(
        @InjectRepository(PagesIblockRecordsFieldEntity) private readonly pagesIblockRectodsFieldRepository: Repository<PagesIblockRecordsFieldEntity>
    ) {}

    async create(body: PagesIblockRecordsFieldDto): Promise<PagesIblockRecordsFieldDto> {
        const entity = this.pagesIblockRectodsFieldRepository.create(body);
        await this.pagesIblockRectodsFieldRepository.save(entity);
        return entity;
    }
}

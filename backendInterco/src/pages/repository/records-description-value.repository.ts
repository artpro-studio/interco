import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { RecordsDescriptionValueEntity } from "../entity/records-description-value.entity";
import { RecordsDescriptionValueDto } from '../dto/records/records-description/records-description-value.dto';

@Injectable()
export class RecordsDescriptionValueRepository {
    constructor(
        @InjectRepository(RecordsDescriptionValueEntity) private readonly recordsDescriptionValueRepository: Repository<RecordsDescriptionValueEntity>,
    ) {}

    // Создание
    async create(body: RecordsDescriptionValueDto): Promise<RecordsDescriptionValueDto> {
        const entity = this.recordsDescriptionValueRepository.create(body);
        await this.recordsDescriptionValueRepository.save(entity);

        return entity
    }

    async update(body: RecordsDescriptionValueDto): Promise<RecordsDescriptionValueDto> {
        const entity = await this.recordsDescriptionValueRepository.save(body);
        return entity
    }
}

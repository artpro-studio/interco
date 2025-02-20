import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { RecordsTitleValueDto } from "../dto/records/records-title/records-title-value.dto";
import { RecordsTitleValueEntity } from "../entity/records-title-value.entity";

@Injectable()
export class RecordsTitleValueRepository {
    constructor(
        @InjectRepository(RecordsTitleValueEntity) private readonly recordsTitleValueRepository: Repository<RecordsTitleValueEntity>,
    ) {}

    // Создание
    async create(body: RecordsTitleValueDto): Promise<RecordsTitleValueDto> {
        const entity = this.recordsTitleValueRepository.create(body);
        await this.recordsTitleValueRepository.save(entity);

        return entity
    }

    async update(body: RecordsTitleValueDto): Promise<RecordsTitleValueDto> {
        const entity = await this.recordsTitleValueRepository.save(body);
        return entity
    }
}

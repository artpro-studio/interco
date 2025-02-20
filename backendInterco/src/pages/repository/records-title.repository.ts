import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { RecordsTitleEntity } from "../entity/records-title.entity";
import { RecordsTitleDto } from "../dto/records/records-title/records-title.dto";

@Injectable()
export class RecordsTitleRepository {
    constructor(
        @InjectRepository(RecordsTitleEntity) private readonly recordsTitleRepository: Repository<RecordsTitleEntity>,
    ) {}

    // Создание
    async create(body: RecordsTitleDto): Promise<RecordsTitleDto> {
        const entity = this.recordsTitleRepository.create(body);
        await this.recordsTitleRepository.save(entity);

        return entity
    }
}

import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { RecordsSeoEntity } from "../entity/records-seo.entity";
import { RecordsSeoDto } from "../dto/records/records-seo/records-seo.dto";

@Injectable()
export class RecordsSeoRepository {
    constructor(
        @InjectRepository(RecordsSeoEntity) private readonly rcordsSeoRepository: Repository<RecordsSeoEntity>,
    ) {}

    // Создание
    async create(body: RecordsSeoDto): Promise<RecordsSeoDto> {
        const entity = this.rcordsSeoRepository.create(body);
        await this.rcordsSeoRepository.save(entity);

        return entity
    }
}

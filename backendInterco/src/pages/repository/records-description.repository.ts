import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { RecordsDescriptionEntity } from "../entity/records-description.entity";
import { RecordsDescriptionDto } from '../dto/records/records-description/records-description.dto';

@Injectable()
export class RecordsDescriptionRepository {
    constructor(
        @InjectRepository(RecordsDescriptionEntity) private readonly recordsDescriptionRepository: Repository<RecordsDescriptionEntity>,
    ) {}

    // Создание
    async create(body: RecordsDescriptionDto): Promise<RecordsDescriptionDto> {
        const entity = this.recordsDescriptionRepository.create(body);
        await this.recordsDescriptionRepository.save(entity);

        return entity
    }
}

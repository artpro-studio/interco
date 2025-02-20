import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { IFieldTypeSeo, ILangPages } from "../interface";
import { RecordsSeoParamsEntity } from "../entity/records-seo-params.entity";
import { RecordsSeoParamsDto } from "../dto/records/records-seo/records-seo-params.dto";

@Injectable()
export class RecordsSeoParamsRepository {
    constructor(
        @InjectRepository(RecordsSeoParamsEntity) private readonly recordsSeoParamsEntityRepository: Repository<RecordsSeoParamsEntity>,
    ) {}

    async getParamForPage(recordsSeoID: number, lang: ILangPages, field: IFieldTypeSeo): Promise<RecordsSeoParamsDto> {
        const query = this.recordsSeoParamsEntityRepository.createQueryBuilder('params')
            .leftJoin('params.recordsSeo', 'recordsSeo')
            .andWhere('recordsSeo.id = :recordsSeoID AND params.lang = :lang AND params.fieldType = :field', {recordsSeoID, lang, field})

        return await query.getOne();
    }

    // Создание
    async create(body: RecordsSeoParamsDto): Promise<RecordsSeoParamsDto> {
        const entity = this.recordsSeoParamsEntityRepository.create(body);
        await this.recordsSeoParamsEntityRepository.save(entity);

        return entity
    }

    async update(body: RecordsSeoParamsDto): Promise<RecordsSeoParamsDto> {
        const entity = await this.recordsSeoParamsEntityRepository.save(body);
        return entity
    }
}

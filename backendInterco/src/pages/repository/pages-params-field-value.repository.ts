import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { PagesParamsFieldValueEntity } from "../entity/pages-params-field-value.entity";
import { Repository } from "typeorm";
import { PagesParamsFieldValueDto } from "../dto/pages-params-field/pages-params-field-value.dto";

@Injectable()
export class PagesParamsFieldValueRepository {
    constructor(
        @InjectRepository(PagesParamsFieldValueEntity) private readonly pagesParamsFieldValueEntityRepository: Repository<PagesParamsFieldValueEntity>
    ) {}

    async create(body: PagesParamsFieldValueDto): Promise<PagesParamsFieldValueDto> {
        const entity = this.pagesParamsFieldValueEntityRepository.create(body);
        await this.pagesParamsFieldValueEntityRepository.save(entity);
        return entity;
    }

    async update(body: PagesParamsFieldValueDto): Promise<PagesParamsFieldValueDto> {
        const entity = await this.pagesParamsFieldValueEntityRepository.save(body);
        return entity;
    }
}

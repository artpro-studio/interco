import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { PagesSeoParamsEntity } from "../entity/pages-seo-params.entity";
import { PagesSeoParamsDto } from "../dto/seo/pages-seo-params.dto";
import { IFieldTypeSeo, ILangTypeSeo } from "../interface";

@Injectable()
export class PagesSeoParamsRepository {
    constructor(
        @InjectRepository(PagesSeoParamsEntity) private readonly pagesSeoParamsRepository: Repository<PagesSeoParamsEntity>,
    ) {}

    async getParamForPage(pageSeoID: number, lang: ILangTypeSeo, field: IFieldTypeSeo): Promise<PagesSeoParamsDto> {
        const query = this.pagesSeoParamsRepository.createQueryBuilder('params')
            .leftJoin('params.pagesSeo', 'pagesSeo')
            .andWhere('pagesSeo.id = :pageSeoID AND params.lang = :lang AND params.fieldType = :field', {pageSeoID, lang, field})

        return await query.getOne();
    }

    // Создание
    async create(body: PagesSeoParamsDto): Promise<PagesSeoParamsDto> {
        const entity = this.pagesSeoParamsRepository.create(body);
        await this.pagesSeoParamsRepository.save(entity);

        return entity
    }

    async update(body: PagesSeoParamsDto): Promise<PagesSeoParamsDto> {
        const entity = await this.pagesSeoParamsRepository.save(body);
        return entity
    }
}

import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { PagesSectionsValueEntity } from "../entity/pages-sections-value.entity";
import { Repository } from "typeorm";
import { PagesSectionsValueDto } from "../dto/pages-sections/pages-sections-value.dto";

@Injectable()
export class PagesSectionsValueRepository {
    constructor(
        @InjectRepository(PagesSectionsValueEntity) private readonly pagesSectionsValueRepository: Repository<PagesSectionsValueEntity>
    ) {}

    async create(body: PagesSectionsValueDto): Promise<PagesSectionsValueDto> {
        const entity = this.pagesSectionsValueRepository.create(body);
        await this.pagesSectionsValueRepository.save(entity);
        return entity;
    }

    async update(body: PagesSectionsValueDto): Promise<PagesSectionsValueDto> {
        const entity = await this.pagesSectionsValueRepository.save(body);
        return entity;
    }
}

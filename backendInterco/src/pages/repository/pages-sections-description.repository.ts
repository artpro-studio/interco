import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { PagesSectionsTitleValueEntity } from "../entity/pages-sections-title.entity";
import { PagesSectionsTitleValueDto } from '../dto/pages-sections/pages-sections-title-value.dto';
import { PagesSectionsDescriptionValueEntity } from "../entity/pages-sections-description.entity";
import { PagesSectionsDescriptionValueDto } from '../dto/pages-sections/pages-sections-description-value.dto';

@Injectable()
export class PagesSectionsDescriptionValueRepository {
    constructor(
        @InjectRepository(PagesSectionsDescriptionValueEntity) private readonly pagesSectionsDescriptionValueRepository: Repository<PagesSectionsDescriptionValueEntity>
    ) {}

    async create(body: PagesSectionsDescriptionValueDto): Promise<PagesSectionsDescriptionValueDto> {
        const entity = this.pagesSectionsDescriptionValueRepository.create(body);
        await this.pagesSectionsDescriptionValueRepository.save(entity);
        return entity;
    }

    async update(body: PagesSectionsDescriptionValueDto): Promise<PagesSectionsDescriptionValueDto> {
        const entity = await this.pagesSectionsDescriptionValueRepository.save(body);
        return entity;
    }
}

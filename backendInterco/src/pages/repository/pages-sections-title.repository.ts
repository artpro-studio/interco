import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { PagesSectionsTitleValueEntity } from "../entity/pages-sections-title.entity";
import { PagesSectionsTitleValueDto } from '../dto/pages-sections/pages-sections-title-value.dto';

@Injectable()
export class PagesSectionsTitleValueRepository {
    constructor(
        @InjectRepository(PagesSectionsTitleValueEntity) private readonly pagesSectionsTitleValueRepository: Repository<PagesSectionsTitleValueEntity>
    ) {}

    async create(body: PagesSectionsTitleValueDto): Promise<PagesSectionsTitleValueDto> {
        const entity = this.pagesSectionsTitleValueRepository.create(body);
        await this.pagesSectionsTitleValueRepository.save(entity);
        return entity;
    }

    async update(body: PagesSectionsTitleValueDto): Promise<PagesSectionsTitleValueDto> {
        const entity = await this.pagesSectionsTitleValueRepository.save(body);
        return entity;
    }
}

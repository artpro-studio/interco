import { Injectable } from "@nestjs/common";
import { PagesSeoEntity } from "../entity/pages-seo.entity";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { PagesSeoDto } from "../dto/seo/pages-seo.dto";
import { getFieldsSeoParams } from "../helpers";

@Injectable()
export class PagesSeoRepository {
    constructor(
        @InjectRepository(PagesSeoEntity) private readonly pagesSeoRepository: Repository<PagesSeoEntity>,
    ) {}

    async getForPageSlug(pageSlug: string): Promise<PagesSeoDto> {
        const fieldsSeoParams = getFieldsSeoParams('params')
        const query = this.pagesSeoRepository.createQueryBuilder('seo')
            .leftJoin('seo.page', 'page')
            .leftJoin('seo.params', 'params')
            .addSelect(fieldsSeoParams)
            .where('page.slug = :pageSlug', {pageSlug})

        return await query.getOne();
    }

    // Создание
    async create(body: PagesSeoDto): Promise<PagesSeoDto> {
        const entity = this.pagesSeoRepository.create(body);
        await this.pagesSeoRepository.save(entity);

        return entity
    }
}

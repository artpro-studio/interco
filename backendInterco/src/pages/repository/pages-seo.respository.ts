import { Injectable } from "@nestjs/common";
import { PagesSeoEntity } from "../entity/pages-seo.entity";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { PagesSeoDto } from "../dto/seo/pages-seo.dto";

@Injectable()
export class PagesSeoRepository {
    constructor(
        @InjectRepository(PagesSeoEntity) private readonly pagesSeoRepository: Repository<PagesSeoEntity>,
    ) {}

    // Создание
    async create(body: PagesSeoDto): Promise<PagesSeoDto> {
        const entity = this.pagesSeoRepository.create(body);
        await this.pagesSeoRepository.save(entity);

        return entity
    }
}

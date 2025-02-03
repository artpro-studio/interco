import { InjectRepository } from "@nestjs/typeorm";
import { PagesEntity } from "../entity/pages.entity";
import { Repository } from "typeorm";
import { FullPagesDto } from "../dto/pages/create-pages.dto";
import { Injectable } from "@nestjs/common";

@Injectable()
export class PagesRepository {
    constructor(
        @InjectRepository(PagesEntity) private readonly pagesRepository: Repository<PagesEntity>,
    ) {}

    // Получение одной страницы
    async getOne(id: number): Promise<FullPagesDto> {
        const query = this.pagesRepository.createQueryBuilder('pages')
        .where('pages.id = :id' , {id})

        return await query.getOne();
    }
}

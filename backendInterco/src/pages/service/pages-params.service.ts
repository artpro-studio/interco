import { Injectable } from "@nestjs/common";
import { CreatePagesParamsDto } from "../dto/pages-params/pages-params.dto";
import { ResultPagesParamsDto } from "../dto/pages-params/response-pages-params.dto";
import { PagesParamsRepository } from '../repository/pages-params.repository';
import { PagesService } from "./pages.service";

@Injectable()
export class PagesParamsService {
    constructor(
        private readonly pagesParamsRepository: PagesParamsRepository,
        private readonly pagesService: PagesService,
    ) {}

    async create(body: CreatePagesParamsDto): Promise<ResultPagesParamsDto> {
       try {
            const pages = (await this.pagesService.getOne(body.pagesId)).entity;
            const entity = await this.pagesParamsRepository.create({
                ...body,
                pages
            })

            return {isSuccess: true, entity}

       } catch (error) {
            console.log(error);
       }
    }

    async update(body: CreatePagesParamsDto): Promise<ResultPagesParamsDto> {
        const pages = (await this.pagesService.getOne(body.pagesId)).entity;
        const entity = await this.pagesParamsRepository.update({
            ...body,
            pages,
        })

        return {isSuccess: true, entity}
    }
}

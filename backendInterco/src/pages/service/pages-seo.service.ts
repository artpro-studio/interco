import { Injectable } from "@nestjs/common";
import { PagesSeoRepository } from '../repository/pages-seo.respository';
import { PagesRepository } from "../repository/pages.repository";
import { ResultPagesSeoPublicDto } from "../dto/seo/response-seo";

@Injectable()
export class PagesSeoService {
    constructor(
        private readonly pagesRepository: PagesRepository,
    ) {}

    async getPageSeoParamsPublic(pageSlug: string): Promise<ResultPagesSeoPublicDto> {
        console.log(pageSlug);
        const page = await this.pagesRepository.getForSlug(pageSlug);
        const result = {};
        page.seo.params.forEach((el) => {
            if (!result[el.fieldType]) {
                result[el.fieldType] = {};
            }
            result[el.fieldType][el.lang] = el.content;
        })

        return {
            isSuccess: true,
            entity: result
        };
    }
}

import { Injectable } from "@nestjs/common";
import { PagesSeoRepository } from '../repository/pages-seo.respository';

@Injectable()
export class PagesSeoService {
    constructor(
        private readonly pagesSeoRepository: PagesSeoRepository,
    ) {}

    async getPageSeoParamsPublic(pageSlug: string): Promise<any> {
        const seo = await this.pagesSeoRepository.getForPageSlug(pageSlug);

        const result = {};
        seo.params.forEach((el) => {
            result[el.lang] = el.content;
        })

        return result;
    }
}

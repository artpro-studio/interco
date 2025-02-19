import { Injectable } from "@nestjs/common";
import { PagesRepository } from '../repository/pages.repository';
import { publicFormatterAttribute, publicFormatterList, publicFormatterSections } from "../helpers/parseRecord";
import { ResultPagesPublicDto } from "../dto/pages/pages-public.dto";

@Injectable()
export class PagesPublicService {
    constructor(
        private readonly pagesRepository: PagesRepository,
    ){}

    async getForSlugPublic(slug: string): Promise<ResultPagesPublicDto> {
        const result = await this.pagesRepository.getForSlugPublic(slug);
        result.iblocks = result.iblocks.map((el) => {
            return {
                ...el,
                attributes: el.attributes ? publicFormatterAttribute(el.attributes) : null,
                records: publicFormatterList(el.records),
                sections: publicFormatterSections(el.sections)
            }
        })

        return {
            isSuccess: true,
            entity: result as any
        }
    }
}

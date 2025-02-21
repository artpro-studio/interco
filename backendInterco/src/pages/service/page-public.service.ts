import { Injectable } from "@nestjs/common";
import { PagesRepository } from '../repository/pages.repository';
import { publicFormatterAttribute, publicFormatterList, publicFormatterSections } from "../helpers/parseRecord";
import { ResultPagesPublicDto } from "../dto/pages/pages-public.dto";
import { PagesIblockRepository } from '../repository/pages-iblock.repository';
import { PagesIblockPublicDto, ResultPageIblockPublicDto, ResultPageIblockPublicListDto } from "../dto/iblock/pages-iblock-public.dto";

@Injectable()
export class PagesPublicService {
    constructor(
        private readonly pagesRepository: PagesRepository,
        private readonly pagesIblockRepository: PagesIblockRepository
    ){}

    async getIblcokForSlugPublic(slug: string): Promise<ResultPageIblockPublicDto> {
        const result = await this.pagesIblockRepository.getOneForSlug(slug);

        return {
            isSuccess: true,
            entity: {
                ...result,
                attributes: result.attributes ? publicFormatterAttribute(result.attributes) : null,
                records: publicFormatterList(result.records),
                sections: publicFormatterSections(result.sections)
            }
        }
    }

    async getIblcokForSlugArrayPublic(slugs: string[]): Promise<ResultPageIblockPublicListDto> {
        const result = await this.pagesIblockRepository.getOneForSlugsArray(Array.isArray(slugs) ? slugs : [slugs]);
        const entity: PagesIblockPublicDto[] = [];
        result.forEach((el) => {
            entity.push({
                ...el,
                attributes: el.attributes ? publicFormatterAttribute(el.attributes) : null,
                records: publicFormatterList(el.records),
                sections: publicFormatterSections(el.sections)
            })
        })

        return {
            isSuccess: true,
            entity
        }
    }

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

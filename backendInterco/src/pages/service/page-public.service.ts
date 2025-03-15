import { Injectable } from '@nestjs/common';
import { PagesRepository } from '../repository/pages.repository';
import {
    publicFormatterAttribute,
    publicFormatterList,
    publicFormatterPagesSections,
    publicFormatterSections,
} from '../helpers/parseRecord';
import { ResultPagesPublicDto } from '../dto/pages/pages-public.dto';
import { PagesIblockRepository } from '../repository/pages-iblock.repository';
import {
    PagesIblockPublicDto,
    ResultPageIblockPublicDto,
    ResultPageIblockPublicListDto,
} from '../dto/iblock/pages-iblock-public.dto';
import { PagesSectionsRepository } from '../repository/pages-sections.repository';
import { PublicPagesSectionsListDto } from '../dto/pages-sections/pages-sections-public.dto';
import {
    PagesIblockRecordsListDto,
    RecordsForSlugAndSectionQuery,
} from '../dto/iblock/records/response-iblock-records.dto';
import { PagesIblockRecordsRepository } from '../repository/pages-iblock-records.repository';
import { PagesIblockSectionRepository } from '../repository/pages-iblock-section.repository';
import { ResultPagesIblockSectionDto } from '../dto/iblock/section/response-iblock-section.dto';

@Injectable()
export class PagesPublicService {
    constructor(
        private readonly pagesRepository: PagesRepository,
        private readonly pagesIblockRepository: PagesIblockRepository,
        private readonly pagesSectionsRepository: PagesSectionsRepository,
        private readonly pagesIblockRecordsRepository: PagesIblockRecordsRepository,
        private readonly pagesIblockSectionRepository: PagesIblockSectionRepository
    ) {}

    async getIblockSections(
        slug: string
    ): Promise<ResultPagesIblockSectionDto> {
        const result = await this.pagesIblockSectionRepository.getForIblockSlug(
            slug
        );

        return {
            isSuccess: true,
            entity: publicFormatterSections(result),
        };
    }

    // Получение запией у Iblock c фильтром по slug и section ID
    async getRecordsForSlugAndSection(
        body: RecordsForSlugAndSectionQuery
    ): Promise<PagesIblockRecordsListDto> {
        const result =
            await this.pagesIblockRecordsRepository.getForSlugAndSection(body);

        return {
            isSuccess: true,
            entity: {
                count: result.count,
                limit: result.limit,
                entity: publicFormatterList(result.entity),
            },
        };
    }

    async getPagesSections(slug: string): Promise<PublicPagesSectionsListDto> {
        const result = await this.pagesSectionsRepository.getSlugForPages(slug);

        return {
            isSuccess: true,
            entity: publicFormatterPagesSections(result),
        };
    }

    async getIblcokForSlugPublic(
        slug: string
    ): Promise<ResultPageIblockPublicDto> {
        const result = await this.pagesIblockRepository.getOneForSlug(slug);

        return {
            isSuccess: true,
            entity: {
                ...result,
                attributes: result.attributes
                    ? publicFormatterAttribute(result.attributes)
                    : null,
                records: publicFormatterList(result.records),
                sections: publicFormatterSections(result.sections),
            },
        };
    }

    async getIblcokForSlugArrayPublic(
        slugs: string[]
    ): Promise<ResultPageIblockPublicListDto> {
        const result = await this.pagesIblockRepository.getOneForSlugsArray(
            Array.isArray(slugs) ? slugs : [slugs]
        );
        const entity: PagesIblockPublicDto[] = [];
        result.forEach((el) => {
            entity.push({
                ...el,
                attributes: el.attributes
                    ? publicFormatterAttribute(el.attributes)
                    : null,
                records: publicFormatterList(el.records),
                sections: publicFormatterSections(el.sections),
            });
        });

        return {
            isSuccess: true,
            entity,
        };
    }

    async getForSlugPublic(slug: string): Promise<ResultPagesPublicDto> {
        const result = await this.pagesRepository.getForSlugPublic(slug);
        result.iblocks = result.iblocks.map((el) => {
            return {
                ...el,
                attributes: el.attributes
                    ? publicFormatterAttribute(el.attributes)
                    : null,
                records: publicFormatterList(el.records),
                sections: publicFormatterSections(el.sections),
            };
        });

        return {
            isSuccess: true,
            entity: result as any,
        };
    }
}

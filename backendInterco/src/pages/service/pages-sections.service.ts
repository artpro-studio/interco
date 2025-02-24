import { Injectable } from "@nestjs/common";
import { PagesSectionsRepository } from "../repository/pages-sections.repository";
import { PagesSectionsDto } from "../dto/pages-sections/pages-sections.dto";
import { PagesRepository } from '../repository/pages.repository';
import { ResultPagesSectionsDto } from "../dto/pages-sections/response-pages-sections.dto";
import { compareValuesByCommonKeys } from "../helpers";
import { PagesSectionsTitleValueRepository } from "../repository/pages-sections-title.repository";
import { PagesSectionsDescriptionValueRepository } from "../repository/pages-sections-description.repository";

@Injectable()
export class PagesSectionsService {
    constructor(
        private readonly pagesSectionsRepository: PagesSectionsRepository,
        private readonly pagesSectionsTitleValueRepository: PagesSectionsTitleValueRepository,
        private readonly pagesSectionsDescriptionValueRepository: PagesSectionsDescriptionValueRepository,

        private readonly pagesRepository: PagesRepository,
    ){}

    async create(body: PagesSectionsDto): Promise<ResultPagesSectionsDto> {
        const pages = await this.pagesRepository.getOne(body.pages.id);
        const section = await this.pagesSectionsRepository.create({
            ...body,
            pages
        });

        if (body.title?.length) {
            body.title?.forEach((el) => {
                this.pagesSectionsTitleValueRepository.create({
                    ...el,
                    section
                })
            })
        }

        if (body.description?.length) {
            body.description?.forEach((el) => {
                this.pagesSectionsDescriptionValueRepository.create({
                    ...el,
                    section
                })
            })
        }

        return {
            isSuccess: true,
            entity: section
        }
    }

    async update(body: PagesSectionsDto): Promise<ResultPagesSectionsDto> {
        const section = await this.pagesSectionsRepository.getOne(body.id);

        if (body.title?.length) {
            body.title?.forEach((el) => {
                const findEl = section.title?.find((item) => item.id === el.id)
                if (findEl) {
                    if (!compareValuesByCommonKeys(findEl, el)) {
                        this.pagesSectionsTitleValueRepository.update({
                            ...findEl,
                            ...el
                        })
                    }
                } else {
                    this.pagesSectionsTitleValueRepository.create({
                        ...el,
                        section
                    })
                }

            })
        }

        if (body.description?.length) {
            body.description?.forEach((el) => {
                const findEl = section.description?.find((item) => item.id === el.id)
                if (findEl) {
                    if (!compareValuesByCommonKeys(findEl, el)) {
                        this.pagesSectionsDescriptionValueRepository.update({
                            ...findEl,
                            ...el
                        })
                    }
                } else {
                    this.pagesSectionsDescriptionValueRepository.create({
                        ...el,
                        section
                    })
                }

            })
        }

        return {
            isSuccess: true,
            entity: section
        }
    }
}

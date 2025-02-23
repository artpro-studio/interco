import { Injectable } from "@nestjs/common";
import { PagesSectionsRepository } from "../repository/pages-sections.repository";
import { PagesSectionsValueRepository } from "../repository/pages-sections-value.repository";
import { PagesSectionsDto } from "../dto/pages-sections/pages-sections.dto";
import { PagesRepository } from '../repository/pages.repository';
import { ResultPagesSectionsDto } from "../dto/pages-sections/response-pages-sections.dto";
import { compareValuesByCommonKeys } from "../helpers";

@Injectable()
export class PagesSectionsService {
    constructor(
        private readonly pagesSectionsRepository: PagesSectionsRepository,
        private readonly pagesSectionsValueRepository: PagesSectionsValueRepository,

        private readonly pagesRepository: PagesRepository,
    ){}

    async create(body: PagesSectionsDto): Promise<ResultPagesSectionsDto> {
        const pages = await this.pagesRepository.getOne(body.pages.id);
        const section = await this.pagesSectionsRepository.create({
            ...body,
            pages
        });

        if (body.value?.length) {
            body.value?.forEach((el) => {
                this.pagesSectionsValueRepository.create({
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

        if (body.value?.length) {
            body.value?.forEach((el) => {
                const findEl = section.value?.find((item) => item.id === el.id)
                if (findEl) {
                    if (!compareValuesByCommonKeys(findEl, el)) {
                        this.pagesSectionsValueRepository.update({
                            ...findEl,
                            ...el
                        })
                    }
                } else {
                    this.pagesSectionsValueRepository.create({
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

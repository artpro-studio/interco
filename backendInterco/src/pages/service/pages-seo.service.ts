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
         try {
            const page = await this.pagesRepository.getForSlug(pageSlug);
            if (!page) {
                return {isSuccess: false, message:'Страница не найдена', entity: null}
            }
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
        } catch (error) {
            return {
                isSuccess: true,
                entity: {
                    description: {
                        "en-US": "",
                        "ru-RU": "",
                        "zh-CN": ""
                    },
                    title: {
                        "en-US": "",
                        "ru-RU": "",
                        "zh-CN": ""
                    },
                    keywords: {
                        "en-US": "",
                        "ru-RU": "",
                        "zh-CN": ""
                    }
                }
            }
        }

    }
}

import { Injectable } from "@nestjs/common";
import { PagesIblockRepository } from '../repository/pages-iblock.repository';
import { PagesIblockFieldsRepository } from "../repository/pages-iblock-fields.repository";
import { PagesIblockFieldsLabelRepository } from "../repository/pages-iblock-fields-label.repository";
import { PagesIblockDto } from "../dto/iblock/pages-iblock.dto";
import { ResultPagesIblockDto } from "../dto/iblock/response-iblock.dto";
import e from "express";
import { compareValuesByCommonKeys } from "../helpers";

@Injectable()
export class PagesIblockService {
    constructor(
        private readonly pagesIblockRepository: PagesIblockRepository,
        private readonly pagesIblockFieldsRepository: PagesIblockFieldsRepository,
        private readonly pagesIblockFieldsLabelRepository: PagesIblockFieldsLabelRepository,
    ) {}

    async create(body: PagesIblockDto): Promise<ResultPagesIblockDto> {
        const getFields = await this.pagesIblockRepository.getOneForSlug(body.slug);

        if (getFields) {
            return {isSuccess: false, message: 'Такой блок с символьным кодом уже есть', entity: null}
        }

        const {fields, ...iBlockBody} = body;
        const iblock = await this.pagesIblockRepository.create(iBlockBody);

        if (fields.length) {
            // Создаем fields
            for(let elField of fields) {
                const field = await this.pagesIblockFieldsRepository.create({
                    ...elField,
                    iblock
                });

                // Создаем label для fields
                elField.label.forEach((el) => {
                    this.pagesIblockFieldsLabelRepository.create({
                        ...el,
                        field
                    })
                })
            }
        }

        return {
            isSuccess: true,
            entity: iblock,
        }
    }

    async update(body: PagesIblockDto): Promise<ResultPagesIblockDto> {
        const getIblock = await this.pagesIblockRepository.getOne(body.id);

        if (!getIblock) {
            return {isSuccess: false, message: 'Инфоблок не найден', entity: null}
        }

        const {fields, ...iBlockBody} = body;
        const iblock = await this.pagesIblockRepository.update({
            ...getIblock,
            ...iBlockBody,
        });

        if (fields.length) {
            // Создаем fields
            for(let elField of fields) {
                // Проверяем создан уже field или нет
                if (!elField.id) {
                    const field = await this.pagesIblockFieldsRepository.create({
                        ...elField,
                        iblock
                    });

                    // Создаем label для fields
                    elField.label.forEach((el) => {
                        this.pagesIblockFieldsLabelRepository.create({
                            ...el,
                            field
                        })
                    })
                } else {
                    const getFields = getIblock.fields.find((el) => el.id === el.id);
                    if (!compareValuesByCommonKeys(getFields, elField)) {
                        await this.pagesIblockFieldsRepository.update({
                            ...elField,
                            iblock
                        });
                    }

                    elField.label.forEach((el) => {
                        if (!el.id) {
                            this.pagesIblockFieldsLabelRepository.create({
                                ...el,
                                field: getFields,
                            })
                        } else {
                            const getLang = getFields.label.find((elLabel) => elLabel.id === el.id);
                            if (!compareValuesByCommonKeys(getLang, el)) {
                                this.pagesIblockFieldsLabelRepository.update({
                                    ...el,
                                })
                            }
                        }
                    })
                }
            }
        }

        return {
            isSuccess: true,
            entity: iblock,
        }
    }
}

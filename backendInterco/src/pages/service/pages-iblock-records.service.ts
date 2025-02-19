import { Injectable } from "@nestjs/common";
import { PagesIblockRecordsRepository } from '../repository/pages-iblock-records.repository';
import { CreatePagesIblockRecordDto } from "../dto/iblock/records/create-pages-iblock-records";
import { PagesIblockRepository } from '../repository/pages-iblock.repository';
import { PagesIblockFieldsRepository } from '../repository/pages-iblock-fields.repository';
import { PagesIblockRecordsFieldDto } from '../dto/iblock/records/field/pages-iblock-records-field.dto';
import { PagesIblockRecordsFieldValueDto } from '../dto/iblock/records/field/pages-iblock-records-field-value.dto';
import { PagesIblockRecordsFieldRepository } from '../repository/pages-iblock-records-field.repository';
import { PagesIblockRecordsFieldValueRepository } from "../repository/pages-iblock-records-field-value.repository";
import { PagesIblockRecordsPublicListDto, PagesIblockRecordsQuery, ResultPagesIblockRecordsPublicDto } from "../dto/iblock/records/response-iblock-records.dto";
import { publicFormatterList, publicFormatterOne } from "../helpers/parseRecord";
import { compareValuesByCommonKeys } from "../helpers";

@Injectable()
export class PagesIblockRecordsService {
    constructor(
        private readonly pagesIblockRecordsRepository: PagesIblockRecordsRepository,
        private readonly pagesIblockRecordsFieldRepository: PagesIblockRecordsFieldRepository,
        private readonly pagesIblockRecordsFieldValueRepository: PagesIblockRecordsFieldValueRepository,

        private readonly pagesIblockRepository: PagesIblockRepository,
        private readonly pagesIblockFieldsRepository: PagesIblockFieldsRepository,
    ) {}

    async getOne(id: number): Promise<ResultPagesIblockRecordsPublicDto> {
        const entity = await this.pagesIblockRecordsRepository.getOne(id);

        return {
            isSuccess: true,
            entity: publicFormatterOne(entity),
        }
    }

    async get(query: PagesIblockRecordsQuery): Promise<PagesIblockRecordsPublicListDto> {
        const {count, limit, entity} = await this.pagesIblockRecordsRepository.get(query);

        return {
            isSuccess: true,
            entity: {
                count,
                limit,
                entity: publicFormatterList(entity)
            }
        }
    }

    async create(body: CreatePagesIblockRecordDto): Promise<any> {
        const iblock = await this.pagesIblockRepository.getOne(body.iblockID);
        if (!iblock) {
            return {isSuccess: false, message: 'Информационный блок не найден', entity: null}
        }

        const getFields = await this.pagesIblockFieldsRepository.get({
            search: '',
            page: 1,
            limit: 200,
            iblockID: body.iblockID
        })

        if (!Object.keys(body.data.fields).length) {
            return {isSuccess: false, message: 'Нет полей для изменения', entity: null}
        }

        // Перобразовываем данные для сохранения
        const recordsFields: PagesIblockRecordsFieldDto[] = [];
        for (let key in body.data.fields) {
            const item = body.data.fields[key];

            const findField = getFields.entity.find((el) => el.slug === key);
            if (findField) {

                const values: PagesIblockRecordsFieldValueDto[] = [];
                for(let valueKey in item) {
                    const value = item[valueKey];
                    values.push(value);
                }

                recordsFields.push({
                    field: findField,
                    value: values
                })
            }
        }

        // Сохраням данные
        const record = await this.pagesIblockRecordsRepository.create({
            sort: Number(body.data.sort) || 0,
            iblock: iblock,
            sections: body.data.sections,
        });
        const resultRecors = {...record, fields: []};

        for (let field of recordsFields) {
            const recordField = await this.pagesIblockRecordsFieldRepository.create({
                ...field,
                record
            });
            const valueResult = [];
            for (const itemValue of field.value) {
                const entityValue = await this.pagesIblockRecordsFieldValueRepository.create({
                    ...itemValue,
                    recordField
                });
                valueResult.push(entityValue);
            }

            resultRecors['fields'].push({
                ...recordField,
                value: valueResult
            })
        }

        return {
            isSuccess: true,
            entity: publicFormatterOne(resultRecors)
        }
    }

    async update(body: CreatePagesIblockRecordDto): Promise<any> {
        const iblock = await this.pagesIblockRepository.getOne(body.iblockID);
        if (!iblock) {
            return {isSuccess: false, message: 'Информационный блок не найден', entity: null}
        }
        const getRecords = await this.pagesIblockRecordsRepository.getOne(body.data.id);
        if (!getRecords) {
            return {isSuccess: false, message: 'Такая запись не найдена', entity: null}
        }

        if (!Object.keys(body.data.fields).length) {
            return {isSuccess: false, message: 'Нет полей для изменения', entity: null}
        }

        await this.pagesIblockRecordsRepository.update({
            ...getRecords,
            sort: body.data.sort || 0,
            sections: body.data.sections
        })

        const formtterRecords = publicFormatterOne(getRecords);

        // Находим данные которые не совпадают
        for (let key in body.data.fields) {
            const thisFields = body.data.fields[key];
            const recordsFields = formtterRecords.fields[key];

            if (recordsFields) {
                for (let keyLang in thisFields) {
                    const valueField = thisFields[keyLang]
                    const valueRecordField = recordsFields[keyLang]
                    console.log(valueField, valueRecordField);
                    console.log(!compareValuesByCommonKeys(valueField, valueRecordField))
                    console.log('------');
                    // Усли значения обьекта не совпадают отправляем на обновление
                    if (!compareValuesByCommonKeys(valueField, valueRecordField)) {
                        await this.pagesIblockRecordsFieldValueRepository.update({
                            ...valueRecordField,
                            ...valueField,
                        });
                    }
                }
            } else {
                /// Значит новое поле нужно его создать
                const getFields = await this.pagesIblockFieldsRepository.get({
                    search: '',
                    page: 1,
                    limit: 200,
                    iblockID: body.iblockID
                })
                // Находим поле по ключу и перобразовываем данные для сохранения
                let recordsFieldsParse: PagesIblockRecordsFieldDto = {};
                const findField = getFields.entity.find((el) => el.slug === key);
                if (findField) {
                    const item = body.data.fields[key]
                    const values: PagesIblockRecordsFieldValueDto[] = [];
                    for(let valueKey in item) {
                        const value = item[valueKey];
                        values.push(value);
                    }

                    recordsFieldsParse = {
                        field: findField,
                        value: values
                    }
                    // Создаем field у записи
                    const recordField = await this.pagesIblockRecordsFieldRepository.create({
                        ...recordsFieldsParse,
                        record: getRecords
                    });

                    for (const itemValue of recordsFieldsParse.value) {
                        const entityValue = await this.pagesIblockRecordsFieldValueRepository.create({
                            ...itemValue,
                            recordField
                        });
                    }
                }
            }

        }

        const result = {
            ...formtterRecords,
            ...body.data
        }

        return {
            isSuccess: true,
            entity: result
        }
    }
}

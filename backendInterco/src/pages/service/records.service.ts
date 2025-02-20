import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { PagesEntity } from '../entity/pages.entity';
import { ILike, Repository } from 'typeorm';
import { PagesDto } from '../dto/pages/create-pages.dto';
import { BaseQuery, ResultDto } from 'src/dto/reponse.dto';
import { RecordsEntity } from '../entity/records.entity';
import { RecordsListDto, RecordsQuery, RecordsQuerySlug, ResultRecordsCreateDto, ResultRecordsDto, ResultRecordsFullDto } from '../dto/records/response-records.dto';
import { CreateRecordsDto, FullRecordsDto } from '../dto/records/create-records.dto';
import { DropDownDto, ResultDropDownDto } from 'src/dto/response-drop-down.dto';
import { CommentStatus, ITypePagesParams } from '../interface';
import { PagesParamsRepository } from '../repository/pages-params.repository';
import { PagesParamsFieldRepository } from '../repository/pages-params-field.repository';
import { FullPagesParamsFieldDto } from '../dto/pages-params-field/pages-params-field.dto';
import { FullPagesParamsDto } from '../dto/pages-params/pages-params.dto';
import { RecordsRepository } from '../repository/records.repository';
import { PagesRepository } from '../repository/pages.repository';
import { RecordsSeoRepository } from '../repository/recrods-seo.repository';
import { RecordsSeoParamsRepository } from '../repository/records-seo-params.repository';
import { RecordsTitleRepository } from '../repository/records-title.repository';
import { RecordsTitleValueRepository } from '../repository/records-title-value.repository';
import { RecordsDescriptionRepository } from '../repository/records-description.repository';
import { RecordsDescriptionValueRepository } from '../repository/records-description-value.repository';
import { compareValuesByCommonKeys } from '../helpers';

const jsonArray = [ITypePagesParams.FILE, ITypePagesParams.GALLARY, ITypePagesParams.IMAGE]

@Injectable()
export class RecordsService {
    constructor(
        private readonly recordsRepository: RecordsRepository,
        private readonly pagesRepository: PagesRepository,
        private readonly pagesParamsRepository: PagesParamsRepository,
        private readonly pagesParamsFieldRepository: PagesParamsFieldRepository,
        private readonly recordsSeoRepository: RecordsSeoRepository,
        private readonly recordsSeoParamsRepository: RecordsSeoParamsRepository,
        private readonly recordsTitleRepository: RecordsTitleRepository,
        private readonly recordsTitleValueRepository: RecordsTitleValueRepository,
        private readonly recordsDescriptionRepository: RecordsDescriptionRepository,
        private readonly recordsDescriptionValueRepository: RecordsDescriptionValueRepository,
    ){}

    parserParamsForResult(body: FullRecordsDto) {
        const {paramsValue, ...entity} = body;
        const params: any = {};
        paramsValue.forEach((valueItem: FullPagesParamsFieldDto) => {
            if (jsonArray.includes(valueItem.params.type)) {
                params[valueItem.params.slug] = valueItem.value;
            } else {
                params[valueItem.params.slug] = valueItem.value
            }
        })
        return {
            ...entity,
            params
        }
    }


    // Получение информации о записи
    async getOne(id: number): Promise<ResultRecordsFullDto> {
        const entity = await this.recordsRepository.getOne(id);

        return {isSuccess: true, entity: this.parserParamsForResult(entity)}
    }

    // Получение одной записи для создания и редактирования
    async getCreateOrUpdate(id: number): Promise<ResultRecordsCreateDto> {
        const query = await this.recordsRepository.getCreateOrUpdate(id);

        const entity: any = this.parserParamsForResult(query as any);

        return {isSuccess: true, entity}
    }

    // Создание записи
    async create(body: CreateRecordsDto): Promise<ResultRecordsCreateDto> {
        const pages = await this.pagesRepository.getOne(body.pages.value);
        if (!pages) {
            return {isSuccess: false, message: 'Старница не найдена'}
        }

        const {params, ...entityCreate} = body
        const paramsEntity = (await this.pagesParamsRepository.get(pages.id, {
            search: '',
            page: 1,
            limit: 100,
        })).entity

        // Созданем SEO настройки
        const recordSeo = await this.recordsSeoRepository.create({...body.seo});
        if (body.seo?.params?.length) {
            body.seo?.params.forEach((el) => {
                this.recordsSeoParamsRepository.create({...el, recordSeo});
            })
        }

        // Созданем заголовка
        const title = await this.recordsTitleRepository.create({...body.title})
        if (body.title?.value?.length) {

            body.title.value.forEach((el) => {
                this.recordsTitleValueRepository.create({...el, recordTitle: title})
            })
        }
        // Создание описание
        const description = await this.recordsDescriptionRepository.create({...body.description})
        if (body.description?.value?.length) {
            body.description.value.forEach((el) => {
                this.recordsDescriptionValueRepository.create({...el, recordDescription: description})
            })
        }

        // Создание самой записи
        const record =  await this.recordsRepository.create({
            ...entityCreate,
            title,
            description,
            seo: recordSeo,
            countView: !entityCreate.countView ? 0 : entityCreate.countView,
            pages
        });

        // for (let i = 0; i < paramsEntity.length; i++) {
        //     if (jsonArray.includes(paramsEntity[i].type)) {
        //         const valueJson = body[paramsEntity[i].slug]
        //         await this.pagesParamsValueRepository.create({
        //             params: paramsEntity[i],
        //             record,
        //             value: '',
        //             valueJson
        //         })
        //     }  else {
        //         const value = body[paramsEntity[i].slug]
        //         await this.pagesParamsValueRepository.create({
        //             params: paramsEntity[i],
        //             record,
        //             value,
        //             valueJson: undefined,
        //         })
        //     }
        // }

        return {
            isSuccess: true,
            entity: {
                ...record,
               // TODO костыль посмотреть как преобразовать в DropDown
                pages: {value: record.pages.id, label: record.pages.name }
            }
        }
    }

    // Обновление записи
    async update(body: CreateRecordsDto): Promise<ResultRecordsCreateDto> {
        try {
            const record = await this.recordsRepository.getOne(body.id)
            const pages = await this.pagesRepository.getOne(body.pages.value)

            const paramsEntity = (await this.pagesParamsRepository.get(pages.id, {
                search: '',
                page: 1,
                limit: 100,
            })).entity

            const entity = {
                ...record,
                ...body,
                pages,
            };
            await this.recordsRepository.update(entity);

            // Обновляем seo
            if (body.seo?.params?.length) {
                for (let key in body.seo.params) {
                    const param = record.seo?.params?.find((el) => el.id === body.seo.params[key].id);
                    if (param) {
                        if (!compareValuesByCommonKeys(body.seo.params[key], param)) {
                            this.recordsSeoParamsRepository.update({
                                ...param,
                                ...body.seo.params[key]
                            });
                        }
                    } else {
                        this.recordsSeoParamsRepository.create({
                            ...body.seo.params[key],
                            recordSeo: record.seo
                        });
                    }

                }
            }
            // Обновляем title
            if (body.title?.value?.length) {
                for (let key in body.title.value) {
                    const title = record.title?.value?.find((el) => el.id === body.title.value[key].id);
                    if (title) {
                        if (!compareValuesByCommonKeys(body.title.value[key], title)) {
                            this.recordsTitleValueRepository.update({
                                ...title,
                                ...body.title.value[key]
                            });
                        } else {
                            this.recordsTitleValueRepository.create({
                                ...body.title.value[key],
                                recordTitle: record.title
                            })
                        }
                    }

                }
            }

            // Обновляем description
            if (body.description?.value?.length) {
                for (let key in body.description.value) {
                    const description = record.description?.value?.find((el) => el.id === body.description.value[key].id);
                    if (description) {
                        if (!compareValuesByCommonKeys(body.description.value[key], description)) {
                            this.recordsDescriptionValueRepository.update({
                                ...description,
                                ...body.description.value[key]
                            });
                        } else {
                            this.recordsDescriptionValueRepository.create({
                                ...body.description.value[key],
                                recordDescription: record.description
                            })
                        }
                    }

                }
            }

            // for(let i = 0; i < paramsEntity.length; i++) {
            //     if (body.params[paramsEntity[i].slug]) {
            //         const find = entity.paramsValue.find((item) => item.params.slug === paramsEntity[i].slug)
            //         if (jsonArray.includes(paramsEntity[i].type)) {
            //             if (find) {
            //                 find.valueJson = body.params[paramsEntity[i].slug]
            //                 this.pagesParamsValueRepository.update({
            //                     ...find,
            //                     value: ''
            //                 })
            //             } else {
            //                 const valueJson = body.params[paramsEntity[i].slug]
            //                 this.pagesParamsValueRepository.create({
            //                     params: paramsEntity[i],
            //                     record,
            //                     value: '',
            //                     valueJson
            //                 })
            //             }
            //             entity.paramsValue[i].valueJson = body.params[paramsEntity[i].slug]
            //             this.pagesParamsValueRepository.update(entity.paramsValue[i])
            //         } else {
            //             if (find) {
            //                 find.value = body.params[paramsEntity[i].slug]
            //                 const entity = JSON.parse(JSON.stringify(find))
            //                 this.pagesParamsValueRepository.update({
            //                     ...entity,
            //                     valueJson: undefined
            //                 })
            //             } else {
            //                 this.pagesParamsValueRepository.create({
            //                     params: paramsEntity[i],
            //                     record,
            //                     value: body.params[paramsEntity[i].slug],
            //                     valueJson: undefined,
            //                 })
            //             }
            //         }
            //     }
            // }

            return {
                isSuccess: true,
                entity: {
                    ...entity,
                // TODO костыль посмотреть как преобразовать в DropDown
                pages: {value: entity.pages.id, label: entity.pages.name }
                }
            }
        } catch (error) {
            console.log(error);
            return {isSuccess: false, message: 'Запрос упал в ошибку'}
        }
    }

     // Список записей
     async getForSlug(body: RecordsQuerySlug): Promise<RecordsListDto> {
        const result = await this.recordsRepository.getForSlug(body)
        const entity: any = [];
        result.entity.forEach((el) => {
            entity.push(this.parserParamsForResult(el))
        });

        return {
            isSuccess: true,
            entity: {
                count: result.count,
                entity: entity
            }
        }
    }

    // Список записей
    async get(body: RecordsQuery): Promise<RecordsListDto> {
        const result = await this.recordsRepository.get(body)
        const entity: any = [];
        result.entity.forEach((el) => {
            entity.push(this.parserParamsForResult(el))
        });

        return {
            isSuccess: true,
            entity: {
                count: await result.count,
                entity: entity
            }
        }
    }
}

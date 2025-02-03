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
import { PagesParamsValueRepository } from '../repository/pages-params-value.repository';
import { FullPagesParamsValueDto } from '../dto/pages-params-value/pages-params-value.dto';
import { FullPagesParamsDto } from '../dto/pages-params/pages-params.dto';
import { RecordsRepository } from '../repository/records.repository';
import { PagesRepository } from '../repository/pages.repository';

const jsonArray = [ITypePagesParams.FILE, ITypePagesParams.GALLARY, ITypePagesParams.IMAGE]

@Injectable()
export class RecordsService {
    constructor(
        private readonly recordsRepository: RecordsRepository,
        private readonly pagesRepository: PagesRepository,
        private readonly pagesParamsRepository: PagesParamsRepository,
        private readonly pagesParamsValueRepository: PagesParamsValueRepository
    ){}

    parserParamsForResult(body: FullRecordsDto) {
        const {paramsValue, ...entity} = body;
        const params: any = {};
        paramsValue.forEach((valueItem: FullPagesParamsValueDto) => {
            if (jsonArray.includes(valueItem.params.type)) {
                params[valueItem.params.slug] = valueItem.valueJson;
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

        const record =  await this.recordsRepository.create({
            ...entityCreate,
            countView: !entityCreate.countView ? 0 : entityCreate.countView,
            pages
        });

        for (let i = 0; i < paramsEntity.length; i++) {
            if (jsonArray.includes(paramsEntity[i].type)) {
                const valueJson = body[paramsEntity[i].slug]
                await this.pagesParamsValueRepository.create({
                    params: paramsEntity[i],
                    record,
                    value: '',
                    valueJson
                })
            }  else {
                const value = body[paramsEntity[i].slug]
                await this.pagesParamsValueRepository.create({
                    params: paramsEntity[i],
                    record,
                    value,
                    valueJson: undefined,
                })
            }
        }

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

            for(let i = 0; i < paramsEntity.length; i++) {
                if (body.params[paramsEntity[i].slug]) {
                    const find = entity.paramsValue.find((item) => item.params.slug === paramsEntity[i].slug)
                    if (jsonArray.includes(paramsEntity[i].type)) {
                        if (find) {
                            find.valueJson = body.params[paramsEntity[i].slug]
                            this.pagesParamsValueRepository.update({
                                ...find,
                                value: ''
                            })
                        } else {
                            const valueJson = body.params[paramsEntity[i].slug]
                            this.pagesParamsValueRepository.create({
                                params: paramsEntity[i],
                                record,
                                value: '',
                                valueJson
                            })
                        }
                        entity.paramsValue[i].valueJson = body.params[paramsEntity[i].slug]
                        this.pagesParamsValueRepository.update(entity.paramsValue[i])
                    } else {
                        if (find) {
                            find.value = body.params[paramsEntity[i].slug]
                            const entity = JSON.parse(JSON.stringify(find))
                            this.pagesParamsValueRepository.update({
                                ...entity,
                                valueJson: undefined
                            })
                        } else {
                            this.pagesParamsValueRepository.create({
                                params: paramsEntity[i],
                                record,
                                value: body.params[paramsEntity[i].slug],
                                valueJson: undefined,
                            })
                        }
                    }
                }
            }

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

import { BaseQuery, ResultDto } from "src/dto/reponse.dto";
import { ReferenceBookAttributesRepository } from "../repository/reference-book-attributes.repository";
import { CreateReferenceBookInstancesDto, FullReferenceBookInstancesDto } from "../dto/reference-book-instances/reference-book-instances.dto";
import { Inject, forwardRef } from '@nestjs/common';
import { ReferenceBookInstancesValueRepository } from "../repository/reference-book-instances-value.repository";
import { ReferenceBookRepository } from "../repository/reference-book-repository";
import { ReferenceBookInstancesRepository } from "../repository/reference-book-instances.repository";
import { ReferenceBookInstancesQuery, ResultReferenceBookInstanceBaseDto } from "../dto/reference-book-instances/response-reference-book-instances.dto";
import { ITypeAttributes } from "../interface";

const jsonArray = [ITypeAttributes.FILE, ITypeAttributes.GALLARY, ITypeAttributes.IMAGE]

export class ReferenceBookInstancesService {
    constructor(
        @Inject(forwardRef(() => ReferenceBookRepository))
        private referenceBookRepository: ReferenceBookRepository,

        @Inject(forwardRef(() => ReferenceBookInstancesRepository))
        private referenceBookInstancesRepository: ReferenceBookInstancesRepository,

        @Inject(forwardRef(() => ReferenceBookAttributesRepository))
        private referenceBookAttributesRepository: ReferenceBookAttributesRepository,

        @Inject(forwardRef(() => ReferenceBookInstancesValueRepository))
        private referenceBookInstancesValueRepository: ReferenceBookInstancesValueRepository,
    ) {}

    parserInstancesForResult(body: FullReferenceBookInstancesDto) {
        const {
            id,
            createdAt,
            updatedAt,
            deletedAt
        } = body;
        const valueAttribute: any = {};
        body.instancesValue.forEach((valueItem: any) => {
            if (jsonArray.includes(valueItem.attribute.type)) {
                valueAttribute[valueItem.attribute.slug] = valueItem.valueJson;
            } else {
                valueAttribute[valueItem.attribute.slug] = valueItem.value
            }

        })

        return {
            id,
            createdAt,
            updatedAt,
            deletedAt,
            ...valueAttribute,
        }
    }

    async getOneForID(idInstances: number): Promise<ResultReferenceBookInstanceBaseDto> {
        const result = await this.referenceBookInstancesRepository.getOneForID(idInstances)

        return {
            isSuccess: true,
            entity: this.parserInstancesForResult(result)
        }
    }

    async getForSlug(query: ReferenceBookInstancesQuery) {
        const result = await this.referenceBookInstancesRepository.getForSlug(query)
        const entity: any = [];
        result.entity.forEach((el) => {
            entity.push(this.parserInstancesForResult(el))
        });

        return {
            isSuccess: true,
            entity: {
                count: result.count,
                entity
            }
        };
    }

    async get(idReferenceBook: number, query: BaseQuery) {
        const result = await this.referenceBookInstancesRepository.get(idReferenceBook, query)
        const entity: any = [];
        result.entity.forEach((el) => {
            entity.push(this.parserInstancesForResult(el))
        });

        return {
            isSuccess: true,
            entity: {
                count: result.count,
                entity
            }
        };
    }

    // ID Справчоника
    async create(id: number, body: CreateReferenceBookInstancesDto) {
        try {
            const referenceBook = await this.referenceBookRepository.getOneForID(id)
            const attributes = await this.referenceBookAttributesRepository.get(id, {
                search: '',
                page: 1,
                limit: 100,
            })

            const instance = await this.referenceBookInstancesRepository.create(referenceBook)

            for (let i = 0; i < attributes.entity.length; i++) {
                if (jsonArray.includes(attributes.entity[i].type)) {
                    const valueJson = body[attributes.entity[i].slug]
                    await this.referenceBookInstancesValueRepository.create({
                        attribute: attributes.entity[i],
                        instance,
                        value: '',
                        valueJson
                    })
                }  else {
                    const value = body[attributes.entity[i].slug]
                    await this.referenceBookInstancesValueRepository.create({
                        attribute: attributes.entity[i],
                        instance,
                        value,
                        valueJson: undefined,
                    })
                }
            }

            return {isSuccess: true}
        } catch (error) {
            console.log(error)
            return {isSuccess: false}
        }
    }

    async update(idInstances: number, body: CreateReferenceBookInstancesDto): Promise<ResultReferenceBookInstanceBaseDto> {
        const result = await this.referenceBookInstancesRepository.getOneForID(idInstances)
        result.instancesValue.forEach((el, index: number) => {
            if (body[(el as any).attribute.slug]) {
                if (jsonArray.includes((el as any).attribute.type)) {
                    result.instancesValue[index].valueJson = body[(el as any).attribute.slug]
                    this.referenceBookInstancesValueRepository.update(result.instancesValue[index])
                } else {
                    result.instancesValue[index].value = body[(el as any).attribute.slug]
                    this.referenceBookInstancesValueRepository.update(result.instancesValue[index])
                }
            }
        })

        return {
            isSuccess: true,
            entity: this.parserInstancesForResult(result)
        }
    }

    async delete(idInstances: number): Promise<ResultDto> {
        const result = await this.referenceBookInstancesRepository.getOneForID(idInstances)
        result.instancesValue.forEach((el) => {
            this.referenceBookInstancesValueRepository.delete(el.id)
        })
        const entity = await this.referenceBookInstancesRepository.delete(result.id)

        return {isSuccess: entity, message: !entity ? 'Запись не удалось удалить' : ''}
    }

    async deleteIds(ids: number[]): Promise<ResultDto> {
        const instances = await this.referenceBookInstancesRepository.getForIDs(ids)
        const valueIds: number[] = [];
        instances.forEach((el) => {
            const thisValue = el.instancesValue.map((item) => item.id)
            valueIds.push(...thisValue)
        })
        await this.referenceBookInstancesValueRepository.deleteIds(valueIds)
        const result = await this.referenceBookInstancesRepository.deleteIds(instances.map((el) => el.id))


        return {isSuccess: result, message: !result ? 'Запись не удалось удалить' : ''}
    }
}

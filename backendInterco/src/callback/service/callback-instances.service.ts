import { BaseQuery, ResultDto } from "src/dto/reponse.dto";
import { Inject, forwardRef } from '@nestjs/common';
import { CallbackRepository } from "../repository/callback.repository";
import { CallbackFieldRepository } from "../repository/callback-field.repository";
import { CallbackInstancesRepository } from "../repository/callback-instances.repository";
import { CallbackInstancesValueRepository } from "../repository/callback-instances-value.repository";
import { ResultCallbackInstancesValueDto } from "../dto/callback-instances-value/response-callback-instances-value.dto";
import { CallbackInstancesQuery, ResultCallbackInstancesBaseDto } from "../dto/callback-instances/response-callback-instances.dto";
import { CreateCallbackInstancesDto, FullCallbackInstancesDto } from "../dto/callback-instances/callback-instances.dto";
import { ISendData } from "../interface";
import { CallbackDto } from "../dto/callback/callback.dto";
import { NodeMailerService } from '../../node-mailer/node-mailer.service';
import { BitrixService } from "./bitrix.service";
import { AmoCrmService } from "./amo-crm.service";



export class CallbackInstancesService {
    constructor(
        @Inject(forwardRef(() => CallbackRepository))
        private callbackRepository: CallbackRepository,

        @Inject(forwardRef(() => CallbackFieldRepository))
        private callbackFieldRepository: CallbackFieldRepository,

        @Inject(forwardRef(() => CallbackInstancesRepository))
        private callbackInstancesRepository: CallbackInstancesRepository,

        @Inject(forwardRef(() => CallbackInstancesValueRepository))
        private callbackInstancesValueRepository: CallbackInstancesValueRepository,

        @Inject(forwardRef(() => NodeMailerService))
        private nodeMailerService: NodeMailerService,

        @Inject(forwardRef(() => BitrixService))
        private bitrixService: BitrixService,

        @Inject(forwardRef(() => AmoCrmService))
        private amoCrmService: AmoCrmService,
    ) {}

    parserInstancesForResult(body: FullCallbackInstancesDto) {
        const {
            id,
            createdAt,
            updatedAt,
            deletedAt
        } = body;
        const valueAttribute: any = {};
        body.instancesValue.forEach((valueItem: any) => {
            valueAttribute[valueItem.field.attribute] = valueItem.value

        })

        return {
            id,
            createdAt,
            updatedAt,
            deletedAt,
            ...valueAttribute,
        }
    }

    // Отправка данных по задачанм парамметрам
    sendData(data: ISendData[], callback: CallbackDto) {
        if (callback.syncAmo) {
            // Отправка в AmoCrm
            this.amoCrmService.send(data, callback)
        }

        // if (callback.syncBitrix) {
        //     // Отправка в Битрикс24
        //     this.bitrixService.send(data, callback);

        // }
        // if (callback.email) {
        //     this.nodeMailerService.callbackTemplate(data, callback)
        // }
    }

    async getOneForID(idInstances: number): Promise<ResultCallbackInstancesValueDto> {
        const result = await this.callbackInstancesRepository.getOneForID(idInstances)

        return {
            isSuccess: true,
            entity: this.parserInstancesForResult(result)
        }
    }

    async getForSlug(query: CallbackInstancesQuery) {
        const result = await this.callbackInstancesRepository.getForSlug(query)
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

    async get(idCallback: number, query: BaseQuery) {
        const result = await this.callbackInstancesRepository.get(idCallback, query)
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
    async create(id: number, body: CreateCallbackInstancesDto) {
        try {
            const callback = await this.callbackRepository.getOneForID(id)
            const fields = await this.callbackFieldRepository.get(id, {
                search: '',
                page: 1,
                limit: 100,
            })

            const instance = await this.callbackInstancesRepository.create(callback)

            const sendData: ISendData[] = [];

            for (let i = 0; i < fields.entity.length; i++) {
                const value = body[fields.entity[i].attribute]
                await this.callbackInstancesValueRepository.create({
                    field: fields.entity[i],
                    instance,
                    value,
                })
                // Собраем данные для отправки
                sendData.push({
                    name: fields.entity[i].name,
                    attribute: fields.entity[i].attribute,
                    value
                })
            }

            this.sendData(sendData, callback)

            return {isSuccess: true}
        } catch (error) {
            console.log(error)
            return {isSuccess: false}
        }
    }

    async update(idInstances: number, body: CreateCallbackInstancesDto): Promise<ResultCallbackInstancesBaseDto> {
        const result = await this.callbackInstancesRepository.getOneForID(idInstances)
        result.instancesValue.forEach((el, index: number) => {
            if (body[(el as any).field.attribute]) {
                result.instancesValue[index].value = body[(el as any).field.attribute]
                this.callbackInstancesValueRepository.update(result.instancesValue[index])
            }
        })

        return {
            isSuccess: true,
            entity: this.parserInstancesForResult(result)
        }
    }

    async delete(idInstances: number): Promise<ResultDto> {
        const result = await this.callbackInstancesRepository.getOneForID(idInstances)
        result.instancesValue.forEach((el) => {
            this.callbackInstancesValueRepository.delete(el.id)
        })
        const entity = await this.callbackInstancesRepository.delete(result.id)

        return {isSuccess: entity, message: !entity ? 'Запись не удалось удалить' : ''}
    }

    async deleteIds(ids: number[]): Promise<ResultDto> {
        const instances = await this.callbackInstancesRepository.getForIDs(ids)
        const valueIds: number[] = [];
        instances.forEach((el) => {
            const thisValue = el.instancesValue.map((item) => item.id)
            valueIds.push(...thisValue)
        })
        await this.callbackInstancesValueRepository.deleteIds(valueIds)
        const result = await this.callbackInstancesRepository.deleteIds(instances.map((el) => el.id))


        return {isSuccess: result, message: !result ? 'Запись не удалось удалить' : ''}
    }
}

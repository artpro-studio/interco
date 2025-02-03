
import { Injectable } from '@nestjs/common';
import { CallbackRepository } from '../repository/callback.repository';
import { CallbackFieldRepository } from '../repository/callback-field.repository';
import { CreateCallbackFieldDto } from '../dto/callback-field/callback-field.dto';
import { ResultCallbackFieldDto } from '../dto/callback-field/response-callback-field.dto';

@Injectable()
export class CallbackFieldService {
    constructor(
        private readonly callbackFieldRepository: CallbackFieldRepository,
        private readonly callbackRepository: CallbackRepository,
    ) {}

    async create(body: CreateCallbackFieldDto): Promise<ResultCallbackFieldDto> {
        const callback = await this.callbackRepository.getOneForID(body.callbackId);
        const entity = await this.callbackFieldRepository.create({
            ...body,
            callback,
        })

        return {isSuccess: true, entity}
    }

    async update(body: CreateCallbackFieldDto): Promise<ResultCallbackFieldDto> {
        const callback = await this.callbackRepository.getOneForID(body.callbackId);
        const entity = await this.callbackFieldRepository.update({
            ...body,
            callback,
        })

        return {isSuccess: true, entity}
    }
}

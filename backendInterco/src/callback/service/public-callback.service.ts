import { Injectable } from '@nestjs/common';
import { PublicCallbackDto } from '../dto/public-callback/public-callback.dto';
import { ResultDto } from 'src/dto/reponse.dto';
import { CallbackFieldRepository } from '../repository/callback-field.repository';
import { CallbackRepository } from '../repository/callback.repository';
import { CallbackInstancesRepository } from '../repository/callback-instances.repository';
import { CallbackInstancesValueRepository } from '../repository/callback-instances-value.repository';
import { BitrixService } from './bitrix.service';
import { ISendData } from '../interface';
import { NodeMailerService } from 'src/node-mailer/node-mailer.service';
import { MainFile } from 'src/library-files/interface';
import { LibraryFilesService } from 'src/library-files/library-files.service';

@Injectable()
export class PublicCallbackService {
    constructor(
        private readonly callbackRepository: CallbackRepository,
        private readonly callbackFieldRepository: CallbackFieldRepository,
        private readonly callbackInstancesRepository: CallbackInstancesRepository,
        private readonly callbackInstancesValueRepository: CallbackInstancesValueRepository,
        private readonly bitrixService: BitrixService,
        private readonly nodeMailerService: NodeMailerService,
        private readonly libraryFilesService: LibraryFilesService
    ) {}

    async create(body: PublicCallbackDto): Promise<ResultDto> {
        const data = body.data;

        const callback = await this.callbackRepository.getForSlug(body.slug);
        const getFileds = await this.callbackFieldRepository.getForSlugForm(
            body.slug
        );

        if (!callback) {
            return { isSuccess: false, message: 'Callback not found' };
        }

        const instance = await this.callbackInstancesRepository.create(
            callback
        );

        const values: ISendData[] = [];
        for (let key in data) {
            const item = data[key];
            const field = getFileds.find((el) => el.attribute === key);
            if (field) {
                await this.callbackInstancesValueRepository.create({
                    field,
                    instance,
                    value: item,
                });
                values.push({
                    name: field.name,
                    attribute: field.attribute,
                    value: item,
                });
            }
        }

        if (callback.syncBitrix) {
            this.bitrixService.send(values, callback);
        }

        if (callback.email) {
            this.nodeMailerService.callbackTemplate(values, callback);
        }

        return { isSuccess: true };
    }
}

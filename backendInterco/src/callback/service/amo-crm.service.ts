
import { forwardRef, Inject, Injectable } from '@nestjs/common';
import { Client } from 'amocrm-js'
import { ISendData } from '../interface';
import { CallbackDto } from '../dto/callback/callback.dto';
import { SettingsService } from 'src/settings/service/settings.service';
import { AmoCustomRepository } from '../repository/amo-custom-fields.repository';

@Injectable()
export class AmoCrmService {
    constructor(
        @Inject(forwardRef(() => SettingsService))
        private settingsService: SettingsService,

        @Inject(forwardRef(() => AmoCustomRepository))
        private amoCustomRepository: AmoCustomRepository,
    ) {

    }

    async settingsAmoCrm() {
        const settings = (await this.settingsService.get()).entity
        return new Client({
            domain: settings.amoDomain,
            auth: {
              client_id: settings.amoClientId, // ID интеграции
              client_secret: settings.amoClientSecret, // Секретный ключ
              redirect_uri: process.env.DOMEN, // Ссылка для перенаправления
              bearer: settings.amoBearer,
            },
        });
    }

    async send(body: ISendData[], callback: CallbackDto) {
        try {
            const amoApi = await this.settingsAmoCrm();
            const customFields = await this.amoCustomRepository.get({
                search: '',
                page: 1,
                limit: 100,
            })
            const resultCustomFields = []
            body.forEach((el: ISendData) => {
                const field = customFields.entity.find((item) => item.attribute === el.attribute)
                if (field) {
                    resultCustomFields.push({
                        field_id: field.amoID,
                        values: [
                            {
                                value: el.value
                            }
                        ]
                    })
                }

            })
            // const contact = await amoApi.contacts.getById(2500439);
            // console.log('2500439', contact)
            const [lead] = await amoApi.leads.create([
                {
                    name: callback.name,
                    custom_fields_values: resultCustomFields,
                    // _embedded: {
                    //     contacts: [
                    //         {
                    //             id: contact.id
                    //         }
                    //     ]
                    // }
                },
            ]);
        } catch (error) {
            console.log(error)
        }
    }
}

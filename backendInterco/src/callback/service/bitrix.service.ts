import { HttpService } from '@nestjs/axios';
import { forwardRef, Inject, Injectable } from '@nestjs/common';
import { ResultDto } from 'src/dto/reponse.dto';
import { SettingsService } from 'src/settings/service/settings.service';
import {
    IBitrixFieldAttribute,
    ICallbackFiledAttribute,
    ISendData,
} from '../interface';
import { CallbackDto } from '../dto/callback/callback.dto';

@Injectable()
export class BitrixService {
    constructor(
        private readonly httpService: HttpService,

        @Inject(forwardRef(() => SettingsService))
        private settingsService: SettingsService
    ) {}

    async send(body: ISendData[], callback: CallbackDto): Promise<ResultDto> {
        try {
            const settings = (await this.settingsService.get()).entity;

            if (!settings.urlBitrix) {
                return { isSuccess: false };
            }

            const FIELDS = {
                TITLE: callback.name,
            };
            body.forEach((el) => {
                if (
                    el.attribute === ICallbackFiledAttribute.EMAIL ||
                    el.attribute === ICallbackFiledAttribute.EMAIL_WORK
                ) {
                    if (!FIELDS[IBitrixFieldAttribute[el.attribute]]) {
                        FIELDS[IBitrixFieldAttribute[el.attribute]] = [];
                    }
                    FIELDS['EMAIL'].push({
                        VALUE_TYPE:
                            el.attribute === ICallbackFiledAttribute.EMAIL
                                ? 'HOME'
                                : 'WORK',
                        VALUE: el.value,
                    });
                } else if (
                    el.attribute === ICallbackFiledAttribute.PHONE ||
                    el.attribute === ICallbackFiledAttribute.PHONE_WORK
                ) {
                    if (!FIELDS[IBitrixFieldAttribute[el.attribute]]) {
                        FIELDS[IBitrixFieldAttribute[el.attribute]] = [];
                    }
                    FIELDS[IBitrixFieldAttribute[el.attribute]].push({
                        VALUE_TYPE:
                            el.attribute === ICallbackFiledAttribute.PHONE
                                ? 'HOME'
                                : 'WORK',
                        VALUE: el.value,
                    });
                } else {
                    FIELDS[IBitrixFieldAttribute[el.attribute]] = el.value;
                }
            });

            if (
                FIELDS[IBitrixFieldAttribute.company] &&
                FIELDS[IBitrixFieldAttribute.company].length
            ) {
                const contacts = await this.httpService.axiosRef.get(
                    `${settings.urlBitrix}/crm.contact.add`,
                    {
                        params: {
                            FIELDS: FIELDS,
                        },
                    }
                );
                const contactsID = contacts.data.result;

                const FIELDS_COMPANY = {
                    TITLE: FIELDS[IBitrixFieldAttribute.company],
                    CONTACT_PERSON: FIELDS[IBitrixFieldAttribute.name],
                    PHONE: FIELDS[IBitrixFieldAttribute.phone],
                    EMAIL: FIELDS[IBitrixFieldAttribute.email],
                    ASSIGNED_BY_ID: contactsID,
                };
                const company = await this.httpService.axiosRef.get(
                    `${settings.urlBitrix}/crm.company.add`,
                    {
                        params: {
                            FIELDS: FIELDS_COMPANY,
                        },
                    }
                );
                const companyID = company.data.result;

                await this.httpService.axiosRef.get(
                    `${settings.urlBitrix}/crm.company.contact.add`,
                    {
                        params: {
                            id: companyID,
                            FIELDS: {
                                CONTACT_ID: contactsID,
                            },
                        },
                    }
                );

                FIELDS['COMPANY_ID'] = companyID;
            }

            await this.httpService.axiosRef.get(
                `${settings.urlBitrix}/crm.lead.add.json`,
                {
                    params: {
                        FIELDS: {
                            ...FIELDS,
                            SOURCE_ID: 'WEB',
                        },
                    },
                }
            );
            return { isSuccess: true };
        } catch (error) {
            console.log(error);
            return { isSuccess: false, message: 'В CRM не отправлено' };
        }
    }
}

import { ResultDto } from './../dto/reponse.dto';
import { CreateRegisterDto } from './dto/create-register.dto';
import { join } from 'path';
import { MailerService } from '@nestjs-modules/mailer';
import { Injectable } from '@nestjs/common';
import * as fs from 'fs';
import { ISendData } from 'src/callback/interface';
import { CallbackDto } from 'src/callback/dto/callback/callback.dto';

@Injectable()
export class NodeMailerService {
    constructor(private readonly mailerService: MailerService) {}

    async sendSubscribe(data: {
        title: string;
        description: string;
        name: string;
        email: string;
    }) {
        const result: ResultDto = await this.mailerService
            .sendMail({
                to: data.email,
                subject: 'Заявка с сайта',
                template: join('template-mail/subscription'),
                context: {
                    title: data.title,
                    description: data.description,
                    http: process.env.DOMEN,
                },
            })
            .then(() => {
                return { isSuccess: true, message: 'Сообщение отправлено' };
            });
    }

    // Отправка данных с сайта
    async callbackTemplate(data: ISendData[], callback: CallbackDto) {
        console.log('callbackTemplate');
        const result: ResultDto = await this.mailerService
            .sendMail({
                to: callback.email,
                subject: 'Заявка с сайта',
                template: join('template-mail/callback-template'),
                context: {
                    sendData: data,
                    http: process.env.DOMEN,
                },
            })
            .then(() => {
                return { isSuccess: true, message: 'Сообщение отправлено' };
            })
            .catch((e) => {
                console.log(e);
                return {
                    isSuccess: false,
                    message: 'Произошла ошибка сообщение не отправлено' + e,
                };
            });
        return result;
    }

    // Отправка соообщения при регистрации
    async setRegister(
        body: CreateRegisterDto,
        uuid: string
    ): Promise<ResultDto> {
        // Отправка почты
        const result: ResultDto = await this.mailerService
            .sendMail({
                to: body.email,
                subject: 'Регистрация в личном кабинете',
                template: join('template-mail/register'),
                context: {
                    username: `${body.lastName} ${body.firstName} ${body.middleName}`,
                    link: process.env.HTTP + `/confirm-email/${uuid}`,
                },
            })
            .then(() => {
                return { isSuccess: true, message: 'Сообщение отправлено' };
            })
            .catch((e) => {
                return {
                    isSuccess: false,
                    message: 'Произошла ошибка сообщение не отправлено' + e,
                };
            });
        return result;
    }

    // Отправка соообщения при регистрации
    async setConfirmResetPassword(
        email: string,
        uuid: string
    ): Promise<ResultDto> {
        // Отправка почты
        const result: ResultDto = await this.mailerService
            .sendMail({
                to: email,
                subject: 'Смена пароль в личном кабинете',
                template: join('template-mail/replace-password'),
                context: {
                    link: process.env.HTTP + `/replace-password/${uuid}`,
                },
            })
            .then(() => {
                return { isSuccess: true, message: 'Сообщение отправлено' };
            })
            .catch((e) => {
                return {
                    isSuccess: false,
                    message: 'Произошла ошибка сообщение не отправлено' + e,
                };
            });
        return result;
    }

    async setMailFile(
        fileName: string,
        pathFile: string,
        date: string
    ): Promise<ResultDto> {
        try {
            console.log(fileName, pathFile, date);
            await this.mailerService
                .sendMail({
                    to: process.env.EMAIL_REESTOR,
                    template: join('template-mail/exportReestor'),
                    context: {
                        text: `Выгрузка файла за /${date}`,
                    },
                    subject: 'Реестор за ' + date,
                    attachments: [
                        {
                            filename: fileName,
                            content: fs.createReadStream(pathFile),
                        },
                    ],
                })
                .then(() => {
                    return { isSuccess: true, message: 'Сообщение отправлено' };
                })
                .catch((e) => {
                    console.log(e);
                    return {
                        isSuccess: false,
                        message: 'Произошла ошибка сообщение не отправлено' + e,
                    };
                });
            return { isSuccess: true };
        } catch (error) {
            return { isSuccess: false };
        }
    }
}

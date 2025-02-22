import { UserService } from './../../user/user.service';
import { SettingsContactsEntity } from './../entity/settings-contacts.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { SettingsEntity } from './../entity/settings.entity';
import { ResultDto } from './../../dto/reponse.dto';
import { Injectable, Body } from '@nestjs/common';
import { Repository } from 'typeorm';
import { CreateSettingsDto } from '../dto/settings.dto';
import { FullSettingsDto } from '../dto/settings.dto';
import { ResultSettingsDto } from '../dto/response-settings.dto';

@Injectable()
export class SettingsService {
    constructor(
        @InjectRepository(SettingsEntity) private readonly settingsRepository: Repository<SettingsEntity>,
        @InjectRepository(SettingsContactsEntity) private readonly settingsContactsRepository: Repository<SettingsContactsEntity>,
        private userService: UserService,
    ) {}

    // Есть ли настройки системы
    async isActive(): Promise<ResultDto> {
        const count = await this.settingsRepository.count();
        return { isSuccess: !!count, message: !!count ? '' : 'Настройки не созданы'}
    }

    // Создание настроек
    async create(body: CreateSettingsDto): Promise<ResultDto> {
        // Проверяем есть ли какие нибудь настройки
        const isSettings = await this.settingsRepository.find();
        if (isSettings.length) {
            return {isSuccess: false, message: 'Настройки уже созданы'}
        }

        const settings = this.settingsRepository.create(body.settings);
        await this.settingsRepository.save(settings)

        const userSuccess = await (await this.userService.create(body.user)).isSuccess

        return {isSuccess: userSuccess && !!settings, message: userSuccess && !!settings ? 'Настройки созданы' : 'Не получилось создать настроки'}
    }

    async update(body: FullSettingsDto): Promise<ResultDto> {
        let settings = await this.settingsRepository.findOne({
            where: {
                id: body.id
            }
        })
        if (!settings) {
            return {isSuccess: false, message: 'Настрйоки не найдены'}
        }

        settings = {
            ...settings,
            title: body.title,
            description: body.description,
            vk: body.vk,
            viber: body.viber,
            telegram: body.telegram,
            whatsapp: body.whatsapp,
            linkedIn: body.linkedIn,
            discord: body.discord,
            instagram: body.instagram,
            email: body.email,
            phone: body.phone,
            urlBitrix: body.urlBitrix,
            amoClientId: body.amoClientId,
            amoClientSecret: body.amoClientSecret,
            amoBearer: body.amoBearer,
            amoDomain: body.amoDomain,
            moreEmail: body.moreEmail as SettingsContactsEntity[],
            morePhone: body.morePhone as SettingsContactsEntity[],
        }

        await this.settingsRepository.save(settings);

        return {isSuccess: true, message: 'Настройки успешно обновлены'}
    }

    // Получение настроек
    async get(): Promise<ResultSettingsDto> {
        const entity = await this.settingsRepository.find({
            relations: ['moreEmail', 'morePhone'],
        })

        return {isSuccess: true, entity:entity[0]}
    }
}

import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { SettingsContactsEntity } from "../entity/settings-contacts.entity";
import { Repository } from "typeorm";
import { SettingsContactsDto } from "../dto/settings-contacts.dto";
import { ResultSettingsContactsDto, ResultSettingsContactsListDto } from "../dto/response-settings-contacts.dto";

@Injectable()
export class SettingsContactsService {
    constructor(
        @InjectRepository(SettingsContactsEntity) private readonly settingsContactsRepository: Repository<SettingsContactsEntity>
    ) {}

    async create(body: SettingsContactsDto): Promise<ResultSettingsContactsDto> {
        const isFind = await this.settingsContactsRepository.findOne({
            where: {
                content: body.content
            }
        })
        if (isFind) {
            return { isSuccess: false, message: 'Такой контакт уже есть'}
        }

        const entity = await this.settingsContactsRepository.create(body);
        await this.settingsContactsRepository.save(entity);
        return {isSuccess: true, entity}
    }

    async update(body: SettingsContactsDto):Promise<ResultSettingsContactsDto> {
        const isFind = await this.settingsContactsRepository.findOne({
            where: {
                id: body.id
            }
        })
        if (!isFind) {
            return { isSuccess: false, message: 'Контакнт не найден'}
        }

        const entity = {
            ...isFind,
            ...body,
        }

        await this.settingsContactsRepository.save(entity)

        return {isSuccess: true, entity}
    }

    async get(isPhone: boolean): Promise<ResultSettingsContactsListDto> {
        const entity = await this.settingsContactsRepository.find({
            where: {
                isPhone,
            }
        })

        return {isSuccess: true, entity}
    }

    async getOne(id: number): Promise<ResultSettingsContactsDto> {
        const entity = await this.settingsContactsRepository.findOne({
            where: {
                id
            }
        })

        return {isSuccess: true, entity}
    }
}
import { UserDto } from './../../user/dto/user.dto';
import { ApiProperty } from '@nestjs/swagger';
import { DefaultBaseDto } from './../../dto/base.dto';
import { SettingsContactsDto } from './settings-contacts.dto';

export class SettingsDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Тест', nullable: false, description: 'Название сайта' })
    title: string;

    @ApiProperty({ example: 'Тест', nullable: true, description: 'Описание сайта' })
    description: string;

    @ApiProperty({ example: 'https://vk.com', nullable: true, description: 'Ссылка на vk' })
    vk: string;

    @ApiProperty({ example: 'https://facebook.com', nullable: true, description: 'Ссылка на facebook' })
    facebook: string;

    @ApiProperty({ example: 'https://viber.com', nullable: true, description: 'Ссылка на viber' })
    viber: string;

    @ApiProperty({ example: 'https://whatsapp.com', nullable: true, description: 'Ссылка на whatsapp' })
    whatsapp: string;

    @ApiProperty({ example: 'https://telegram.com', nullable: true, description: 'Ссылка на telegram' })
    telegram: string;

    @ApiProperty({ example: 'https://telegram.com', nullable: true, description: 'Ссылка на discrod' })
    discord: string;

    @ApiProperty({ example: 'https://telegram.com', nullable: true, description: 'Ссылка на linkedIn' })
    linkedIn: string;

    @ApiProperty({ example: 'https://telegram.com', nullable: true, description: 'Ссылка на instagram' })
    instagram: string;

    @ApiProperty({ example: 'https://telegram.com', nullable: true, description: 'Телефон' })
    phone: string;

    @ApiProperty({ example: 'https://telegram.com', nullable: true, description: 'Email' })
    email: string;

    @ApiProperty({ example: 'https://bitrix.ru', nullable: true, description: 'Интеграционная ссылка на битрикс' })
    urlBitrix: string;

    @ApiProperty({ example: 'yaandreyi96.amocrm.ru', nullable: true, description: 'Домен AmoCRM' })
    amoDomain: string;

    @ApiProperty({ example: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImIyOWZmYmI4NTI2OWQ4N2Q1', nullable: true, description: 'Долгострочный токен' })
    amoBearer: string;

    @ApiProperty({ example: '123', nullable: true, description: 'ID интеграции' })
    amoClientId: string;

    @ApiProperty({ example: '123', nullable: true, description: 'Секретный ключ' })
    amoClientSecret: string;
}

export class FullSettingsDto extends SettingsDto {
    @ApiProperty({ type: () => [SettingsContactsDto], nullable: true, description: 'Почта' })
    moreEmail: SettingsContactsDto[];

    @ApiProperty({ type: () => [SettingsContactsDto], nullable: true, description: 'Телефон' })
    morePhone: SettingsContactsDto[];
}

export class CreateSettingsDto {
    @ApiProperty({ type: () => FullSettingsDto, nullable: true, description: 'Настройки' })
    settings: FullSettingsDto;

    @ApiProperty({ type: () => UserDto, nullable: true, description: 'Пользователь' })
    user: UserDto;
}

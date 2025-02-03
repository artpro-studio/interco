import { SettingsContactsEntity } from './settings-contacts.entity';
import { ApiProperty } from '@nestjs/swagger';
import { Column, Entity, OneToMany } from 'typeorm';
import { DefaultBaseEntity } from './../../entity/base.entity';

@Entity({
    name: 'settings'
})
export class SettingsEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Тест', nullable: false, description: 'Название сайта' })
    @Column({ nullable: false, length: 1024 })
    title: string;

    @ApiProperty({ example: 'Тест', nullable: true, description: 'Описание сайта' })
    @Column({ nullable: true, length: 1024 })
    description: string;

    @ApiProperty({ example: 'https://vk.com', nullable: true, description: 'Ссылка на vk' })
    @Column({ nullable: true, length: 1024 })
    vk: string;

    @ApiProperty({ example: 'https://facebook.com', nullable: true, description: 'Ссылка на facebook' })
    @Column({ nullable: true, length: 1024 })
    facebook: string;

    @ApiProperty({ example: 'https://viber.com', nullable: true, description: 'Ссылка на viber' })
    @Column({ nullable: true, length: 1024 })
    viber: string;

    @ApiProperty({ example: 'https://whatsapp.com', nullable: true, description: 'Ссылка на whatsapp' })
    @Column({ nullable: true, length: 1024 })
    whatsapp: string;

    @ApiProperty({ example: 'https://telegram.com', nullable: true, description: 'Ссылка на telegram' })
    @Column({ nullable: true, length: 1024 })
    telegram: string;

    @ApiProperty({ example: '8 996 949 08 98', nullable: true, description: 'Телефон' })
    @Column({ nullable: true, length: 1024 })
    phone: string;

    @ApiProperty({ example: 'test@mail.ru', nullable: true, description: 'E-mail' })
    @Column({ nullable: true, length: 1024 })
    email: string;

    @ApiProperty({ example: 'https://bitrix.ru', nullable: true, description: 'Интеграционная ссылка на битрикс' })
    @Column({ nullable: true, default: '' })
    urlBitrix: string;

    @ApiProperty({ example: '123', nullable: true, description: 'ID интеграции' })
    @Column({ nullable: true, default: '' })
    amoClientId: string;

    @ApiProperty({ example: '123', nullable: true, description: 'Секретный ключ' })
    @Column({ nullable: true, default: '' })
    amoClientSecret: string;

    @ApiProperty({ example: 'yaandreyi96.amocrm.ru', nullable: true, description: 'Домен AmoCRM' })
    @Column({ nullable: true, default: '' })
    amoDomain: string;

    @ApiProperty({ example: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImIyOWZmYmI4NTI2OWQ4N2Q1', nullable: true, description: 'Долгострочный токен' })
    @Column({ nullable: true, default: '' })
    amoBearer: string;

    @ApiProperty({ description: 'Дополнительные телефоны' })
    @OneToMany(() => SettingsContactsEntity, (contacts) => contacts.phone)
    morePhone: SettingsContactsEntity[];

    @ApiProperty({ description: 'Дополнительные почты' })
    @OneToMany(() => SettingsContactsEntity, (contacts) => contacts.email)
    moreEmail: SettingsContactsEntity[];
}

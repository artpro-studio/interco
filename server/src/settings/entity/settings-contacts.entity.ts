import { SettingsEntity } from './settings.entity';
import { Column, ManyToOne, Entity } from 'typeorm';
import { ApiProperty } from '@nestjs/swagger';
import { DefaultBaseEntity } from './../../entity/base.entity';

@Entity({
    name: 'settings-contacts'
})
export class SettingsContactsEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'test@mail.ru', nullable: false, description: 'Контент' })
    @Column({ nullable: true, length: 1024 })
    content: string;

    @ApiProperty({ example: 'Описание', nullable: false, description: 'Описание' })
    @Column({ nullable: true, length: 1024 })
    description: string;

    @ApiProperty({ example: false, nullable: false, description: 'Телефон?' })
    @Column({ type: 'bool', default: false, nullable: false })
    isPhone: boolean;

    @ApiProperty({ description: 'Связь на почту' })
    @ManyToOne(() => SettingsEntity, (settings) => settings.moreEmail)
    email: SettingsEntity

    @ApiProperty({ description: 'Связь на телефон' })
    @ManyToOne(() => SettingsEntity, (settings) => settings.morePhone)
    phone: SettingsEntity
}
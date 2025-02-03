import { DefaultBaseEntity } from "src/entity/base.entity";
import { Entity, Column, OneToMany } from 'typeorm';
import { ApiProperty } from '@nestjs/swagger';
import { SettingsMenuItemEntity } from "./settings-menu-item.entity";

@Entity({
    name: 'settings_menu'
})
export class SettingsMenuEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Меню', nullable: false, description: 'Название меню' })
    @Column({ nullable: false, length: 512 })
    title: string;

    @ApiProperty({ example: 'top', nullable: false, description: 'Символьный код' })
    @Column({ nullable: true, length: 512 })
    slug: string;

    @ApiProperty({ description: 'Страница' })
    @OneToMany(() => SettingsMenuItemEntity, (point) => point.menu)
    points: SettingsMenuItemEntity[];
}

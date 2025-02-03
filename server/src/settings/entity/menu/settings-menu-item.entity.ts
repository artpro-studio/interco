import { DefaultBaseEntity } from "src/entity/base.entity";
import { ApiProperty } from '@nestjs/swagger';
import { Column, Entity, ManyToOne, Tree, TreeChildren, TreeParent } from 'typeorm';
import { PagesEntity } from "src/pages/entity/pages.entity";
import { SettingsMenuEntity } from "./settings-menu.entity";

@Entity({
    name: 'settings_menu_item'
})
@Tree("materialized-path")
export class SettingsMenuItemEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Меню', nullable: false, description: 'Название меню' })
    @Column({ nullable: false, length: 512 })
    title: string;

    @ApiProperty({ example: '#test', nullable: false, description: 'Hash' })
    @Column({ nullable: true, length: 512 })
    hash: string;

    @ApiProperty({ example: 1, nullable: false, description: 'Порядок' })
    @Column({ type: 'int', nullable: false, default: 0})
    order: number;

    @ApiProperty({ description: 'Меню' })
    @ManyToOne(() => SettingsMenuEntity, (menu) => menu.points)
    menu: SettingsMenuEntity;

    @ApiProperty({ description: 'Страница' })
    @ManyToOne(() => PagesEntity, (pages) => pages.settingsMenu)
    pages: PagesEntity;

    @TreeChildren()
    children: SettingsMenuItemEntity[]

    @TreeParent()
    parent: SettingsMenuItemEntity
}

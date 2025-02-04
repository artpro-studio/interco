import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseEntity } from "src/entity/base.entity";
import { Column, Entity, JoinColumn, OneToMany, OneToOne } from "typeorm";
import { PagesType } from "../interface";
import { RecordsEntity } from "./records.entity";
import { PagesComponentsEntity } from "./pages-components.entity";
import { SettingsMenuItemEntity } from "src/settings/entity/menu/settings-menu-item.entity";
import { PagesParamsValueEntity } from "./pages-params-value.entity";
import { PagesParamsEntity } from "./pages-params.entity";
import { PagesSeoEntity } from "./pages-seo.entity";

@Entity({
    name: 'pages'
})
export class PagesEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Название', nullable: false, description: 'Название' })
    @Column({ nullable: false, length: 1024 })
    name: string;

    @ApiProperty({ example: 'Описание', nullable: true, description: 'Описание' })
    @Column({ nullable: true,})
    description: string;

    @ApiProperty({ example: 'test', nullable: true, description: 'Символьный код' })
    @Column({ nullable: true})
    slug: string;

    @ApiProperty({ example: PagesType.LANDING, nullable: false, description: 'Тип' })
    @Column({ enum: PagesType, default: PagesType.LANDING, nullable: false})
    type: PagesType;

    @ApiProperty({ example: '/pages/News/index.vue', nullable: true,  description: 'Путь к странице компонента' })
    @Column({ type: 'json', nullable: true})
    pagePath: string;

    @ApiProperty({ description: 'Записи в блоге' })
    @OneToMany(() => RecordsEntity, (records) => records.pages)
    records: RecordsEntity[]

    @ApiProperty({ description: 'Компоненты' })
    @OneToMany(() => PagesComponentsEntity, (components) => components.pages)
    components: PagesComponentsEntity[];

    @ApiProperty({ description: 'Ссылка на меню' })
    @OneToMany(() => SettingsMenuItemEntity, (components) => components.pages)
    settingsMenu: SettingsMenuItemEntity[];

    @ApiProperty({ description: 'Парамметры' })
    @OneToMany(() => PagesParamsEntity, (paramsValue) => paramsValue.pages)
    params: PagesParamsEntity[];

    @ApiProperty({ description: 'Сео парамметры' })
    @OneToOne(() => PagesSeoEntity)
    @JoinColumn()
    seo: PagesSeoEntity;
}

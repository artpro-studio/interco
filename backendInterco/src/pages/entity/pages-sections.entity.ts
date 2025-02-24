import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseEntity } from "src/entity/base.entity";
import { Entity, ManyToMany, ManyToOne, OneToMany } from "typeorm";
import { PagesEntity } from "./pages.entity";
import { RecordsEntity } from "./records.entity";
import { PagesSectionsTitleValueEntity } from "./pages-sections-title.entity";
import { PagesSectionsDescriptionValueEntity } from "./pages-sections-description.entity";

@Entity({
    name: 'pages_sections'
})
export class PagesSectionsEntity extends DefaultBaseEntity {
    @ApiProperty({ description: 'Заголовок' })
    @OneToMany(() => PagesSectionsTitleValueEntity, (value) => value.section)
    title: PagesSectionsTitleValueEntity[];

    @ApiProperty({ description: 'Описание' })
    @OneToMany(() => PagesSectionsDescriptionValueEntity, (value) => value.section)
    description: PagesSectionsDescriptionValueEntity[];

    @ApiProperty({ description: 'Страница' })
    @ManyToOne(() => PagesEntity, (pages) => pages.sections)
    pages: PagesEntity;

    @ApiProperty({ description: 'Записи' })
    @ManyToMany(() => RecordsEntity, (records) => records.sections)
    records: RecordsEntity[];
}

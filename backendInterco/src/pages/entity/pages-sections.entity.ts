import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseEntity } from "src/entity/base.entity";
import { Entity, ManyToMany, ManyToOne, OneToMany } from "typeorm";
import { PagesEntity } from "./pages.entity";
import { RecordsEntity } from "./records.entity";
import { PagesSectionsValueEntity } from "./pages-sections-value.entity";

@Entity({
    name: 'pages_sections'
})
export class PagesSectionsEntity extends DefaultBaseEntity {
    @ApiProperty({ description: 'Значения' })
    @OneToMany(() => PagesSectionsValueEntity, (value) => value.section)
    value: PagesSectionsValueEntity[];

    @ApiProperty({ description: 'Страница' })
    @ManyToOne(() => PagesEntity, (pages) => pages.sections)
    pages: PagesEntity;

    @ApiProperty({ description: 'Записи' })
    @ManyToMany(() => RecordsEntity, (records) => records.sections)
    records: RecordsEntity[];
}

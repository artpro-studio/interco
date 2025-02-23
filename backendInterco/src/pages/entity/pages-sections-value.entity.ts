import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseEntity } from "src/entity/base.entity";
import { Column, Entity, ManyToOne } from "typeorm";
import { ILangPages } from "../interface";
import { PagesSectionsEntity } from "./pages-sections.entity";

@Entity({
    name: 'pages_sections_value'
})
export class PagesSectionsValueEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Значение', nullable: false, description: 'Значение' })
    @Column({ nullable: false})
    value: string;

    @ApiProperty({ example: ILangPages.RU, enum: ILangPages, enumName: 'ILangPages', nullable: true, description: 'Язык' })
    @Column({ type: 'enum', enum: ILangPages, nullable: false})
    lang: ILangPages;

    @ApiProperty({ description: 'Раздел' })
    @ManyToOne(() => PagesSectionsEntity, (section) => section.value)
    section: PagesSectionsEntity;
}

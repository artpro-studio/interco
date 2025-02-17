import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseEntity } from "src/entity/base.entity";
import { Column, Entity, ManyToOne } from "typeorm";
import { ILangPages } from "../interface";
import { PagesIblockSectionEntity } from "./pages-iblock-section.entity";

@Entity({
    name: 'pages_iblock_section_value'
})
export class PagesIblockSectionValueEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Значение', nullable: false, description: 'Значение' })
    @Column({ nullable: false})
    value: string;

    @ApiProperty({ example: ILangPages.RU, enum: ILangPages, enumName: 'ILangPages', nullable: true, description: 'Язык' })
    @Column({ type: 'enum', enum: ILangPages, nullable: false})
    lang: ILangPages;

    @ApiProperty({ description: 'Раздел' })
    @ManyToOne(() => PagesIblockSectionEntity, (section) => section.value)
    section: PagesIblockSectionEntity;
}

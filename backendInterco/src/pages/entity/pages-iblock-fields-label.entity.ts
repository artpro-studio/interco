import { DefaultBaseEntity } from "src/entity/base.entity";
import { ILangPages } from "../interface";
import { PagesIBlockFieldsEntity } from "./pages-iblock-fields.entity";
import { Column, Entity, ManyToOne } from "typeorm";
import { ApiProperty } from "@nestjs/swagger";

@Entity({
    name: 'pages_iblock_fields_label'
})
export class PagesIblockFieldsLabelEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Текст у поля', nullable: false, description: 'Текст у поля' })
    @Column({ nullable: false})
    value: string;

    @ApiProperty({ example: ILangPages.RU, enum: ILangPages, enumName: 'ILangPages', nullable: true, description: 'Язык' })
    @Column({ type: 'enum', enum: ILangPages, nullable: false})
    lang: ILangPages;

    @ApiProperty({ description: 'Поле' })
    @ManyToOne(() => PagesIBlockFieldsEntity, (field) => field.label )
    field: PagesIBlockFieldsEntity;
}

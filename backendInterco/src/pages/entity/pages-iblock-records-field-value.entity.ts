import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseEntity } from "src/entity/base.entity";
import { Column, Entity, ManyToOne } from "typeorm";
import { PagesIblockRecordsFieldEntity } from "./pages-iblock-records-field.entity";
import { ILangPages } from "../interface";

@Entity({
    name: 'pages_iblock_records_field_value'
})
export class PagesIblockRecordsFieldValueEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Значение', nullable: false, description: 'Значение' })
    @Column({ nullable: false})
    value: string;

    @ApiProperty({ example: ILangPages.RU, enum: ILangPages, enumName: 'ILangPages', nullable: true, description: 'Язык' })
    @Column({ type: 'enum', enum: ILangPages, nullable: false})
    lang: ILangPages;

    @ApiProperty({ description: 'Тип поля' })
    @ManyToOne(() => PagesIblockRecordsFieldEntity, (recordField) => recordField.value)
    recordField: PagesIblockRecordsFieldEntity;

}

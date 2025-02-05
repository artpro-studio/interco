import { PagesIblockEntity } from "./pages-iblock.entity";
import { IIblockField } from "../interface";
import { PagesIblockFieldsLabelEntity } from "./pages-iblock-fields-label.entity";
import { Column, Entity, ManyToOne, OneToMany } from "typeorm";
import { DefaultBaseEntity } from "src/entity/base.entity";
import { ApiProperty } from "@nestjs/swagger";
import { PagesIblockRecordsFieldEntity } from "./pages-iblock-records-field.entity";


@Entity({
    name: 'pages_iblock_fields'
})
export class PagesIBlockFieldsEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Название', nullable: false, description: 'Название' })
    @Column({ nullable: false, length: 1024 })
    name: string;

    @ApiProperty({ example: 'Символьный код', nullable: false, description: 'Символьный код' })
    @Column({ nullable: false, length: 1024 })
    slug: string;

    @ApiProperty({ example: IIblockField.TEXT, enum: IIblockField, enumName: 'IIblockField', nullable: true, description: 'Тип поля' })
    @Column({ type: 'enum', enum: IIblockField, nullable: false})
    type: IIblockField;

    @ApiProperty({ description: 'Label' })
    @OneToMany(() => PagesIblockFieldsLabelEntity, (label) => label.field)
    label: PagesIblockFieldsLabelEntity[]

    @ApiProperty({ description: 'Информационный блок' })
    @ManyToOne(() => PagesIblockEntity, (iblock) => iblock.fields)
    iblock: PagesIblockEntity;

    @ApiProperty({ description: 'Поля у записей iblock' })
    @OneToMany(() => PagesIblockRecordsFieldEntity, (recrodField) => recrodField.field)
    recordFields: PagesIblockRecordsFieldEntity[];
}

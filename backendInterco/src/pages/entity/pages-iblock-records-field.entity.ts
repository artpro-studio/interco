import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseEntity } from "src/entity/base.entity";
import { Entity, ManyToOne, OneToMany } from "typeorm";
import { PagesIblockRecordsEntity } from "./pages-iblock-records.entity";
import { PagesIBlockFieldsEntity } from "./pages-iblock-fields.entity";
import { PagesIblockRecordsFieldValueEntity } from "./pages-iblock-records-field-value.entity";

@Entity({
    name: 'pages_iblock_records_field'
})
export class PagesIblockRecordsFieldEntity extends DefaultBaseEntity {
    @ApiProperty({ description: 'Запись' })
    @ManyToOne(() => PagesIblockRecordsEntity, (record) => record.fields)
    record: PagesIblockRecordsEntity;

    @ApiProperty({ description: 'Тип поля' })
    @ManyToOne(() => PagesIBlockFieldsEntity, (field) => field.recordFields)
    field: PagesIBlockFieldsEntity;

    @ApiProperty({ description: 'Значение' })
    @OneToMany(() => PagesIblockRecordsFieldValueEntity, (value) => value.recordField)
    value: PagesIblockRecordsFieldValueEntity[]
}

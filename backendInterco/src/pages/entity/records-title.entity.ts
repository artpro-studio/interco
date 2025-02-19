import { DefaultBaseEntity } from "src/entity/base.entity";
import { RecordsTitleValueEntity } from "./records-title-value.entity";
import { RecordsEntity } from "./records.entity";
import { ApiProperty } from "@nestjs/swagger";
import { Entity, OneToMany } from "typeorm";

@Entity({
    name: 'records_title'
 })
export class RecordsTitleEntity extends DefaultBaseEntity {
    @ApiProperty({ description: 'Значения' })
    @OneToMany(() => RecordsTitleValueEntity, (value) => value.recordTitle)
    value: RecordsTitleValueEntity[];
}

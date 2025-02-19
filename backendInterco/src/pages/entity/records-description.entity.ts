import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseEntity } from "src/entity/base.entity";
import { Entity, OneToMany } from "typeorm";
import { RecordsDescriptionValueEntity } from "./records-description-value.entity";

@Entity({
    name: 'records_description'
 })
export class RecordsDescriptionEntity extends DefaultBaseEntity {
    @ApiProperty({ description: 'Значения' })
    @OneToMany(() => RecordsDescriptionValueEntity, (value) => value.recordDescription)
    value: RecordsDescriptionValueEntity[];
}

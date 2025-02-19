import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseEntity } from "src/entity/base.entity";
import { Column, Entity, ManyToOne } from "typeorm";
import { ILangPages } from "../interface";
import { RecordsTitleEntity } from "./records-title.entity";
import { RecordsDescriptionEntity } from "./records-description.entity";

@Entity({
    name: 'records_description_value'
 })
export class RecordsDescriptionValueEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Значение', nullable: false, description: 'Значение' })
    @Column({ nullable: false})
    value: string;

    @ApiProperty({ example: ILangPages.RU, enum: ILangPages, enumName: 'ILangPages', nullable: true, description: 'Язык' })
    @Column({ type: 'enum', enum: ILangPages, nullable: false})
    lang: ILangPages;

    @ApiProperty({ description: 'Запись' })
    @ManyToOne(() => RecordsDescriptionEntity, (description) => description.value)
    recordDescription: RecordsDescriptionEntity;
}

import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseEntity } from "src/entity/base.entity";
import { Column, Entity, ManyToOne } from "typeorm";
import { ILangPages } from "../interface";
import { RecordsTitleEntity } from "./records-title.entity";

@Entity({
    name: 'records_title_value'
 })
export class RecordsTitleValueEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Значение', nullable: false, description: 'Значение' })
    @Column({ nullable: false})
    value: string;

    @ApiProperty({ example: ILangPages.RU, enum: ILangPages, enumName: 'ILangPages', nullable: true, description: 'Язык' })
    @Column({ type: 'enum', enum: ILangPages, nullable: false})
    lang: ILangPages;

    @ApiProperty({ description: 'Запись' })
    @ManyToOne(() => RecordsTitleEntity, (title) => title.value)
    recordTitle: RecordsTitleEntity;
}

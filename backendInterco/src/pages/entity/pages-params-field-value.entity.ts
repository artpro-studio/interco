import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseEntity } from "src/entity/base.entity";
import { Column, Entity, ManyToOne } from "typeorm";
import { ILangPages } from "../interface";
import { PagesParamsFieldEntity } from "./pages-params-field.entity";

@Entity({
    name: 'pages_params_field_value'
 })
export class PagesParamsFieldValueEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Значение', nullable: false, description: 'Значение' })
    @Column({ nullable: false})
    value: string;

    @ApiProperty({ example: ILangPages.RU, enum: ILangPages, enumName: 'ILangPages', nullable: true, description: 'Язык' })
    @Column({ type: 'enum', enum: ILangPages, nullable: false})
    lang: ILangPages;

    @ApiProperty({ description: 'Запись' })
    @ManyToOne(() => PagesParamsFieldEntity, (field) => field.value)
    pagesParamsField: PagesParamsFieldEntity;
}

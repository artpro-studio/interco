import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseEntity } from "src/entity/base.entity";
import { Column, Entity, ManyToOne } from "typeorm";
import { IFieldTypeSeo, ILangPages } from "../interface";
import { RecordsSeoEntity } from "./records-seo.entity";

@Entity({
    name: 'records_seo_params'
})
export class RecordsSeoParamsEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Заголовок' , nullable: true })
    @Column({ nullable: false, default: '', length: 2048})
    content: string;

    @ApiProperty({ example: ILangPages.RU, enum: ILangPages, enumName: 'ILangPages', nullable: true })
    @Column({ type: 'enum', enum: ILangPages, nullable: false})
    lang: ILangPages;

    @ApiProperty({ example: IFieldTypeSeo.TITLE, enum: IFieldTypeSeo, enumName: 'IFieldTypeSeo', nullable: true })
    @Column({ type: 'enum', enum: IFieldTypeSeo, nullable: false})
    fieldType: IFieldTypeSeo;

    @ApiProperty({ type: () => RecordsSeoEntity, nullable: true })
    @ManyToOne(() => RecordsSeoEntity, (pages) => pages.params)
    recordSeo: RecordsSeoEntity;
}

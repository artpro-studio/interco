import { DefaultBaseEntity } from "src/entity/base.entity";
import { IFieldTypeSeo, ILangTypeSeo } from "../interface";
import { ApiProperty } from "@nestjs/swagger";
import { Column, Entity, ManyToOne } from "typeorm";
import { PagesSeoEntity } from "./pages-seo.entity";

@Entity({
    name: 'pages_seo_params'
})
export class PagesSeoParamsEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Заголовок' , nullable: true })
    @Column({ nullable: false, default: '', length: 2048})
    content: string;

    @ApiProperty({ example: ILangTypeSeo.RU, enum: ILangTypeSeo, enumName: 'ILangTypeSeo', nullable: true })
    @Column({ type: 'enum', enum: ILangTypeSeo, nullable: false})
    lang: ILangTypeSeo;

    @ApiProperty({ example: IFieldTypeSeo.TITLE, enum: IFieldTypeSeo, enumName: 'IFieldTypeSeo', nullable: true })
    @Column({ type: 'enum', enum: IFieldTypeSeo, nullable: false})
    fieldType: IFieldTypeSeo;

    @ApiProperty({ type: () => PagesSeoEntity, nullable: true })
    @ManyToOne(() => PagesSeoEntity, (pages) => pages.params)
    pagesSeo: PagesSeoEntity;
}

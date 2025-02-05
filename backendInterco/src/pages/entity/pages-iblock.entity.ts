import { DefaultBaseEntity } from "src/entity/base.entity";
import { PagesIBlockFieldsEntity } from "./pages-iblock-fields.entity";
import { Column, Entity, ManyToOne, OneToMany } from "typeorm";
import { ApiProperty } from "@nestjs/swagger";
import { PagesDto } from "../dto/pages/create-pages.dto";
import { PagesEntity } from "./pages.entity";
import { PagesIblockRecordsEntity } from "./pages-iblock-records.entity";

@Entity({
    name: 'pages_iblock'
})
export class PagesIblockEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Название', nullable: false, description: 'Название' })
    @Column({ nullable: false, length: 1024 })
    name: string;

    @ApiProperty({ example: 'Символьный код', nullable: false, description: 'Символьный код' })
    @Column({ nullable: false, length: 1024 })
    slug: string;

    @ApiProperty({ type: () => PagesDto, description: 'Страница' })
    @ManyToOne(() => PagesEntity, (pages) => pages.iblocks)
    page: PagesEntity;

    @ApiProperty({ description: 'Поля' })
    @OneToMany(() => PagesIBlockFieldsEntity, (pagesFields) => pagesFields.iblock)
    fields: PagesIBlockFieldsEntity[];

    @ApiProperty({ description: 'Записи' })
    @OneToMany(() => PagesIblockRecordsEntity, (records) => records.iblock)
    records: PagesIblockRecordsEntity[]
}

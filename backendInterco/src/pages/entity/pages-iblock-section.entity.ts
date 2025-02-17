import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseEntity } from "src/entity/base.entity";
import { Entity, ManyToMany, ManyToOne, OneToMany } from "typeorm";
import { PagesIblockSectionValueEntity } from "./pages-iblock-section-value.entity";
import { PagesIblockEntity } from "./pages-iblock.entity";
import { PagesIblockRecordsEntity } from "./pages-iblock-records.entity";

@Entity({
    name: 'pages_iblock_section'
})
export class PagesIblockSectionEntity extends DefaultBaseEntity{
    @ApiProperty({ description: 'Iblock' })
    @ManyToOne(() => PagesIblockEntity, (iblock) => iblock.sections)
    iblock: PagesIblockEntity;

    @ApiProperty({ description: 'Разделы' })
    @ManyToMany(() => PagesIblockRecordsEntity, (record) => record.sections)
    records: PagesIblockRecordsEntity[];

    @ApiProperty({ description: 'Значение' })
    @OneToMany(() => PagesIblockSectionValueEntity, (value) => value.section)
    value: PagesIblockSectionValueEntity[]
}

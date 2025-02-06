import { DefaultBaseEntity } from "src/entity/base.entity";
import { Column, Entity, ManyToOne, OneToMany } from "typeorm";
import { PagesIblockEntity } from "./pages-iblock.entity";
import { ApiProperty } from "@nestjs/swagger";
import { PagesIblockRecordsFieldEntity } from "./pages-iblock-records-field.entity";

@Entity({
    name: 'pages_iblock_records'
})
export class PagesIblockRecordsEntity extends DefaultBaseEntity {
    @ApiProperty({type: () => 'number', nullable: true, required: false, description: 'Поля у записи' })
    @Column({ type: 'int', default: 0, nullable: true})
    sort: number;

    @ApiProperty({ description: 'Поля у записи' })
    @OneToMany(() => PagesIblockRecordsFieldEntity, (recordsField) => recordsField.record)
    fields: PagesIblockRecordsFieldEntity[];

    @ApiProperty({ description: 'Инфоблок' })
    @ManyToOne(() => PagesIblockEntity, (iblock) => iblock.records)
    iblock: PagesIblockEntity;
}

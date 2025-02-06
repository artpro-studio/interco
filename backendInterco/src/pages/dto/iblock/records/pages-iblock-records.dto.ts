import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { PagesIblockDto } from "../pages-iblock.dto";
import { PagesIblockRecordsFieldDto } from "./field/pages-iblock-records-field.dto";

export class PagesIblockRecordsDto extends DefaultBaseDto {
    @ApiProperty({type: () => 'number', nullable: true, required: false, description: 'Поля у записи' })
    sort?: number;

    @ApiProperty({ type: () => [PagesIblockRecordsFieldDto], required: false, nullable: true, description: 'Поля у записи' })
    fields?: PagesIblockRecordsFieldDto[];

    @ApiProperty({ type: () => PagesIblockDto, required: false, nullable: true, description: 'Инфоблок' })
    iblock?: PagesIblockDto
}

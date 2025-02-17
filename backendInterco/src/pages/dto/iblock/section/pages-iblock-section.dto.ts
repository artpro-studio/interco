import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { PagesIblockDto } from "../pages-iblock.dto";
import { PagesIblockRecordsDto } from "../records/pages-iblock-records.dto";
import { PagesIblockSectionValueDto } from "./pages-iblock-section-value.dto";

export class PagesIblockSectionDto extends DefaultBaseDto{
    @ApiProperty({ type: () => PagesIblockDto, required: false, nullable: true, description: 'Iblock' })
    iblock?: PagesIblockDto;

    @ApiProperty({ type: () => [PagesIblockRecordsDto], required: false, nullable: true, description: 'Разделы' })
    records?: PagesIblockRecordsDto[];

    @ApiProperty({ type: () => [PagesIblockSectionValueDto], required: false, nullable: true, description: 'Значение' })
    value?: PagesIblockSectionValueDto[]
}

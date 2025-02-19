import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { PagesDto } from "../pages/create-pages.dto";
import { PagesIBlockFieldsDto } from "./fields/pages-iblock-fields.dto";
import { PagesIblockSectionDto } from "./section/pages-iblock-section.dto";
import { PagesIblockRecordsDto } from "./records/pages-iblock-records.dto";

export class PagesIblockDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Название', nullable: false, description: 'Название' })
    name: string;

    @ApiProperty({ example: 'Символьный код', nullable: false, description: 'Символьный код' })
    slug: string;

    @ApiProperty({ type: () => 'object', nullable: true, required: false, description: 'Атрибуты' })
    attributes?: any;

    @ApiProperty({ type: () => PagesDto, nullable: true, required: false, description: 'Страница' })
    page?: PagesDto;

    @ApiProperty({ type: () => [PagesIBlockFieldsDto], required: false, nullable: true, description: 'Поля' })
    fields?: PagesIBlockFieldsDto[];

    @ApiProperty({ type: () => [PagesIblockSectionDto], required: false, nullable: true, description: 'Разделы' })
    sections?: PagesIblockSectionDto[];

    @ApiProperty({ type: () => [PagesIblockRecordsDto], required: false, nullable: true, description: 'Записи' })
    records?: PagesIblockRecordsDto[];
}

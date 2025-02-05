import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { PagesDto } from "../pages/create-pages.dto";
import { PagesIBlockFieldsDto } from "./fields/pages-iblock-fields.dto";

export class PagesIblockDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Название', nullable: false, description: 'Название' })
    name: string;

    @ApiProperty({ example: 'Символьный код', nullable: false, description: 'Символьный код' })
    slug: string;

    @ApiProperty({ type: () => PagesDto, nullable: true, required: false, description: 'Страница' })
    page?: PagesDto;

    @ApiProperty({ type: () => [PagesIBlockFieldsDto], required: false, nullable: true, description: 'Поля' })
    fields?: PagesIBlockFieldsDto[];
}

import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { ILangPages } from "src/pages/interface";
import { PagesIblockSectionDto } from "./pages-iblock-section.dto";

export class PagesIblockSectionValueDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Значение', nullable: false, description: 'Значение' })
    value: string;

    @ApiProperty({ example: ILangPages.RU, enum: ILangPages, enumName: 'ILangPages', nullable: true, description: 'Язык' })
    lang: ILangPages;

    @ApiProperty({type: () => PagesIblockSectionDto, required: false, nullable: true, description: 'Раздел' })
    section?: PagesIblockSectionDto;
}

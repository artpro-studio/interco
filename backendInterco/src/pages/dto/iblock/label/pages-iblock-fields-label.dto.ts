import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { ILangPages } from "src/pages/interface";
import { PagesIBlockFieldsDto } from "../fields/pages-iblock-fields.dto";

export class PagesIblockFieldsLabelDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Текст у поля', nullable: false, description: 'Текст у поля' })
    value: string;

    @ApiProperty({ example: ILangPages.RU, enum: ILangPages, enumName: 'ILangPages', nullable: true, description: 'Язык' })
    lang: ILangPages;

    @ApiProperty({ type: () => PagesIBlockFieldsDto, nullable: true, required: false, description: 'Поле' })
    field: PagesIBlockFieldsDto;
}

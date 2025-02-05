import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { ILangPages } from "src/pages/interface";
import { PagesIblockRecordsFieldDto } from "./pages-iblock-records-field.dto";

export class PagesIblockRecordsFieldValueDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Значение', nullable: false, description: 'Значение' })
    value: string;

    @ApiProperty({ example: ILangPages.RU, enum: ILangPages, enumName: 'ILangPages', nullable: true, description: 'Язык' })
    lang: ILangPages;

    @ApiProperty({ type: () => PagesIblockRecordsFieldDto, required: false, nullable: true, description: 'Тип поля' })
    recordField?: PagesIblockRecordsFieldDto;
}

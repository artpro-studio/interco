import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { ILangPages } from "src/pages/interface";
import { PagesParamsFieldDto } from "./pages-params-field.dto";

export class PagesParamsFieldValueDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Значение', nullable: false, description: 'Значение' })
    value: string;

    @ApiProperty({ example: ILangPages.RU, enum: ILangPages, enumName: 'ILangPages', nullable: true, description: 'Язык' })
    lang: ILangPages;

    @ApiProperty({ type: () => PagesParamsFieldDto, required: false, nullable: true, description: 'Запись' })
    pagesParamsField?: PagesParamsFieldDto;
}

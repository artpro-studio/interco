import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { ILangPages } from "src/pages/interface";
import { PagesSectionsDto } from "./pages-sections.dto";

export class PagesSectionsValueDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Значение', nullable: false, description: 'Значение' })
    value: string;

    @ApiProperty({ example: ILangPages.RU, enum: ILangPages, enumName: 'ILangPages', nullable: true, description: 'Язык' })
    lang: ILangPages;

    @ApiProperty({ type: () => PagesSectionsDto, nullable: true, required: false, description: 'Раздел' })
    section?: PagesSectionsDto;
}

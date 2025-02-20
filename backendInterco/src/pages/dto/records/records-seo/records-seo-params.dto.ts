import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { IFieldTypeSeo, ILangPages, ILangTypeSeo } from "src/pages/interface";
import { RecordsSeoDto } from "./records-seo.dto";

export class RecordsSeoParamsDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Заголовок' , nullable: true })
    content: string;

    @ApiProperty({ example: ILangPages.RU, enum: ILangPages, enumName: 'ILangPages', nullable: true })
    lang: ILangPages;

    @ApiProperty({ example: IFieldTypeSeo.TITLE, enum: IFieldTypeSeo, enumName: 'IFieldTypeSeo', nullable: true })
    fieldType: IFieldTypeSeo;

    @ApiProperty({ type: () => RecordsSeoDto, nullable: true, required: false })
    recordSeo?: RecordsSeoDto;
}

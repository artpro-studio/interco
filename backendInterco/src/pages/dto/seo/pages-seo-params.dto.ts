import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { IFieldTypeSeo, ILangTypeSeo } from "src/pages/interface";
import { PagesSeoDto } from "./pages-seo.dto";

export class PagesSeoParamsDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Заголовок' , nullable: true })
    content: string;

    @ApiProperty({ example: ILangTypeSeo.RU, enum: ILangTypeSeo, enumName: 'ILangTypeSeo', nullable: true })
    lang: ILangTypeSeo;

    @ApiProperty({ example: IFieldTypeSeo.TITLE, enum: IFieldTypeSeo, enumName: 'IFieldTypeSeo', nullable: true })
    fieldType: IFieldTypeSeo;

    @ApiProperty({ type: () => PagesSeoDto, nullable: true, required: false })
    pagesSeo?: PagesSeoDto;
}

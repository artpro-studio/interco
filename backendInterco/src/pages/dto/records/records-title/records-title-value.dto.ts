import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { ILangPages } from "src/pages/interface";
import { RecordsTitleDto } from "./records-title.dto";

export class RecordsTitleValueDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Значение', nullable: false, description: 'Значение' })
    value: string;

    @ApiProperty({ example: ILangPages.RU, enum: ILangPages, enumName: 'ILangPages', nullable: true, description: 'Язык' })
    lang: ILangPages;

    @ApiProperty({ type: () => RecordsTitleDto, required: false, nullable: true, description: 'Запись' })
    recordTitle?: RecordsTitleDto;
}

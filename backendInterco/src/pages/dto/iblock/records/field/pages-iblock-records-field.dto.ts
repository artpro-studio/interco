import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { PagesIblockRecordsDto } from "../pages-iblock-records.dto";
import { PagesIBlockFieldsDto } from "../../fields/pages-iblock-fields.dto";
import { PagesIblockRecordsFieldValueDto } from "./pages-iblock-records-field-value.dto";

export class PagesIblockRecordsFieldDto extends DefaultBaseDto{
    @ApiProperty({ type: () => PagesIblockRecordsDto, required: false, nullable: true, description: 'Запись' })
    record?: PagesIblockRecordsDto;

    @ApiProperty({ type: () => PagesIBlockFieldsDto, required: false, nullable: true, description: 'Тип поля' })
    field?: PagesIBlockFieldsDto;

    @ApiProperty({ type: () => [PagesIblockRecordsFieldValueDto], required: false, nullable: true, description: 'Значение' })
    value?: PagesIblockRecordsFieldValueDto[]
}

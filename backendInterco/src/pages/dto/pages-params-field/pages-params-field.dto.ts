import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { PagesDto } from "../pages/create-pages.dto";
import { PagesParamsDto } from "../pages-params/pages-params.dto";
import { IsNotEmpty } from "class-validator";
import { RecordsDto } from "../records/create-records.dto";
import { PagesParamsFieldValueDto } from "./pages-params-field-value.dto";

export class PagesParamsFieldDto extends DefaultBaseDto {
    @ApiProperty({type: () => [PagesParamsFieldValueDto], nullable: true, required: false, description: 'Значение' })
    value?: PagesParamsFieldValueDto[];

    @ApiProperty({ type: () => PagesParamsDto, required: false, nullable: true, description: 'Парамметр' })
    params?: PagesParamsDto;

    @ApiProperty({ type: () => RecordsDto, required: false, nullable: true, description: 'Запись(статья)' })
    record: RecordsDto;
}

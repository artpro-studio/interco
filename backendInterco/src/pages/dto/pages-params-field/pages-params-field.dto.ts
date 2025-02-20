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
}

export class FullPagesParamsFieldDto extends PagesParamsFieldDto {
    @ApiProperty({ type: () => PagesParamsDto, description: 'Парамметр' })
    params?: PagesParamsDto;

    @ApiProperty({ type: () => RecordsDto, description: 'Запись(статья)' })
    record: RecordsDto;
}

export class CreatePagesParamsFieldDto extends PagesParamsFieldDto {
    @ApiProperty({ description: 'Парамметр' })
    @IsNotEmpty({message: 'Парамметр обьязательное поле'})
    params: number;

    @ApiProperty({ type: () => RecordsDto, description: 'Запись(статья)' })
    @IsNotEmpty({message: 'ID записи обьязательное поле'})
    record: number;
}

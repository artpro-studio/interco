import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { RecordsDto } from "../create-records.dto";
import { RecordsTitleValueDto } from "./records-title-value.dto";

export class RecordsTitleDto extends DefaultBaseDto {
    @ApiProperty({ type: () => [RecordsTitleValueDto], nullable: true, required: false, description: 'Значения' })
    value?: RecordsTitleValueDto[];
}

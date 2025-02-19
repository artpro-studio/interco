import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { RecordsDescriptionValueDto } from "./records-description-value.dto";

export class RecordsDescriptionDto extends DefaultBaseDto {
    @ApiProperty({ type: () => [RecordsDescriptionValueDto], nullable: true, required: false, description: 'Значения' })
    value?: RecordsDescriptionValueDto[];
}

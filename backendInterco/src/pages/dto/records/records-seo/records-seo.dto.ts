import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { RecordsSeoParamsDto } from "./records-seo-params.dto";

export class RecordsSeoDto extends DefaultBaseDto {
    @ApiProperty({ type: () => [RecordsSeoParamsDto], nullable: true, required: false })
    params?: RecordsSeoParamsDto[];
}

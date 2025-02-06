import { ApiProperty } from "@nestjs/swagger";
import { IsObject } from "class-validator";
import { ResultDto } from "src/dto/reponse.dto";

export class ResultPagesSeoPublicDto extends ResultDto {
    @ApiProperty({ type: () => 'object', nullable: true, required: false, description: 'Ответ' })
    @IsObject()
    entity: Record<string, any>;
}

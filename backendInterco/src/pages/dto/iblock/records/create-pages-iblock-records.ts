import { ApiProperty } from "@nestjs/swagger";
import { IsObject } from "class-validator";

export class CreatePagesIblockRecordDto {
    @ApiProperty({ type: () => Number, nullable: true, required: false, description: 'ID iblock' })
    iblockID: number;

    @ApiProperty({ type: () => 'object', nullable: true, required: false, description: 'Форма' })
    @IsObject()
    data: Record<string, any>;
}

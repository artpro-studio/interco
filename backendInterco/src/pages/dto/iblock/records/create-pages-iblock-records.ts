import { ApiProperty } from "@nestjs/swagger";
import { IsObject } from "class-validator";
import { PagesIblockSectionDto } from "../section/pages-iblock-section.dto";

export class CreatePagesIblockRecordDto {
    @ApiProperty({ type: () => Number, nullable: true, required: false, description: 'ID iblock' })
    iblockID: number;

    @ApiProperty({ type: () => [PagesIblockSectionDto], required: false, nullable: true, description: 'Разделы' })
    sections?: PagesIblockSectionDto[];

    @ApiProperty({ type: () => 'object', nullable: true, required: false, description: 'Форма' })
    @IsObject()
    data: Record<string, any>;
}

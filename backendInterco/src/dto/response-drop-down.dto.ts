import { ApiProperty } from "@nestjs/swagger";
import { ResultDto, ResultPaginationOptionDto } from "./reponse.dto";

export class DropDownDto {
    @ApiProperty({ example: 1, description: 'ID записи' })
    value: number;

    @ApiProperty({ example: 'Текст', description: 'Текст записи' })
    label: string;
}

export class DropDownOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [DropDownDto], description: 'Ответ' })
    entity: DropDownDto[]
}

export class ResultDropDownDto extends ResultDto {
    @ApiProperty({ type: () => DropDownOptionDto, description: 'Ответ' })
    entity: DropDownOptionDto
}
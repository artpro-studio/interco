import { ApiProperty } from "@nestjs/swagger";
import { BaseQuery, ResultDto, ResultPaginationOptionDto } from "src/dto/reponse.dto";
import { CreateRecordsDto, FullRecordsDto, RecordsDto } from "./create-records.dto";

export class RecordsQuery extends BaseQuery {
    @ApiProperty({ example: 1, nullable: true, description: 'ID страницы' })
    id: number;

    @ApiProperty({ example: [1], isArray: true, nullable: true, description: 'IDs страниц' })
    pages: number[];
}

export class RecordsQuerySlug extends BaseQuery {
    @ApiProperty({ example: 'news', nullable: false, description: 'Символьный код страницы' })
    slug: string;
}
export class RecordsOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [FullRecordsDto], nullable: true, description: 'Ответ' })
    entity: FullRecordsDto[];
}

export class RecordsListDto extends ResultDto {
    @ApiProperty({ type: () => RecordsOptionDto, nullable: true, description: 'Ответ'})
    entity: RecordsOptionDto;
}

export class ResultRecordsDto extends ResultDto {
    @ApiProperty({ type: () => RecordsDto, nullable: true, description: 'Ответ'})
    entity?: RecordsDto;
}

export class ResultRecordsFullDto extends ResultDto {
    @ApiProperty({ type: () => FullRecordsDto, nullable: true, description: 'Ответ'})
    entity?: FullRecordsDto;
}

export class ResultRecordsCreateDto extends ResultDto {
    @ApiProperty({ type: () => CreateRecordsDto, nullable: true, description: 'Ответ'})
    entity?: CreateRecordsDto;
}

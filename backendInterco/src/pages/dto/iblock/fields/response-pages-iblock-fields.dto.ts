import { ApiProperty } from "@nestjs/swagger";
import { BaseQuery, ResultDto, ResultPaginationOptionDto } from "src/dto/reponse.dto";
import { PagesIBlockFieldsDto } from "./pages-iblock-fields.dto";

export class PagesIblockFieldsQuery extends BaseQuery {
    @ApiProperty({nullable: true, description: 'ID iblock' })
    iblockID: number;
}

export class PagesIblockFieldsOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [PagesIBlockFieldsDto], nullable: true, description: 'Ответ' })
    entity: PagesIBlockFieldsDto[];
}

export class PagesIblockFieldsListDto extends ResultDto {
    @ApiProperty({ type: () => PagesIblockFieldsOptionDto, nullable: true, description: 'Ответ'})
    entity: PagesIblockFieldsOptionDto;
}

export class ResultPagesIblockFieldsDto extends ResultDto {
    @ApiProperty({ type: () => PagesIBlockFieldsDto, nullable: true, description: 'Ответ'})
    entity: PagesIBlockFieldsDto;
}

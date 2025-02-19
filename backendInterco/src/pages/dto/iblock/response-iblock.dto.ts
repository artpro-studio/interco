import { ApiProperty } from "@nestjs/swagger";
import { BaseQuery, ResultDto, ResultPaginationOptionDto } from "src/dto/reponse.dto";
import { PagesIblockDto } from "./pages-iblock.dto";

export class PagesIblockQuery extends BaseQuery {
    @ApiProperty({nullable: true, description: 'ID страницы' })
    pageID: number;
}

export class PagesIblockOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [PagesIblockDto], nullable: true, description: 'Ответ' })
    entity: PagesIblockDto[];
}

export class PagesIblockListDto extends ResultDto {
    @ApiProperty({ type: () => PagesIblockOptionDto, nullable: true, description: 'Ответ'})
    entity: PagesIblockOptionDto;
}

export class ResultPagesIblockDto extends ResultDto {
    @ApiProperty({ type: () => PagesIblockDto, nullable: true, description: 'Ответ'})
    entity: PagesIblockDto;
}

export class ResultPagesIblocksDto extends ResultDto {
    @ApiProperty({ type: () => [PagesIblockDto], nullable: true, description: 'Ответ'})
    entity: PagesIblockDto[];
}

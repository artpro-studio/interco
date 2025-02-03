import { ApiProperty } from "@nestjs/swagger";
import { BaseQuery, ResultDto, ResultPaginationOptionDto } from "src/dto/reponse.dto";
import { FullPagesDto, PagesDto } from "./create-pages.dto";
import { PagesType } from "src/pages/interface";

export class PagesQuery extends BaseQuery {
    @ApiProperty({ enum: PagesType, nullable: true, description: 'Тип страницы' })
    pagesType: PagesType;
}
export class PagesOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [PagesDto], nullable: true, description: 'Ответ' })
    entity: PagesDto[];
}
  
export class PagesListDto extends ResultDto {
    @ApiProperty({ type: () => PagesOptionDto, nullable: true, description: 'Ответ'})
    entity: PagesOptionDto;
}

export class ResultPagesDto extends ResultDto {
    @ApiProperty({ type: () => PagesDto, nullable: true, description: 'Ответ'})
    entity: PagesDto;
}

export class ResultPagesFullDto extends ResultDto {
    @ApiProperty({ type: () => FullPagesDto, nullable: true, description: 'Ответ'})
    entity: FullPagesDto;
}
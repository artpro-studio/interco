import { ApiProperty } from "@nestjs/swagger";
import { BaseQuery, ResultDto, ResultPaginationOptionDto } from "src/dto/reponse.dto";
import { PagesSectionsDto } from "./pages-sections.dto";

export class PagesSectionsQuery extends BaseQuery {
    @ApiProperty({ example: 1, nullable: true, description: 'ID страниц' })
    pages: number;
}

export class PagesSectionsOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [PagesSectionsDto], nullable: true, description: 'Ответ' })
    entity: PagesSectionsDto[];
}

export class PagesSectionsListDto extends ResultDto {
    @ApiProperty({ type: () => PagesSectionsOptionDto, nullable: true, description: 'Ответ'})
    entity: PagesSectionsOptionDto;
}

export class ResultPagesSectionsDto extends ResultDto {
    @ApiProperty({ type: () => PagesSectionsDto, nullable: true, description: 'Ответ'})
    entity?: PagesSectionsDto;
}

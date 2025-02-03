import { ApiProperty } from "@nestjs/swagger";
import { BaseQuery, ResultDto, ResultPaginationOptionDto } from "src/dto/reponse.dto";
import { FullPagesComponentsDto, PagesComponentsDto } from "./create-pages-components.dto";

export class PagesComponentsOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [PagesComponentsDto], nullable: true, description: 'Ответ' })
    entity: PagesComponentsDto[];
}
  
export class PagesComponentsListDto extends ResultDto {
    @ApiProperty({ type: () => PagesComponentsOptionDto, nullable: true, description: 'Ответ'})
    entity?: PagesComponentsOptionDto;
}

export class ResultPagesComponentsDto extends ResultDto {
    @ApiProperty({ type: () => PagesComponentsDto, nullable: true, description: 'Ответ'})
    entity?: PagesComponentsDto;
}

export class ResultPagesComponentsFullDto extends ResultDto {
    @ApiProperty({ type: () => FullPagesComponentsDto, nullable: true, description: 'Ответ'})
    entity: FullPagesComponentsDto;
}
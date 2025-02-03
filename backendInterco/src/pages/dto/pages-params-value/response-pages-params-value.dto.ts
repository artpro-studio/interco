import { ApiProperty } from '@nestjs/swagger';
import { FullPagesParamsValueDto } from './pages-params-value.dto';
import { ResultDto, ResultPaginationOptionDto } from 'src/dto/reponse.dto';

export class PagesParamsValueOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [FullPagesParamsValueDto], nullable: true, description: 'Ответ' })
    entity: FullPagesParamsValueDto[];
}

export class PagesParamsValueListDto extends ResultDto {
    @ApiProperty({ type: () => PagesParamsValueOptionDto, nullable: true, description: 'Ответ'})
    entity: PagesParamsValueOptionDto;
}

export class ResultPagesParamsValueDto extends ResultDto {
    @ApiProperty({ type: () => FullPagesParamsValueDto, nullable: true, description: 'Ответ'})
    entity: FullPagesParamsValueDto;
}

import { ApiProperty } from '@nestjs/swagger';
import { FullPagesParamsFieldDto } from './pages-params-field.dto';
import { ResultDto, ResultPaginationOptionDto } from 'src/dto/reponse.dto';

export class PagesParamsValueOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [FullPagesParamsFieldDto], nullable: true, description: 'Ответ' })
    entity: FullPagesParamsFieldDto[];
}

export class PagesParamsValueListDto extends ResultDto {
    @ApiProperty({ type: () => PagesParamsValueOptionDto, nullable: true, description: 'Ответ'})
    entity: PagesParamsValueOptionDto;
}

export class ResultPagesParamsValueDto extends ResultDto {
    @ApiProperty({ type: () => FullPagesParamsFieldDto, nullable: true, description: 'Ответ'})
    entity: FullPagesParamsFieldDto;
}

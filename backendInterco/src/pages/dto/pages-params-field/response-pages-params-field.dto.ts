import { ApiProperty } from '@nestjs/swagger';
import { PagesParamsFieldDto } from './pages-params-field.dto';
import { ResultDto, ResultPaginationOptionDto } from 'src/dto/reponse.dto';

export class PagesParamsValueOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [PagesParamsFieldDto], nullable: true, description: 'Ответ' })
    entity: PagesParamsFieldDto[];
}

export class PagesParamsValueListDto extends ResultDto {
    @ApiProperty({ type: () => PagesParamsValueOptionDto, nullable: true, description: 'Ответ'})
    entity: PagesParamsValueOptionDto;
}

export class ResultPagesParamsValueDto extends ResultDto {
    @ApiProperty({ type: () => PagesParamsFieldDto, nullable: true, description: 'Ответ'})
    entity: PagesParamsFieldDto;
}

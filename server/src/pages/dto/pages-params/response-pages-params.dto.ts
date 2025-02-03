import { ApiProperty } from '@nestjs/swagger';
import { ResultDto, ResultPaginationOptionDto } from 'src/dto/reponse.dto';
import { FullPagesParamsDto } from './pages-params.dto';

export class PagesParamsOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [FullPagesParamsDto], nullable: true, description: 'Ответ' })
    entity: FullPagesParamsDto[];
}

export class PagesParamsListDto extends ResultDto {
    @ApiProperty({ type: () => PagesParamsOptionDto, nullable: true, description: 'Ответ'})
    entity: PagesParamsOptionDto;
}

export class ResultPagesParamsDto extends ResultDto {
    @ApiProperty({ type: () => FullPagesParamsDto, nullable: true, description: 'Ответ'})
    entity: FullPagesParamsDto;
}

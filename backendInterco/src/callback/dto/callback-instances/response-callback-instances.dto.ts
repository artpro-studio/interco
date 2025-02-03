
import { ApiProperty } from '@nestjs/swagger';
import { BaseQuery, ResultDto, ResultPaginationOptionDto } from 'src/dto/reponse.dto';
import { CallbackInstancesDto, FullCallbackInstancesDto } from './callback-instances.dto';

export class CallbackInstancesOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [FullCallbackInstancesDto], nullable: true, description: 'Ответ' })
    entity: FullCallbackInstancesDto[];
}

export class CallbackInstancesListDto extends ResultDto {
    @ApiProperty({ type: () => CallbackInstancesOptionDto, nullable: true, description: 'Ответ'})
    entity: CallbackInstancesOptionDto;
}

export class ResultCallbackInstancesDto extends ResultDto {
    @ApiProperty({ type: () => FullCallbackInstancesDto, nullable: true, description: 'Ответ'})
    entity: FullCallbackInstancesDto;
}

export class CallbackInstancesQuery extends BaseQuery {
    @ApiProperty({ example: 'slug', description: 'Символьный код справочника' })
    slug: number;
}

export class ResultCallbackInstancesBaseDto extends ResultDto {
    @ApiProperty({ type: () => CallbackInstancesDto, nullable: true, description: 'Ответ'})
    entity: CallbackInstancesDto;
}

export class CallbackInstancesOptionBaseDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [FullCallbackInstancesDto], nullable: true, description: 'Ответ' })
    entity: CallbackInstancesDto[];
}

export class CallbackInstancesListBaseDto extends ResultDto {
    @ApiProperty({ type: () => CallbackInstancesOptionBaseDto, nullable: true, description: 'Ответ'})
    entity: CallbackInstancesOptionBaseDto;
}

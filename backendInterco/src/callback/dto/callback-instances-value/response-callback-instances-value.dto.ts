
import { ApiProperty } from '@nestjs/swagger';
import { ResultDto, ResultPaginationOptionDto } from 'src/dto/reponse.dto';
import { FullCallbackInstancesValueDto } from './callback-instances-value.dto';

export class CallbackInstancesValueOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [FullCallbackInstancesValueDto], nullable: true, description: 'Ответ' })
    entity: FullCallbackInstancesValueDto[];
}

export class CallbackInstancesValueListDto extends ResultDto {
    @ApiProperty({ type: () => CallbackInstancesValueOptionDto, nullable: true, description: 'Ответ'})
    entity: CallbackInstancesValueOptionDto;
}

export class ResultCallbackInstancesValueDto extends ResultDto {
    @ApiProperty({ type: () => FullCallbackInstancesValueDto, nullable: true, description: 'Ответ'})
    entity: FullCallbackInstancesValueDto;
}

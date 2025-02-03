import { ResultDto, ResultPaginationOptionDto } from 'src/dto/reponse.dto';
import { ApiProperty } from '@nestjs/swagger';
import { CallbackDto } from './callback.dto';

export class CallbackOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [CallbackDto], nullable: true, description: 'Ответ' })
    entity: CallbackDto[];
}

export class CallbackListDto extends ResultDto {
    @ApiProperty({ type: () => CallbackOptionDto, nullable: true, description: 'Ответ'})
    entity: CallbackOptionDto;
}

export class ResultCallbackDto extends ResultDto {
    @ApiProperty({ type: () => CallbackDto, nullable: true, description: 'Ответ'})
    entity: CallbackDto;
}

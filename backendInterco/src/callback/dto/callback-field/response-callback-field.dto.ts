
import { ApiProperty } from '@nestjs/swagger';
import { ResultDto, ResultPaginationOptionDto } from 'src/dto/reponse.dto';
import { CallbackFieldDto } from './callback-field.dto';

export class CallbackFieldOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [CallbackFieldDto], nullable: true, description: 'Ответ' })
    entity: CallbackFieldDto[];
}

export class CallbackFieldListDto extends ResultDto {
    @ApiProperty({ type: () => CallbackFieldOptionDto, nullable: true, description: 'Ответ'})
    entity: CallbackFieldOptionDto;
}

export class ResultCallbackFieldDto extends ResultDto {
    @ApiProperty({ type: () => CallbackFieldDto, nullable: true, description: 'Ответ'})
    entity: CallbackFieldDto;
}

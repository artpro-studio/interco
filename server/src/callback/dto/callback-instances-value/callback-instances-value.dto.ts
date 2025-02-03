import { DefaultBaseDto } from 'src/dto/base.dto';
import { ApiProperty } from '@nestjs/swagger';
import { CallbackInstancesDto } from '../callback-instances/callback-instances.dto';
import { CallbackFieldDto } from '../callback-field/callback-field.dto';

export class CallbackInstancesValueDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Значение', nullable: false, description: 'Значение' })
    value: string;
}

export class FullCallbackInstancesValueDto extends CallbackInstancesValueDto {
    @ApiProperty({type: () => CallbackInstancesDto, description: 'Запись' })
    instance?: CallbackInstancesDto;

    @ApiProperty({ type: () => CallbackFieldDto, description: 'Поле' })
    field?: CallbackFieldDto;
}

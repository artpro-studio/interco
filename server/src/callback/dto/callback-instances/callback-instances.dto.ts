import { DefaultBaseDto } from 'src/dto/base.dto';
import { ApiProperty } from '@nestjs/swagger';
import { CallbackDto } from '../callback/callback.dto';
import { FullCallbackInstancesValueDto } from '../callback-instances-value/callback-instances-value.dto';

export class CallbackInstancesDto extends DefaultBaseDto {}

export class FullCallbackInstancesDto extends CallbackInstancesDto {
    @ApiProperty({ type: () => CallbackDto, description: 'Справочник' })
    callback: CallbackDto;

    @ApiProperty({ type: () => [FullCallbackInstancesValueDto], description: 'Значения' })
    instancesValue: FullCallbackInstancesValueDto[];
}

export class CreateCallbackInstancesDto extends DefaultBaseDto {}

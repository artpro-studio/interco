import { DefaultBaseDto } from 'src/dto/base.dto';
import { ApiProperty } from '@nestjs/swagger';
import { ICallbackFieldType, ICallbackFiledAttribute } from 'src/callback/interface';
import { CallbackDto } from '../callback/callback.dto';
import { CallbackInstancesValueDto } from '../callback-instances-value/callback-instances-value.dto';

export class CallbackFieldDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Название', nullable: false, description: 'Название поля' })
    name: string;

    @ApiProperty({ example: ICallbackFieldType.TEXT, enum: ICallbackFieldType, enumName:'ICallbackFieldType', nullable: false, description: 'Тип' })
    type: ICallbackFieldType;

    @ApiProperty({ example: ICallbackFiledAttribute.TITLE, enum: ICallbackFiledAttribute, enumName:'ICallbackFiledAttribute', nullable: false, description: 'Атрибут поля' })
    attribute: ICallbackFiledAttribute;

    @ApiProperty({ example: false, nullable: false, description: 'Обязательное поле ?' })
    isRequred: boolean;
}

export class FullCallbakcFieldDto extends CallbackFieldDto {
    @ApiProperty({ type: () => CallbackDto, description: 'Запись заявки' })
    callback?: CallbackDto;

    @ApiProperty({ type: () => [CallbackInstancesValueDto], description: 'Значения' })
    instancesValue?: CallbackInstancesValueDto[];
}


export class CreateCallbackFieldDto extends CallbackFieldDto {
    @ApiProperty({ example: 1, nullable: false, description: 'ID формы' })
    callbackId: number;
}

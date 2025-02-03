import { ApiProperty } from '@nestjs/swagger';
import { ICallbackFiledAttribute } from 'src/callback/interface';
import { DefaultBaseDto } from 'src/dto/base.dto';

export class AmoCustmoFieldsDto extends DefaultBaseDto {
    @ApiProperty({ example: 123, nullable: false, description: 'ID кастомного поля' })
    amoID: number;

    @ApiProperty({ example: ICallbackFiledAttribute.TITLE, enum: ICallbackFiledAttribute, enumName:'ICallbackFiledAttribute', nullable: false, description: 'Атрибут поля' })
    attribute: ICallbackFiledAttribute;
}

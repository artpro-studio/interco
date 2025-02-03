import { ApiProperty } from '@nestjs/swagger';
import { ICallbackFiledAttribute } from 'src/callback/interface';
import { DefaultBaseEntity } from 'src/entity/base.entity';
import { Column, Entity } from 'typeorm';

@Entity({
    name: 'amo_custom_fields'
})
export class AmoCustmoFieldsEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 123, nullable: false, description: 'ID кастомного поля' })
    @Column({ type: 'int', nullable: true, })
    amoID: number;

    @ApiProperty({ example: ICallbackFiledAttribute.TITLE, enumName:'ICallbackFiledAttribute', nullable: false, description: 'Атрибут поля' })
    @Column({ enum: ICallbackFiledAttribute, default: ICallbackFiledAttribute.TITLE, nullable: false})
    attribute: ICallbackFiledAttribute;
}

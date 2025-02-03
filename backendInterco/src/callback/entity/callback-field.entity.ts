import { DefaultBaseEntity } from 'src/entity/base.entity';
import { ApiProperty } from '@nestjs/swagger';
import { Column, Entity, ManyToOne, OneToMany } from 'typeorm';
import { ICallbackFieldType, ICallbackFiledAttribute } from '../interface';
import { CallbackEntity } from './callback.entity';
import { CallbackInstancesValueEntity } from './callback-instances-value.entity';

@Entity({
    name: 'callback_field'
})
export class CallbackFieldEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Название', nullable: false, description: 'Название поля' })
    @Column({ nullable: false, length: 1024 })
    name: string;

    @ApiProperty({ example: ICallbackFieldType.TEXT, enumName:'ICallbackFieldType', nullable: false, description: 'Тип' })
    @Column({ enum: ICallbackFieldType, default: ICallbackFieldType.STRING, nullable: false})
    type: ICallbackFieldType;

    @ApiProperty({ example: ICallbackFiledAttribute.TITLE, enumName:'ICallbackFiledAttribute', nullable: false, description: 'Атрибут поля' })
    @Column({ enum: ICallbackFiledAttribute, default: ICallbackFiledAttribute.TITLE, nullable: false})
    attribute: ICallbackFiledAttribute;

    @ApiProperty({ example: false, nullable: false, description: 'Обязательное поле ?' })
    @Column({ type: 'bool', default: false, nullable: false })
    isRequred: boolean;

    @ApiProperty({ description: 'Запись заявки' })
    @ManyToOne(() => CallbackEntity, (entity) => entity.field)
    callback: CallbackEntity;

    @ApiProperty({ description: 'Значения' })
    @OneToMany(() => CallbackInstancesValueEntity, (value) => value.field)
    instancesValue: CallbackInstancesValueEntity[];
}

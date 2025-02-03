import { DefaultBaseEntity } from 'src/entity/base.entity';
import { ApiProperty } from '@nestjs/swagger';
import { Column, ManyToOne, Entity } from 'typeorm';
import { CallbackInstancesEntity } from './callback-instances.entity';
import { CallbackFieldEntity } from './callback-field.entity';

@Entity({
    name: 'callback_instances_value'
})
export class CallbackInstancesValueEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Значение', nullable: false, description: 'Значение' })
    @Column({ nullable: true, default: '',})
    value: string;

    @ApiProperty({ description: 'Запись' })
    @ManyToOne(() => CallbackInstancesEntity, (filed) => filed.instancesValue)
    instance: CallbackInstancesEntity;

    @ApiProperty({ description: 'Поле' })
    @ManyToOne(() => CallbackFieldEntity, (filed) => filed.instancesValue)
    field: CallbackFieldEntity;
}

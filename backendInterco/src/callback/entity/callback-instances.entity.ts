import { DefaultBaseEntity } from 'src/entity/base.entity';
import { Entity, ManyToOne, OneToMany } from 'typeorm';
import { ApiProperty } from '@nestjs/swagger';
import { CallbackEntity } from './callback.entity';
import { CallbackInstancesValueEntity } from './callback-instances-value.entity';

@Entity({
    name: 'callback_instances'
})
export class CallbackInstancesEntity extends DefaultBaseEntity {
    @ApiProperty({ description: 'Справочник' })
    @ManyToOne(() => CallbackEntity, (callback) => callback.instances)
    callback: CallbackEntity;

    @ApiProperty({ description: 'Значения' })
    @OneToMany(() => CallbackInstancesValueEntity, (value) => value.instance)
    instancesValue: CallbackInstancesValueEntity[];
}

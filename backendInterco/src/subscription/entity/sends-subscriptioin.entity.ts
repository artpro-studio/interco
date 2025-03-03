import { ApiProperty } from '@nestjs/swagger';
import { DefaultBaseEntity } from 'src/entity/base.entity';
import { Entity, ManyToOne, OneToMany } from 'typeorm';
import { SendsSubscriptionTitleEntity } from './sends-subscriptioin-title.entity';
import { SendsSubscriptionDescriptoinEntity } from './sends-subscriptioin-decription.entity';
import { TaskEntity } from 'src/task/entity/task.entity';

@Entity({
    name: 'send_subscription',
})
export class SendsSubscriptionEntity extends DefaultBaseEntity {
    @ApiProperty({ description: 'Запись' })
    @OneToMany(
        () => SendsSubscriptionTitleEntity,
        (title) => title.sendsSubcription
    )
    title: SendsSubscriptionTitleEntity[];

    @ApiProperty({ description: 'Запись' })
    @OneToMany(
        () => SendsSubscriptionDescriptoinEntity,
        (title) => title.sendsSubcription
    )
    description: SendsSubscriptionTitleEntity[];

    @ApiProperty({ description: 'Задача' })
    @ManyToOne(() => TaskEntity, (task) => task.sendsSubscription)
    task: TaskEntity;
}

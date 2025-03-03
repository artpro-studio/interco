import { ApiProperty } from '@nestjs/swagger';
import { Column, Entity, ManyToOne } from 'typeorm';
import { ILangSubscription } from '../interface';
import { SendsSubscriptionEntity } from './sends-subscriptioin.entity';
import { DefaultBaseEntity } from 'src/entity/base.entity';

@Entity({
    name: 'send_subscription_title',
})
export class SendsSubscriptionTitleEntity extends DefaultBaseEntity {
    @ApiProperty({
        example: 'Значение',
        nullable: false,
        description: 'Значение',
    })
    @Column({ nullable: false })
    value: string;

    @ApiProperty({
        example: ILangSubscription.RU,
        enum: ILangSubscription,
        enumName: 'ILangPages',
        nullable: true,
        description: 'Язык',
    })
    @Column({ type: 'enum', enum: ILangSubscription, nullable: false })
    lang: ILangSubscription;

    @ApiProperty({ description: 'Рассылка' })
    @ManyToOne(
        () => SendsSubscriptionEntity,
        (sendsSubcription) => sendsSubcription.title
    )
    sendsSubcription: SendsSubscriptionEntity;
}

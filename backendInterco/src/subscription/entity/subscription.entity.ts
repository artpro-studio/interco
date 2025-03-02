import { ApiProperty } from '@nestjs/swagger';
import { DefaultBaseEntity } from 'src/entity/base.entity';
import { Column, Entity } from 'typeorm';
import { ILangSubscription } from '../interface';

@Entity({
    name: 'subscription',
})
export class SubscriptionEntity extends DefaultBaseEntity {
    @ApiProperty({
        example: 'ФИО',
        nullable: false,
        description: 'ФИО',
    })
    @Column({ nullable: false, length: 1024 })
    name: string;

    @ApiProperty({
        example: 'test@test.com',
        nullable: false,
        description: 'Email',
    })
    @Column({ nullable: false, length: 1024 })
    email: string;

    @ApiProperty({
        example: ILangSubscription.RU,
        enum: ILangSubscription,
        enumName: 'ILangSubscription',
        nullable: true,
        description: 'Язык',
    })
    @Column({
        type: 'enum',
        enum: ILangSubscription,
        nullable: false,
        default: ILangSubscription.RU,
    })
    lang: ILangSubscription;
}

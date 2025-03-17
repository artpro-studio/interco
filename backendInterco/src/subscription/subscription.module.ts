import { forwardRef, Module } from '@nestjs/common';
import { SubscriptionRepository } from './repository/subscription.repository';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SubscriptionEntity } from './entity/subscription.entity';
import { SubscriptionService } from './service/subscription.service';
import { SubscriptionController } from './controller/subscription.controller';
import { PublicSubscriptionController } from './controller/public-subscription.controller';
import { SendsSubscriptionEntity } from './entity/sends-subscriptioin.entity';
import { SendsSubscriptionTitleEntity } from './entity/sends-subscriptioin-title.entity';
import { SendsSubscriptionDescriptoinEntity } from './entity/sends-subscriptioin-decription.entity';
import { SendsSubscriptionRepository } from './repository/sends-subscription.repository';
import { SendsSubscriptionTitleRepository } from './repository/sends-subscription-title.repository';
import { SendsSubscriptionDescriptionRepository } from './repository/sends-subscription-description.repository';
import { SendsSubscriptionService } from './service/sends-subscription.service';
import { SendsSubscriptionController } from './controller/sends-subscription.controller';
import { TaskModule } from 'src/task/task.module';
import { CallbackModule } from 'src/callback/callback.module';

const repository = [
    SubscriptionRepository,
    SendsSubscriptionRepository,
    SendsSubscriptionTitleRepository,
    SendsSubscriptionDescriptionRepository,
];
const service = [SubscriptionService, SendsSubscriptionService];

@Module({
    imports: [
        TypeOrmModule.forFeature([
            SubscriptionEntity,
            SendsSubscriptionEntity,
            SendsSubscriptionTitleEntity,
            SendsSubscriptionDescriptoinEntity,
        ]),
        forwardRef(() => TaskModule),
        forwardRef(() => CallbackModule),
    ],
    controllers: [
        SubscriptionController,
        PublicSubscriptionController,
        SendsSubscriptionController,
    ],
    providers: [...repository, ...service],
    exports: [...repository, ...service],
})
export class SubscriptionModule {}

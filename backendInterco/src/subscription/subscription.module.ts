import { Module } from '@nestjs/common';
import { SubscriptionRepository } from './repository/subscription.repository';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SubscriptionEntity } from './entity/subscription.entity';
import { SubscriptionService } from './service/subscription.service';
import { SubscriptionController } from './controller/subscription.controller';
import { PublicSubscriptionController } from './controller/public-subscription.controller';

const repository = [SubscriptionRepository];
const service = [SubscriptionService];

@Module({
    imports: [TypeOrmModule.forFeature([SubscriptionEntity])],
    controllers: [SubscriptionController, PublicSubscriptionController],
    providers: [...repository, ...service],
    exports: [],
})
export class SubscriptionModule {}

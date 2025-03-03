import { Injectable } from '@nestjs/common';
import { SubscriptionRepository } from '../repository/subscription.repository';
import { SubscriptionDto } from '../dto/subscription.dto';
import { ResultSubscriptionDto } from '../dto/response-subscription.dto';
import { TaskDto } from 'src/task/dto/task.dto';

@Injectable()
export class SubscriptionService {
    constructor(
        private readonly subscriptionRepository: SubscriptionRepository
    ) {}

    async create(body: SubscriptionDto): Promise<ResultSubscriptionDto> {
        const subscription = await this.subscriptionRepository.getForEmail(
            body.email
        );
        if (subscription) {
            return {
                isSuccess: false,
                message: 'Вы уже подписаны',
                entity: null,
            };
        }

        const entity = await this.subscriptionRepository.create(body);

        return { isSuccess: true, entity };
    }
}

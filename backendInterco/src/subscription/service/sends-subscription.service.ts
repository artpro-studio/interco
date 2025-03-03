import { Injectable } from '@nestjs/common';
import { SendsSubscriptionRepository } from '../repository/sends-subscription.repository';
import { SendsSubscriptionTitleRepository } from '../repository/sends-subscription-title.repository';
import { SendsSubscriptionDescriptionRepository } from '../repository/sends-subscription-description.repository';
import { SendsSubscriptionDto } from '../dto/sends-subscription/sends-subscription.dto';
import { ResultSendsSubscriptionDto } from '../dto/sends-subscription/respone-sends-subscription.dto';
import {
    publicFormatterListSendsSubscription,
    publicFormatterSendsSubscription,
} from '../helpers/getParser';
import { TaskProducerService } from 'src/task/producer/task.producer.service';
import { TaskDto } from 'src/task/dto/task.dto';

@Injectable()
export class SendsSubscriptionService {
    constructor(
        private readonly sendsSubscriptionRepository: SendsSubscriptionRepository,
        private readonly sendsSubscriptionTitleRepository: SendsSubscriptionTitleRepository,
        private readonly sendsSubscriptionDescriptionRepository: SendsSubscriptionDescriptionRepository,
        private readonly taskProducerService: TaskProducerService
    ) {}

    async create(
        body: SendsSubscriptionDto
    ): Promise<ResultSendsSubscriptionDto> {
        const sendsSubcription = await this.sendsSubscriptionRepository.create(
            body
        );

        // Создание заголовка
        const titles = [];
        for (let item of body.title) {
            const title = await this.sendsSubscriptionTitleRepository.create({
                ...item,
                sendsSubcription,
            });
            titles.push(title);
        }

        // Описание
        const descriptions = [];
        for (let item of body.description) {
            const description =
                await this.sendsSubscriptionDescriptionRepository.create({
                    ...item,
                    sendsSubcription,
                });
            descriptions.push(description);
        }
        const entity = {
            ...sendsSubcription,
            title: titles,
            description: descriptions,
        };

        // Оптарвляем сообщения
        this.taskProducerService.sendMessage(
            publicFormatterSendsSubscription(entity)
        );

        return {
            isSuccess: true,
            entity,
        };
    }

    async updateForTask(id: number, task: TaskDto) {
        const entity = await this.sendsSubscriptionRepository.getOne(id);
        await this.sendsSubscriptionRepository.udapte({
            ...entity,
            task,
        });
    }
}

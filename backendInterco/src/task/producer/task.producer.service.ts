import { InjectQueue } from '@nestjs/bull';
import { Injectable } from '@nestjs/common';
import { Queue } from 'bull';
import { SubscriptionRepository } from 'src/subscription/repository/subscription.repository';

@Injectable()
export class TaskProducerService {
    constructor(
        @InjectQueue('task-queue') private taskQueue: Queue,
        private readonly subscriptionRepository: SubscriptionRepository
    ) {}

    async sendMessage(body: any) {
        try {
            this.taskQueue.add('sendMessage', body, { delay: 1000 });
        } catch (e) {
            console.log('error', e);
        }
    }

    async generateTask(body: any) {
        try {
            await this.taskQueue.add('addTask', body, { delay: 1000 });
        } catch (e) {
            console.log('error', e);
        }
    }

    async updateTask(body: any) {
        try {
            await this.taskQueue.add('updateTask', body, { delay: 1000 });
        } catch (e) {
            console.log('error', e);
        }
    }

    async deteteTask(body: any) {
        try {
            await this.taskQueue.add('deteteTask', body, { delay: 1000 });
        } catch (e) {
            console.log('error', e);
        }
    }
}

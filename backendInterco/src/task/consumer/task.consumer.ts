import {
    OnQueueActive,
    OnQueueCompleted,
    OnQueueFailed,
    OnQueueProgress,
    Process,
    Processor,
} from '@nestjs/bull';
import { InjectRepository } from '@nestjs/typeorm';
import { Job } from 'bull';
import { TaskEntity } from '../entity/task.entity';
import { IsNull, Repository } from 'typeorm';
import { TaskStatus, TaskType } from '../interface';
import { TaskRepoitory } from '../repository/task.repository';
import { TaskDto } from '../dto/task.dto';
import { NodeMailerService } from 'src/node-mailer/node-mailer.service';
import { SubscriptionRepository } from 'src/subscription/repository/subscription.repository';
import { SubscriptionService } from 'src/subscription/service/subscription.service';
import { SendsSubscriptionService } from 'src/subscription/service/sends-subscription.service';

@Processor('task-queue')
export class TaskConsumer {
    constructor(
        private readonly taskRepository: TaskRepoitory,
        private readonly nodeMailerService: NodeMailerService,
        private readonly subscriptionRepository: SubscriptionRepository,
        private readonly sendsSubscriptionService: SendsSubscriptionService
    ) {}

    @Process('sendMessage')
    async sendMessage(job: Job<any>) {
        try {
            const body: any = job.data;

            // Создание задачи
            const entity = await this.taskRepository.create({
                idTask: job.id.toString(),
                name: 'Отправка рассылки',
                status: TaskStatus.ACTIVE,
                type: TaskType.SendMessage,
                progress: 0,
            });
            this.sendsSubscriptionService.updateForTask(body.id, entity);

            const limit = 10;
            const result = await this.subscriptionRepository.get({
                search: '',
                page: 1,
                limit,
            });
            const count = Math.ceil(result.count / limit);
            const proccessItem = 100 / count;
            for (let page = 1; page <= count; page++) {
                const progress = page * proccessItem;
                const emails = await this.subscriptionRepository.get({
                    search: '',
                    page,
                    limit,
                });
                for (let i = 0; i < emails.entity.length; i++) {
                    this.nodeMailerService.sendSubscribe({
                        title: body.title[emails.entity[i].lang],
                        description: body.description[emails.entity[i].lang],
                        email: emails.entity[i].email,
                        name: emails.entity[i].name,
                    });
                    await new Promise((resolve) => setTimeout(resolve, 2000));
                }
                await job.progress(progress);
            }
        } catch (e) {
            console.log(e);
        }
    }

    @Process('addTask')
    async addTask(job: Job<TaskDto>) {
        const body: TaskDto = job.data;

        const entity = this.taskRepository.create({
            idTask: job.id.toString(),
            name: 'Отправка рассылки',
            status: TaskStatus.ACTIVE,
            type: TaskType.SendMessage,
            progress: 0,
        });
    }

    @Process('updateTask')
    async updateTask(job: Job<TaskDto>) {}

    @Process('deteteTask')
    async deteteTask(job: Job<TaskDto>) {}

    @OnQueueProgress()
    async onProgress(job: Job<any>, progress: number) {
        console.log('tset', job.id, progress);
        const entity = await this.taskRepository.getOneForTask(Number(job.id));

        if (entity) {
            entity.progress = progress;
            await this.taskRepository.udapte(entity);
        }
    }
}

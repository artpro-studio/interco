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

@Processor('task-queue')
export class TaskConsumer {
    constructor(private readonly taskRepository: TaskRepoitory) {}

    @Process('addTask')
    async addTask(job: Job<TaskDto>) {
        const body: TaskDto = job.data;

        const entity = this.taskRepository.create({
            idTask: job.id.toString(),
            name: 'Отправка рассылки',
            status: TaskStatus.ACTIVE,
            type: TaskType.GenerateGraph,
            progress: 0,
        });
    }

    @Process('updateTask')
    async updateTask(job: Job<TaskDto>) {}

    @Process('deteteTask')
    async deteteTask(job: Job<TaskDto>) {}

    @OnQueueProgress()
    async onProgress(job: Job<any>, progress: number) {
        const entity = await this.taskRepository.getOne(Number(job.id));

        if (entity) {
            entity.progress = progress;
            await this.taskRepository.udapte(entity);
        }
    }
}

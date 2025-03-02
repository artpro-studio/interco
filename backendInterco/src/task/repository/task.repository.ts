import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TaskEntity } from '../entity/task.entity';
import { Repository } from 'typeorm';
import { TaskDto } from '../dto/task.dto';

@Injectable()
export class TaskRepoitory {
    constructor(
        @InjectRepository(TaskEntity)
        private readonly taskRepository: Repository<TaskEntity>
    ) {}

    async getList(): Promise<TaskDto[]> {
        const query = this.taskRepository.createQueryBuilder('task');

        return await query.getMany();
    }

    async getOne(id: number): Promise<TaskDto> {
        const query = this.taskRepository
            .createQueryBuilder('task')
            .andWhere('taks.id = :id', { id });

        return await query.getOne();
    }

    async create(body: TaskDto): Promise<TaskDto> {
        const entity = this.taskRepository.create(body);
        await this.taskRepository.save(entity);

        return entity;
    }

    async udapte(body: TaskDto): Promise<TaskDto> {
        return await this.taskRepository.save(body);
    }
}

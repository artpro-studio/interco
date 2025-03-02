import { Module } from '@nestjs/common';
import { BullModule } from '@nestjs/bull';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TaskEntity } from './entity/task.entity';
import { TaskConsumer } from './consumer/task.consumer';
import { TaskProducerService } from './producer/task.producer.service';
import { TaskRepoitory } from './repository/task.repository';

const repository = [TaskRepoitory];

@Module({
    imports: [
        TypeOrmModule.forFeature([TaskEntity]),
        BullModule.forRoot({
            redis: {
                host: 'redis',
                port: 6379,
            },
        }),
        BullModule.registerQueue({
            name: 'task-queue',
            redis: {
                host: 'redis',
                port: 6379,
            },
        }),
    ],
    controllers: [],
    providers: [TaskConsumer, TaskProducerService, ...repository],
    exports: [TaskConsumer, TaskProducerService],
})
export class TaskModule {}

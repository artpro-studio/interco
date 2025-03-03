import { forwardRef, Module } from '@nestjs/common';
import { BullModule } from '@nestjs/bull';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TaskEntity } from './entity/task.entity';
import { TaskConsumer } from './consumer/task.consumer';
import { TaskProducerService } from './producer/task.producer.service';
import { TaskRepoitory } from './repository/task.repository';
import { NodeMailerModule } from 'src/node-mailer/node-mailer.module';
import { SubscriptionModule } from 'src/subscription/subscription.module';

const repository = [TaskRepoitory];

@Module({
    imports: [
        TypeOrmModule.forFeature([TaskEntity]),
        forwardRef(() => NodeMailerModule),
        forwardRef(() => SubscriptionModule),
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
            limiter: {
                max: 10, // Не больше 10 писем
                duration: 60000, // В течение 1 минуты
            },
        }),
    ],
    controllers: [],
    providers: [TaskConsumer, TaskProducerService, ...repository],
    exports: [TaskConsumer, TaskProducerService, ...repository],
})
export class TaskModule {}

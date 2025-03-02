import { TaskStatus, TaskType } from '../interface';
import { ApiProperty } from '@nestjs/swagger';
import { Column, Entity, ManyToOne, OneToMany } from 'typeorm';
import { DefaultBaseEntity } from 'src/entity/base.entity';

@Entity({
    name: 'task',
})
export class TaskEntity extends DefaultBaseEntity {
    @ApiProperty({ example: '1', description: 'ID задачи' })
    @Column({ length: 2048, nullable: false })
    idTask: string;

    @ApiProperty({ example: 'Название задачи', description: 'Название задачи' })
    @Column({ length: 2048, nullable: true })
    name: string;

    @ApiProperty({ example: 0, description: 'Прогресс' })
    @Column({ type: 'int', default: 0, nullable: false })
    progress: number;

    @ApiProperty({
        enum: TaskStatus,
        example: TaskStatus.ACTIVE,
        description: 'Статус задачи',
    })
    @Column({
        type: 'enum',
        enum: TaskStatus,
        default: TaskStatus.ACTIVE,
    })
    status: TaskStatus;

    @ApiProperty({
        enum: TaskType,
        example: TaskType.GenerateGraph,
        description: 'Тип задачи',
    })
    @Column({
        type: 'enum',
        enum: TaskType,
        default: TaskType.GenerateGraph,
    })
    type: TaskType;
}

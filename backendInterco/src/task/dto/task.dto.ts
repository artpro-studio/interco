import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty } from 'class-validator';
import { TaskStatus, TaskType } from '../interface';
import { DefaultBaseDto } from 'src/dto/base.dto';

export class TaskDto extends DefaultBaseDto {
    @ApiProperty({ example: '1', description: 'ID задачи' })
    @IsNotEmpty({ message: 'Обьязательное поле' })
    idTask: string;

    @ApiProperty({ example: 'Название задачи', description: 'Название задачи' })
    name?: string;

    @ApiProperty({ example: 0, description: 'Прогресс' })
    progress: number;

    @ApiProperty({
        enum: TaskStatus,
        example: TaskStatus.ACTIVE,
        description: 'Статус задачи',
    })
    @IsNotEmpty({ message: 'Обьязательное поле' })
    status: TaskStatus;

    @ApiProperty({
        enum: TaskType,
        example: TaskType.GenerateGraph,
        description: 'Тип задачи',
    })
    type: TaskType;
}

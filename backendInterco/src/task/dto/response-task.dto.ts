import { ApiProperty } from '@nestjs/swagger';
import { ResultDto } from 'src/dto/reponse.dto';
import { TaskDto } from './task.dto';

export class ResultTaskListDto extends ResultDto {
    @ApiProperty({
        type: () => [TaskDto],
        nullable: true,
        description: 'Список задач',
    })
    entity?: TaskDto[];
}

export class ResultTaskDto extends ResultDto {
    @ApiProperty({
        type: () => TaskDto,
        nullable: true,
        description: 'Список задач',
    })
    entity?: TaskDto;
}

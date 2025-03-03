import { ApiProperty } from '@nestjs/swagger';
import { DefaultBaseDto } from 'src/dto/base.dto';
import { SendsSubscriptionTitleDto } from './sends-subscription-title.dto';
import { SendsSubscriptionDescriptionDto } from './sends-subscription-description.dto';
import { TaskDto } from 'src/task/dto/task.dto';

export class SendsSubscriptionDto extends DefaultBaseDto {
    @ApiProperty({
        type: () => [SendsSubscriptionTitleDto],
        required: false,
        nullable: true,
        description: 'Запись',
    })
    title?: SendsSubscriptionTitleDto[];

    @ApiProperty({
        type: () => [SendsSubscriptionDescriptionDto],
        required: false,
        nullable: true,
        description: 'Запись',
    })
    description?: SendsSubscriptionDescriptionDto[];

    @ApiProperty({
        type: () => TaskDto,
        required: false,
        nullable: true,
        description: 'Задача',
    })
    task?: TaskDto;
}

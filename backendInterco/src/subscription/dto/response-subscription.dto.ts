import { ApiProperty } from '@nestjs/swagger';
import { ResultDto, ResultPaginationOptionDto } from 'src/dto/reponse.dto';
import { SubscriptionDto } from './subscription.dto';

export class SubscriptionListOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({
        type: () => [SubscriptionDto],
        nullable: true,
        description: 'Ответ',
    })
    entity: SubscriptionDto[];
}

export class SubscriptionListDto extends ResultDto {
    @ApiProperty({
        type: () => SubscriptionListOptionDto,
        nullable: true,
        description: 'Ответ',
    })
    entity: SubscriptionListOptionDto;
}

export class ResultSubscriptionDto extends ResultDto {
    @ApiProperty({
        type: () => SubscriptionDto,
        nullable: true,
        description: 'Ответ',
    })
    entity: SubscriptionDto;
}

import { ApiProperty } from '@nestjs/swagger';
import { ResultDto, ResultPaginationOptionDto } from 'src/dto/reponse.dto';
import { SendsSubscriptionDto } from './sends-subscription.dto';

export class SendsSubscriptionListOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({
        type: () => [SendsSubscriptionDto],
        nullable: true,
        description: 'Ответ',
    })
    entity: SendsSubscriptionDto[];
}

export class SendsSubscriptionListDto extends ResultDto {
    @ApiProperty({
        type: () => SendsSubscriptionListOptionDto,
        nullable: true,
        description: 'Ответ',
    })
    entity: SendsSubscriptionListOptionDto;
}

export class ResultSendsSubscriptionDto extends ResultDto {
    @ApiProperty({
        type: () => SendsSubscriptionDto,
        nullable: true,
        description: 'Ответ',
    })
    entity: SendsSubscriptionDto;
}

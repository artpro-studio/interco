import { ApiProperty } from '@nestjs/swagger';
import { DefaultBaseDto } from 'src/dto/base.dto';
import { ILangSubscription } from 'src/subscription/interface';
import { SendsSubscriptionDto } from './sends-subscription.dto';

export class SendsSubscriptionDescriptionDto extends DefaultBaseDto {
    @ApiProperty({
        example: 'Значение',
        nullable: false,
        description: 'Значение',
    })
    value: string;

    @ApiProperty({
        example: ILangSubscription.RU,
        enum: ILangSubscription,
        enumName: 'ILangSubscription',
        nullable: true,
        description: 'Язык',
    })
    lang: ILangSubscription;

    @ApiProperty({
        type: () => SendsSubscriptionDto,
        required: false,
        nullable: true,
        description: 'Запись',
    })
    sendsSubcription?: SendsSubscriptionDto;
}

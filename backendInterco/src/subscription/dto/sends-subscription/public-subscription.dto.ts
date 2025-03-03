import { ApiProperty } from '@nestjs/swagger';
import { DefaultBaseDto } from 'src/dto/base.dto';

export class PublicSendsSubscriptionDto extends DefaultBaseDto {
    @ApiProperty({
        type: () => 'object',
        required: false,
        nullable: true,
        description: 'Запись',
    })
    title?: Record<string, any>;

    @ApiProperty({
        type: () => 'object',
        required: false,
        nullable: true,
        description: 'Запись',
    })
    description?: Record<string, any>;
}

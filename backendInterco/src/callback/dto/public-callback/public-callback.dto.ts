import { ApiProperty } from '@nestjs/swagger';

export class PublicCallbackDto {
    @ApiProperty({
        example: 'slug',
        nullable: false,
        description: 'Символьный код формы',
    })
    slug: string;

    @ApiProperty({ example: 'token', nullable: false, description: 'Токен' })
    token: string;

    @ApiProperty({
        type: () => 'object',
        nullable: false,
        description: 'Данные',
    })
    data: Record<string, any>;
}

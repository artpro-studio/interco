import { ApiProperty } from '@nestjs/swagger';
import { DefaultBaseDto } from './../../dto/base.dto';

export class SettingsContactsDto extends DefaultBaseDto {
    @ApiProperty({ example: 'test@mail.ru', nullable: false, description: 'Контент' })
    content: string;

    @ApiProperty({ example: 'Описание', nullable: false, description: 'Описание' })
    description: string;

    @ApiProperty({ example: false, nullable: false, description: 'Телефон?' })
    isPhone: boolean;
}
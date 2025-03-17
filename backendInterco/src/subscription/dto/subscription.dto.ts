import { ApiProperty } from '@nestjs/swagger';
import { DefaultBaseDto } from 'src/dto/base.dto';
import { ILangSubscription } from '../interface';
import { IsEmail, IsEnum, IsNotEmpty } from 'class-validator';

export class SubscriptionDto extends DefaultBaseDto {
    @ApiProperty({
        example: 'token',
        nullable: false,
        required: false,
        description: 'Токен',
    })
    token?: string;

    @ApiProperty({
        example: 'ФИО',
        nullable: false,
        description: 'ФИО',
    })
    @IsNotEmpty({ message: 'Обьязательное поле' })
    name: string;

    @ApiProperty({
        example: 'test@test.com',
        nullable: false,
        description: 'Email',
    })
    @IsNotEmpty({ message: 'Обьязательное поле' })
    @IsEmail({}, { message: 'Не правильный email' })
    email: string;

    @ApiProperty({
        example: ILangSubscription.RU,
        enum: ILangSubscription,
        enumName: 'ILangSubscription',
        nullable: true,
        description: 'Язык',
    })
    @IsNotEmpty({ message: 'Обьязательное поле' })
    @IsEnum(ILangSubscription, { message: 'Поле не соотвествует' })
    lang: ILangSubscription;
}

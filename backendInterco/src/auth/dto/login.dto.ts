import { UserDto } from './../../user/dto/user.dto';
import { ResultDto } from './../../dto/reponse.dto';
import { ApiProperty } from '@nestjs/swagger';
import { IsEmail, IsString, Length } from 'class-validator';

export class LoginDto {
    @ApiProperty({ type: String, example: 'test@mail.ru', nullable: false, description: 'E-mail' })
    @IsString({message: 'Email должен быть строкой'})
    @IsEmail({}, {message: 'Некорректный email'})
    email: string;

    @ApiProperty({ type: String, example: 'test123123123', nullable: false, description: 'Пароль' })
    @IsString({message: 'Пароль должен быть строкой'})
    @Length(4, 18, {message: 'Пароль не меньше 4 и не больще 18'})
    password: string;
}

export class ResultLoginOption {
    @ApiProperty({ type: String, nullable: false, description: 'Токен' })
    token: string;

    @ApiProperty({ type: UserDto, nullable: false, description: 'Данные польователя' })
    entity: UserDto;
}

export class ResultLogin extends ResultDto {
    @ApiProperty({ type: ResultLoginOption, nullable: false, description: 'Ответ' })
    entity?: ResultLoginOption;
}

export class RegisterDto {
    @ApiProperty({ type: String, example: 'test@mail.ru', nullable: false, description: 'E-mail' })
    email: string;

    @ApiProperty({ type: String, example: 'test123123123', nullable: false, description: 'Пароль' })
    password: string;

    @ApiProperty({ type: String, example: 'asd123sad12qwqwe', nullable: false, description: 'Секретный ключ' })
    secret: string;

    @ApiProperty({ example: 'Андрей', nullable: true, description: 'Имя' })
    firstName?: string;

    @ApiProperty({ example: 'Яковлев', nullable: true, description: 'Фамилия' })
    lastName?: string;

    @ApiProperty({ example: 'Сергеевич', nullable: true, description: 'Отчество' })
    middleName?: string;
}
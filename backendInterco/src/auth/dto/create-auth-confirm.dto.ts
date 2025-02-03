import { UserDto } from './../../user/dto/user.dto';
import { TypeAuthConfirm } from './../constants';
import { ApiProperty } from '@nestjs/swagger';
import { DefaultBaseDto } from 'src/dto/base.dto';

export class AuthConfirmDto extends DefaultBaseDto {
    @ApiProperty({ example: 'UUID', description: 'UUID' })
    uuid: string;

    @ApiProperty({ example: true, description: 'Активный?' })
    isActive: boolean;

    @ApiProperty({ enum: TypeAuthConfirm, enumName: 'TypeAuthConfirm', description: 'Тип подтверждения' })
    type: TypeAuthConfirm;

    @ApiProperty({type: () => UserDto, description: 'Пользователь' })
    user: UserDto;
}

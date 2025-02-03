import { ApiProperty } from '@nestjs/swagger';
import { DefaultBaseDto } from 'src/dto/base.dto';
import { Role } from '../role-interface';

export class UserDto extends DefaultBaseDto {

  @ApiProperty({ type: Boolean, example: true, nullable: true, description: 'Активный пользователь' })
  isActive: boolean;

  @ApiProperty({ example: 'Яковлева', nullable: true, description: 'Фамилия' })
  lastName: string;

  @ApiProperty({ example: 'Алена', nullable: true, description: 'Имя' })
  firstName: string;

  @ApiProperty({
    example: 'Александровна',
    nullable: true,
    description: 'Отчество',
  })
  middleName: string;

  @ApiProperty({
    example: 'test@test.com',
    nullable: true,
    description: 'Email',
  })
  email: string;

  @ApiProperty({type: String, example: 'password', nullable: true, description: 'Password' })
  password: string;

  @ApiProperty({ enum: Role, enumName:'Role', description: 'Роль', nullable: true })
  role: Role;
}

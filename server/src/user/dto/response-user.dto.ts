import { ApiProperty } from '@nestjs/swagger';
import { BaseQuery, ResultDto, ResultPaginationOptionDto } from 'src/dto/reponse.dto';
import { UserDto } from './user.dto';
import { Role } from '../role-interface';

export class UserFilterDto extends BaseQuery {
  @ApiProperty({ enum: Role, enumName:'Role', isArray: true, nullable: false, description: 'Роль' })
  role: Role[];
}

export class UserListOptionDto extends ResultPaginationOptionDto {
  @ApiProperty({ type: () => [UserDto], nullable: true, description: 'Ответ' })
  entity: UserDto[];
}

export class UserListDto extends ResultDto {
  @ApiProperty({
    type: () => UserListOptionDto,
    nullable: true,
    description: 'Ответ',
  })
  entity: UserListOptionDto;
}

export class ResultUserDto extends ResultDto {
  @ApiProperty({
    type: () => UserDto,
    nullable: true,
    description: 'Ответ',
  })
  entity: UserDto;
}

import { Role } from './../../user/role-interface';
import { ApiProperty } from "@nestjs/swagger";

export class GenerateUserTokenDto {
    @ApiProperty({ type: String, example: '1', nullable: false, description: 'ID' })
    id: string;

    @ApiProperty({ type: String, example: 'test@mail.ru', nullable: false, description: 'E-mail' })
    email: string;

    @ApiProperty({ enum: Role, enumName:'Role', example: 'ghost', nullable: true, description: 'Роль' })
    role: Role;
}

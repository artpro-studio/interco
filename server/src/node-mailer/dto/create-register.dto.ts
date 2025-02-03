import { ApiProperty } from '@nestjs/swagger';

export class CreateRegisterDto {
    @ApiProperty({ example: 'Андрей', nullable: true, description: 'Имя' })
    firstName?: string;

    @ApiProperty({ example: 'Яковлев', nullable: true, description: 'Фамилия' })
    lastName?: string;

    @ApiProperty({ example: 'Сергеевич', nullable: true, description: 'Отчество' })
    middleName?: string;

    @ApiProperty({ example: 'test@mail.ru', nullable: false, description: 'E-mail' })
    email: string;
}
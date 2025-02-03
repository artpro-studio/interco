import { AuthConfirmEntity } from './../../auth/entities/auth-confirm.entity';
import { ApiProperty } from '@nestjs/swagger';
import { DefaultBaseEntity } from 'src/entity/base.entity';
import { Column, Entity, OneToMany } from 'typeorm';
import { Role } from '../role-interface';
import { PagesCommentsEntity } from 'src/pages/entity/pages-comments.entity';
import { RecordsEntity } from 'src/pages/entity/records.entity';

@Entity({ name: 'user' })
export class UserEntity extends DefaultBaseEntity {
  @ApiProperty({ example: true, description: 'Активный?' })
  @Column({ type: 'bool', default: false, nullable: false })
  isActive: boolean;

  @ApiProperty({ example: 'Яковлева', nullable: false, description: 'Фамилия' })
  @Column({ nullable: false, length: 1024 })
  lastName: string;

  @ApiProperty({ example: 'Алена', nullable: false, description: 'Имя' })
  @Column({ nullable: false, length: 1024 })
  firstName: string;

  @ApiProperty({
    example: 'Александровна',
    nullable: true,
    description: 'Отчество',
  })
  @Column({ nullable: true, length: 1024 })
  middleName: string;

  @ApiProperty({
    example: 'test@test.com',
    nullable: false,
    description: 'Email',
  })
  @Column({ nullable: false, length: 1024 })
  email: string;

  @ApiProperty({
    example: 'password',
    nullable: false,
    description: 'Password',
  })
  @Column({ nullable: false, length: 2048})
  password: string;

  @ApiProperty({ enum: Role, enumName:'Role', description: 'Роль', nullable: false })
  @Column({ enum: Role, nullable: false })
  role: Role;

  @ApiProperty({ description: 'Ссылка на таблицу с подтерждением(регистрация и смена пароля)' })
  @OneToMany(() => AuthConfirmEntity, (confirm) => confirm.user)
  confirms: AuthConfirmEntity[];

  @ApiProperty({ description: 'Записи в блоке' })
  @OneToMany(() => RecordsEntity, (records) => records.author)
  pagesRecords: RecordsEntity[]

  @ApiProperty({ description: 'Комментарии' })
  @OneToMany(() => PagesCommentsEntity, (pagesComments) => pagesComments.user)
  pagesComments: PagesCommentsEntity[]
}

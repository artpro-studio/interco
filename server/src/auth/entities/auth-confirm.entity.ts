import { UserEntity } from './../../user/entity/user.entity';
import { DefaultBaseEntity } from './../../entity/base.entity';
import { TypeAuthConfirm } from './../constants';
import { ApiProperty } from '@nestjs/swagger';
import { PrimaryGeneratedColumn, Column, ManyToOne, Entity } from 'typeorm';

@Entity({
    name: 'auth-confirm'
})
export class AuthConfirmEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'UUID', description: 'UUID' })
    @PrimaryGeneratedColumn('uuid')
    uuid: string;

    @ApiProperty({ example: true, description: 'Активный?' })
    @Column({ type: 'bool', default: true, nullable: false })
    isActive: boolean;

    @ApiProperty({ example: TypeAuthConfirm.Register, description: 'Тип подтверждения' })
    @Column({ enum: TypeAuthConfirm, nullable: false })
    type: TypeAuthConfirm;

    @ApiProperty({description: 'Пользователь' })
    @ManyToOne(() => UserEntity, (user) => user.confirms)
    user: UserEntity;
}
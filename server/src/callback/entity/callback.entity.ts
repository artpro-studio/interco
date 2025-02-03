import { DefaultBaseEntity } from 'src/entity/base.entity';
import { ApiProperty } from '@nestjs/swagger';
import { Column, Entity, OneToMany } from 'typeorm';
import { CallbackFieldEntity } from './callback-field.entity';
import { CallbackInstancesEntity } from './callback-instances.entity';

@Entity({
    name: 'callback'
})
export class CallbackEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Название', nullable: false, description: 'Название формы' })
    @Column({ nullable: false, length: 1024 })
    name: string;

    @ApiProperty({ example: 'name', nullable: false, description: 'Символьный код' })
    @Column({ nullable: false, length: 1024 })
    slug: string;

    @ApiProperty({ example: false, nullable: false, description: 'Синхронизация с битрикс24' })
    @Column({ type: 'bool', default: false, nullable: false })
    syncBitrix: boolean;

    @ApiProperty({ example: false, nullable: false, description: 'Синхронизация с AmoCRM' })
    @Column({ type: 'bool', default: false, nullable: false })
    syncAmo: boolean;

    @ApiProperty({ example: 'test@mail.ru', nullable: true, description: 'E-mail' })
    @Column({ nullable: true, length: 1024 })
    email: string;

    @ApiProperty({ description: 'Поля' })
    @OneToMany(() => CallbackFieldEntity, (field) => field.callback)
    field: CallbackFieldEntity[];

    @ApiProperty({ description: 'Записи заявок' })
    @OneToMany(() => CallbackInstancesEntity, (field) => field.callback)
    instances: CallbackInstancesEntity[];

}

import {Column, Entity, JoinColumn, ManyToOne, OneToMany} from 'typeorm';
import {ApiProperty} from '@nestjs/swagger';
import {FileType} from '../interface';
import { DefaultBaseEntity } from 'src/entity/base.entity';

@Entity({
    name: 'library_files'
})
export class LibraryFilesEntity extends DefaultBaseEntity {
    @ApiProperty({ example: '/logo.svg', description: 'Путь к файлу' })
    @Column({ nullable: true, comment: 'Путь к файлу' })
    path: string;

    @ApiProperty({ description: 'Тип файл' })
    @Column({enum: FileType, default: FileType.FILE, comment: 'Тип файла' })
    type: FileType;

    @ApiProperty({ example: 'Название файла или директории', description: 'Название файла или директории' })
    @Column({ nullable: true, comment: 'Название файла или директории' })
    name: string;

    @ApiProperty({ example: 'Название в облаке', description: 'Название в облаке' })
    @Column({ nullable: true, comment: 'Название в облаке' })
    filename: string;

    @ApiProperty({ example: 10000, description: 'Размер файла' })
    @Column({ type: 'int', nullable: true, comment: 'Размер файла' })
    size: number;

    @ApiProperty({ example: true, description: 'Системный директория' })
    @Column({ type: 'bool', nullable: false, default: false, comment: 'Системная директория' })
    isSystem: boolean;

    @ApiProperty({ description: 'Привязка файла к директории' })
    @ManyToOne(() => LibraryFilesEntity, (library_files) => library_files.parent)
    @JoinColumn()
    parent: LibraryFilesEntity;
}

import { DefaultBaseDto } from 'src/dto/base.dto';
import { ApiProperty } from '@nestjs/swagger';
import { CallbackFieldDto } from '../callback-field/callback-field.dto';
import { CreateLibraryFilesDto } from 'src/library-files/dto/create-library-files.dto';

export class CallbackDto extends DefaultBaseDto {
    @ApiProperty({
        example: 'Название',
        nullable: false,
        description: 'Название формы',
    })
    name: string;

    @ApiProperty({
        example: 'name',
        nullable: false,
        description: 'Символьный код',
    })
    slug: string;

    @ApiProperty({
        example: false,
        nullable: false,
        description: 'Синхронизация с битрикс24',
    })
    syncBitrix: boolean;

    @ApiProperty({
        example: false,
        nullable: false,
        description: 'Синхронизация с AmoCRM',
    })
    syncAmo: boolean;

    @ApiProperty({
        example: 'test@mail.ru',
        nullable: true,
        description: 'E-mail',
    })
    email: string;
}

export class FullCallback extends CallbackDto {
    @ApiProperty({ type: () => [CallbackFieldDto], description: 'Поля' })
    field?: CallbackFieldDto[];

    // @ApiProperty({ description: 'Записи заявок' })
    // instances?: CallbackInstances[];
}

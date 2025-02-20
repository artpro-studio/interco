import { ApiProperty } from '@nestjs/swagger';
import { DefaultBaseDto } from 'src/dto/base.dto';
import { ITypePagesParams } from 'src/pages/interface';
import { FullPagesParamsFieldDto } from '../pages-params-field/pages-params-field.dto';
import { IsNotEmpty } from 'class-validator';
import { PagesDto } from '../pages/create-pages.dto';

export class PagesParamsDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Название парамметра', nullable: false, description: 'Название парамметра' })
    @IsNotEmpty({message: 'Название обьязательное поле'})
    name: string;

    @ApiProperty({ example: 'name', nullable: false, description: 'Символьный код' })
    slug: string;

    @ApiProperty({ example: ITypePagesParams.TEXT, enum: ITypePagesParams, enumName: 'ITypePagesParams', nullable: false, description: 'Тип' })
    @IsNotEmpty({message: 'Тип обьязательное поле'})
    type: ITypePagesParams;

    @ApiProperty({ example: false, nullable: false, description: 'Тип' })
    isFilter: boolean;
}

export class FullPagesParamsDto extends PagesParamsDto {
    @ApiProperty({ type: () => [FullPagesParamsFieldDto], description: 'Значение параметров' })
    paramsValue?: FullPagesParamsFieldDto[];

    @ApiProperty({ type: () => PagesDto, description: 'Страница' })
    pages?: PagesDto;
}

export class CreatePagesParamsDto extends PagesParamsDto {
    @ApiProperty({ nullable: true, description: 'Значение параметра' })
    @IsNotEmpty({message: 'Страница обьязательное поле'})
    pagesId?: number;
}

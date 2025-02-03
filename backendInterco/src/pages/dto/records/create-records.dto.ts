import { ApiProperty } from "@nestjs/swagger";
import { BaseSeoDto } from "src/dto/base-seo.dto"
import { UserDto } from "src/user/dto/user.dto";
import { PagesDto } from "../pages/create-pages.dto";
import { PagesCommentsDto } from "../pages-comments/create-pages-comments.dto";
import { IsNotEmpty, IsNumber, IsString } from "class-validator";
import { DropDownDto } from "src/dto/response-drop-down.dto";
import { FullPagesParamsValueDto } from "../pages-params-value/pages-params-value.dto";

export class RecordsDto extends BaseSeoDto {
    @ApiProperty({ example: 'Заголовок', nullable: true, description: 'Заголовок' })
    @IsNotEmpty({message: 'Заголовок обьязательное поле'})
    @IsString({message: 'Заголовок должен быть строкой'})
    title: string;

    @ApiProperty({ example: 'Описание', nullable: true, description: 'Описание' })
    description: string;

    @ApiProperty({ example: 0, nullable: true, description: 'Счетчик просмотров' })
    countView: number;
}

export class FullRecordsDto extends RecordsDto {
    @ApiProperty({type: () => [PagesCommentsDto], nullable: true, description: 'Комментарии' })
    comments?: PagesCommentsDto[];

    @ApiProperty({type: () => PagesDto, nullable: true, description: 'Страница' })
    pages?: PagesDto;

    @ApiProperty({ type: () => UserDto, nullable: true, description: 'Пользователь' })
    author?: UserDto;

    @ApiProperty({ type: () => [FullPagesParamsValueDto], description: 'Запись(статья)' })
    paramsValue?: FullPagesParamsValueDto[];

    @ApiProperty({nullable: true, description: 'Парамметры' })
    params?: Record<string, any>;
}

export class CreateRecordsDto extends RecordsDto {
    @ApiProperty({ type: () => DropDownDto, nullable: true, description: 'ID страницы' })
    @IsNotEmpty({message: 'ID страницы обьязательное поле'})
    pages: DropDownDto;

    @ApiProperty({nullable: true, description: 'Парамметры' })
    params?: Record<string, any>;
}

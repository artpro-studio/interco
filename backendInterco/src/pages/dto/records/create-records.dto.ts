import { ApiProperty } from "@nestjs/swagger";
import { BaseSeoDto } from "src/dto/base-seo.dto"
import { UserDto } from "src/user/dto/user.dto";
import { PagesDto } from "../pages/create-pages.dto";
import { PagesCommentsDto } from "../pages-comments/create-pages-comments.dto";
import { IsNotEmpty, IsNumber, IsString } from "class-validator";
import { DropDownDto } from "src/dto/response-drop-down.dto";
import { PagesParamsFieldDto } from "../pages-params-field/pages-params-field.dto";
import { RecordsTitleDto } from "./records-title/records-title.dto";
import { DefaultBaseDto } from "src/dto/base.dto";
import { RecordsDescriptionDto } from "./records-description/records-description.dto";
import { RecordsSeoDto } from "./records-seo/records-seo.dto";
import { PagesSectionsDto } from "../pages-sections/pages-sections.dto";

export class RecordsDto extends DefaultBaseDto {
    @ApiProperty({ type: () => RecordsTitleDto, nullable: true, required: false, description: 'Заголовок' })
    @IsNotEmpty({message: 'Заголовок обьязательное поле'})
    title?: RecordsTitleDto;

    @ApiProperty({ type: () => RecordsDescriptionDto, nullable: true, required: false, description: 'Описание' })
    description?: RecordsDescriptionDto;

    @ApiProperty({ example: 0, nullable: true, description: 'Счетчик просмотров' })
    countView: number;

    @ApiProperty({ type: () => RecordsSeoDto, required: false, nullable: true, description: 'Сео парамметры' })
    seo?: RecordsSeoDto;

    @ApiProperty({ type: () => [PagesSectionsDto], required: false, nullable: true, description: 'Разделы' })
    sections?: PagesSectionsDto[];
}

export class FullRecordsDto extends RecordsDto {
    @ApiProperty({type: () => [PagesCommentsDto], nullable: true, description: 'Комментарии' })
    comments?: PagesCommentsDto[];

    @ApiProperty({type: () => PagesDto, nullable: true, description: 'Страница' })
    pages?: PagesDto;

    @ApiProperty({ type: () => UserDto, nullable: true, description: 'Пользователь' })
    author?: UserDto;

    @ApiProperty({ type: () => [PagesParamsFieldDto], description: 'Парамметры' })
    paramsField?: PagesParamsFieldDto[];
}

export class CreateRecordsDto extends RecordsDto {
    @ApiProperty({ type: () => DropDownDto, nullable: true, description: 'ID страницы' })
    @IsNotEmpty({message: 'ID страницы обьязательное поле'})
    pages: DropDownDto;

    @ApiProperty({type:() => [PagesParamsFieldDto], required: false, nullable: true, description: 'Парамметры' })
    paramsField?: PagesParamsFieldDto[];
}

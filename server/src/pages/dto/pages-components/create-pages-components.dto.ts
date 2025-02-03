import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { PagesDto } from "../pages/create-pages.dto";
import { IsNotEmpty, IsNumber } from "class-validator";

export class PagesComponentsDto extends DefaultBaseDto {
    @ApiProperty({ example: 1, nullable: false, description: 'Порядок' })
    order: number;
    
    @ApiProperty({ example: 'main-head', nullable: false, description: 'Название компонента' })
    name: string;

    @ApiProperty({ example: {title: 'Заголовок', description: 'Описание'}, nullable: true, description: 'Json с данными' })
    content: string;
}

export class FullPagesComponentsDto extends PagesComponentsDto {
    @ApiProperty({type: () => PagesDto, description: 'Страница' })
    pages: PagesDto;
}

export class CreatePagesComponents {
    @ApiProperty({ example: 1, nullable: true, description: 'ID страницы' })
    @IsNotEmpty({message: 'ID страницы обьязательное поле'})
    @IsNumber({}, {message: 'ID должен быть числом'})
    idPage: number;

    @ApiProperty({ type: () => [PagesComponentsDto], nullable: true, description: 'Контент' })
    fields: PagesComponentsDto[];
}
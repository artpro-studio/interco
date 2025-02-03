import { ApiProperty } from "@nestjs/swagger";
import { BaseSeoDto } from "src/dto/base-seo.dto";
import { PagesType } from "src/pages/interface";
import { RecordsDto } from "../records/create-records.dto";
import { IsNotEmpty, IsNumber, IsString } from "class-validator";

export class PagesDto extends BaseSeoDto {
    @ApiProperty({ example: 'Название', nullable: true, description: 'Название' })
    @IsNotEmpty({message: 'Название обьязательное поле'})
    @IsString({message: 'Название должен быть строкой'})
    name: string;

    @ApiProperty({ example: 'Описание', nullable: true, description: 'Описание' })
    description: string;

    @ApiProperty({ example: 'test', nullable: true, description: 'Символьный код' })
    slug: string;

    @ApiProperty({ example: '/pages/News/index.vue', nullable: true, description: 'Путь к странице компонента' })
    pagePath: string;

    @ApiProperty({ example: PagesType.LANDING, enum: PagesType, nullable: true, description: 'Тип' })
    @IsNotEmpty({message: 'Тип обьязательное поле'})
    type: PagesType;

}

export class FullPagesDto extends PagesDto {
    @ApiProperty({ type: () => [RecordsDto], nullable: true, description: 'Записи в блоге' })
    records: RecordsDto[];
}

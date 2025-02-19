import { ApiProperty } from "@nestjs/swagger";
import { BaseSeoDto } from "src/dto/base-seo.dto";
import { PagesType } from "src/pages/interface";
import { RecordsDto } from "../records/create-records.dto";
import { IsNotEmpty, IsNumber, IsString } from "class-validator";
import { DefaultBaseDto } from "src/dto/base.dto";
import { PagesSeoEntity } from "src/pages/entity/pages-seo.entity";
import { JoinColumn, OneToOne } from "typeorm";
import { PagesSeoDto } from "../seo/pages-seo.dto";
import { PagesIblockDto } from "../iblock/pages-iblock.dto";

export class PagesDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Название', nullable: true, description: 'Название' })
    @IsNotEmpty({message: 'Название обьязательное поле'})
    @IsString({message: 'Название должен быть строкой'})
    name: string;

    @ApiProperty({ example: 'Описание', nullable: true, description: 'Описание' })
    description: string;

    @ApiProperty({ example: 'test', nullable: true, description: 'Символьный код' })
    @IsNotEmpty({message: 'Символьный код обьязательное поле'})
    @IsString({message: 'Символьный код должен быть строкой'})
    slug: string;

    @ApiProperty({ example: '/pages/News/index.vue', nullable: true, description: 'Путь к странице компонента' })
    pagePath: string;

    @ApiProperty({ example: PagesType.LANDING, enum: PagesType, nullable: true, description: 'Тип' })
    @IsNotEmpty({message: 'Тип обьязательное поле'})
    type: PagesType;

    @ApiProperty({ type: () => PagesSeoDto, required: false, nullable: true, description: 'SEO' })
    seo?: PagesSeoDto;
}

export class FullPagesDto extends PagesDto {
    @ApiProperty({ type: () => [RecordsDto], nullable: true, description: 'Записи в блоге' })
    records: RecordsDto[];

    @ApiProperty({ type: () => [PagesIblockDto], nullable: true, required: false, description: 'Iblock' })
    iblocks?: PagesIblockDto[];
}

import { ApiProperty } from "@nestjs/swagger";
import { PagesDto } from "./create-pages.dto";
import { PagesIblockSectionDto } from "../iblock/section/pages-iblock-section.dto";
import { DefaultBaseDto } from "src/dto/base.dto";
import { ResultDto } from "src/dto/reponse.dto";

export class PagesPublicIblockRecordsDto extends DefaultBaseDto {
    @ApiProperty({type: () => 'number', nullable: true, required: false, description: 'Поля у записи' })
    sort?: number;

    @ApiProperty({ type: () => [PagesIblockSectionDto], required: false, nullable: true, description: 'Разделы' })
    sections?: PagesIblockSectionDto[];

    @ApiProperty({ type: () => 'array', nullable: true, required: false, description: 'Поля' })
    fields: Record<string, any>[];
}

export class PagesPublicIblockDto extends DefaultBaseDto{
    id: number;
    @ApiProperty({ example: 'Название', nullable: false, description: 'Название' })
    name: string;

    @ApiProperty({ example: 'Символьный код', nullable: false, description: 'Символьный код' })
    slug: string;

    @ApiProperty({ type: () => 'object', nullable: true, required: false, description: 'Атрибуты' })
    attributes?: any;

    @ApiProperty({ type: () => PagesDto, nullable: true, required: false, description: 'Страница' })
    page?: PagesDto;

    @ApiProperty({ type: () => [PagesIblockSectionDto], required: false, nullable: true, description: 'Разделы' })
    sections?: PagesIblockSectionDto[]

    @ApiProperty({ type: () => [PagesPublicIblockRecordsDto], required: false, nullable: true, description: 'Разделы' })
    records?: PagesPublicIblockRecordsDto[]
}

export class PagesPublicDto extends PagesDto {
    @ApiProperty({ type: () => [PagesPublicIblockDto], nullable: true, required: false, description: 'Iblock' })
    iblocks?: PagesPublicIblockDto[];
}

export class ResultPagesPublicDto extends ResultDto {
    @ApiProperty({ type: () => PagesPublicDto, nullable: true, description: 'Ответ'})
    entity: PagesPublicDto;
}

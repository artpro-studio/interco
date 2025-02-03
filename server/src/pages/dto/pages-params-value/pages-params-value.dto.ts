import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { PagesDto } from "../pages/create-pages.dto";
import { PagesParamsDto } from "../pages-params/pages-params.dto";
import { IsNotEmpty } from "class-validator";
import { RecordsDto } from "../records/create-records.dto";

export class PagesParamsValueDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Значение', nullable: false, description: 'Значение' })
    value: string;

    @ApiProperty({ example: {title: 'Заголовок', description: 'Описание'}, nullable: true, description: 'Json с данными' })
    valueJson: string;
}

export class FullPagesParamsValueDto extends PagesParamsValueDto {
    @ApiProperty({ type: () => PagesParamsDto, description: 'Парамметр' })
    params?: PagesParamsDto;

    @ApiProperty({ type: () => RecordsDto, description: 'Запись(статья)' })
    record: RecordsDto;
}

export class CreatePagesParamsValueDto extends PagesParamsValueDto {
    @ApiProperty({ description: 'Парамметр' })
    @IsNotEmpty({message: 'Парамметр обьязательное поле'})
    params: number;

    @ApiProperty({ type: () => RecordsDto, description: 'Запись(статья)' })
    @IsNotEmpty({message: 'ID записи обьязательное поле'})
    record: number;
}

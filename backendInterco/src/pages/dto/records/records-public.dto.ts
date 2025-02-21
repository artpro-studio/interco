import { ApiProperty } from "@nestjs/swagger";
import { IsObject } from "class-validator";
import { DefaultBaseDto } from "src/dto/base.dto";
import { PagesDto } from "../pages/create-pages.dto";
import { ResultDto, ResultPaginationOptionDto } from "src/dto/reponse.dto";

export class RecordsPublicDto extends DefaultBaseDto {
    @ApiProperty({ type: () => 'object', nullable: true, required: false, description: 'Заголовок' })
    @IsObject()
    title: Record<string, any>;

    @ApiProperty({ type: () => 'object', nullable: true, required: false, description: 'Описание' })
    description: Record<string, any>;

    @ApiProperty({ example: 0, nullable: true, description: 'Счетчик просмотров' })
    countView: number;

    @ApiProperty({ type: () => 'object', required: false, nullable: true, description: 'Сео парамметры' })
    seo?: Record<string, any>;

    @ApiProperty({ type: () => 'object', description: 'Парамметры' })
    paramsField?: Record<string, any>;

    @ApiProperty({type: () => PagesDto, nullable: true, description: 'Страница' })
    pages?: PagesDto;
}

export class ResultRecordsPublicDto extends ResultDto {
    @ApiProperty({ type: () => RecordsPublicDto, nullable: true, description: 'Ответ'})
    entity: RecordsPublicDto;
}

export class RecordsPublicOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [RecordsPublicDto], nullable: true, description: 'Ответ' })
    entity: RecordsPublicDto[];
}

export class ResultRecordsPublicListDto extends ResultDto {
    @ApiProperty({ type: () => RecordsPublicOptionDto, nullable: true, description: 'Ответ'})
    entity: RecordsPublicOptionDto;
}

import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { ResultDto } from "src/dto/reponse.dto";

export class PagesIblockPublicDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Название', nullable: false, description: 'Название' })
    name: string;

    @ApiProperty({ example: 'Символьный код', nullable: false, description: 'Символьный код' })
    slug: string;

    @ApiProperty({ type: () => 'object', nullable: true, required: false, description: 'Атрибуты' })
    attributes?: any;

    @ApiProperty({ type: () => 'array', description: 'Записи' })
    records?: Record<string, any>[];

    @ApiProperty({ type: () => 'array', nullable: true, required: false, description: 'Разделы' })
    sections: Record<string, any>[];
}

export class ResultPageIblockPublicDto extends ResultDto {
    @ApiProperty({ type: () => PagesIblockPublicDto, nullable: true, description: 'Ответ'})
    entity: PagesIblockPublicDto;
}

export class ResultPageIblockPublicListDto extends ResultDto {
    @ApiProperty({ type: () => [PagesIblockPublicDto], nullable: true, description: 'Ответ'})
    entity: PagesIblockPublicDto[];
}

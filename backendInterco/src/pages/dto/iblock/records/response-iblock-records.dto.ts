import { ApiProperty } from '@nestjs/swagger';
import {
    BaseQuery,
    ResultDto,
    ResultPaginationOptionDto,
} from 'src/dto/reponse.dto';
import { PagesIblockRecordsDto } from './pages-iblock-records.dto';
import { IsObject } from 'class-validator';

export class PagesIblockRecordsQuery extends BaseQuery {
    @ApiProperty({ nullable: true, description: 'ID iblock' })
    iblockID: number;
}

export class RecordsForSlugAndSectionQuery extends BaseQuery {
    @ApiProperty({
        type: () => String,
        nullable: true,
        description: 'ID iblock',
    })
    slug?: string;

    @ApiProperty({
        type: () => Number,
        nullable: true,
        description: 'ID iblock',
    })
    sectionId?: number;
}

export class PagesIblockRecordsOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({
        type: () => [PagesIblockRecordsDto],
        nullable: true,
        description: 'Ответ',
    })
    entity: PagesIblockRecordsDto[];
}

export class PagesIblockRecordsListDto extends ResultDto {
    @ApiProperty({
        type: () => PagesIblockRecordsOptionDto,
        nullable: true,
        description: 'Ответ',
    })
    entity: PagesIblockRecordsOptionDto;
}

export class ResultPagesIblockRecordsDto extends ResultDto {
    @ApiProperty({
        type: () => PagesIblockRecordsDto,
        nullable: true,
        description: 'Ответ',
    })
    entity: PagesIblockRecordsDto;
}

// Публичные ответы для клиента
export class ResultPagesIblockRecordsPublicDto extends ResultDto {
    @ApiProperty({
        type: () => 'object',
        nullable: true,
        required: false,
        description: 'Ответ',
    })
    @IsObject()
    entity: Record<string, any>;
}

export class PagesIblockRecordsPublickOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({
        type: () => 'array',
        nullable: true,
        required: false,
        description: 'Ответ',
    })
    entity: Record<string, any>[];
}

export class PagesIblockRecordsPublicListDto extends ResultDto {
    @ApiProperty({
        type: () => PagesIblockRecordsPublickOptionDto,
        nullable: true,
        description: 'Ответ',
    })
    entity?: PagesIblockRecordsPublickOptionDto;
}

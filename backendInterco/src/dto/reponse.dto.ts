import { ApiProperty } from '@nestjs/swagger';

export class ResultDto {
    @ApiProperty({ example: true, description: 'Статус' })
    isSuccess: boolean;

    @ApiProperty({ example: 200, description: 'Статус код' })
    statusCode?: number;

    @ApiProperty({ example: 'Сообщение', description: 'Сообщение' })
    message?: string;

    @ApiProperty({ description: 'Ошибки' })
    errors?: any;
}

export class ResultPaginationOptionDto {
    @ApiProperty({ example: 10, description: 'Количество записей' })
    count: number;

    @ApiProperty({ example: 10, description: 'Количество' })
    limit?: number;
}

export class BaseQuery {
    @ApiProperty({ type: () => String, example: 'Поиск', description: 'Поиск' })
    search: string;

    @ApiProperty({ type: () => Number, example: 10, description: 'Страница' })
    page: number;

    @ApiProperty({ type: () => Number, example: 32, description: 'Количество' })
    limit: number;
}

export class BaseQueryIds {
    @ApiProperty({
        type: Number,
        example: [1, 2, 3],
        isArray: true,
        description: 'ids',
    })
    ids: number[];
}

export class BaseQueryId {
    @ApiProperty({ example: 1, nullable: true, description: 'ID' })
    id: number | string;
}

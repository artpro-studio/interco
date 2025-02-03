import { ApiProperty } from "@nestjs/swagger";
import { BaseQuery, ResultDto, ResultPaginationOptionDto } from "src/dto/reponse.dto";
import { PagesCommentsDto } from "./create-pages-comments.dto";
import { CommentStatus } from 'src/pages/interface';

export class PagesCommentsQuery extends BaseQuery {
    @ApiProperty({ example: 1, nullable: true, description: 'ID записи' })
    id?: number;

    @ApiProperty({ example: 1, nullable: true, description: 'ID блога' })
    blogId?: number;

    @ApiProperty({ example: CommentStatus.SUCCESS, enum: CommentStatus, enumName: 'CommentStatus', nullable: true, description: 'Статус' })
    status?: CommentStatus;
}
export class PagesCommentsOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [PagesCommentsDto], nullable: true, description: 'Ответ' })
    entity: PagesCommentsDto[];
}

export class PagesCommentsListDto extends ResultDto {
    @ApiProperty({ type: () => PagesCommentsOptionDto, nullable: true, description: 'Ответ'})
    entity: PagesCommentsOptionDto;
}

export class ResultPagesCommentsDto extends ResultDto {
    @ApiProperty({ type: () => PagesCommentsDto, nullable: true, description: 'Ответ'})
    entity?: PagesCommentsDto;
}

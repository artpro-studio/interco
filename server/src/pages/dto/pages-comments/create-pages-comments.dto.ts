import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { RecordsDto } from "../records/create-records.dto";
import { UserDto } from "src/user/dto/user.dto";
import { IsNotEmpty, IsNumber, IsString } from "class-validator";
import { CommentStatus } from "src/pages/interface";
import { DropDownDto } from "src/dto/response-drop-down.dto";

export class PagesCommentsDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Комментарий', nullable: true, description: 'Комментарий' })
    @IsNotEmpty({message: 'Комментарий обьязательное поле'})
    @IsString({message: 'Комментарий должен быть строкой'})
    content: string;

    @ApiProperty({ example: CommentStatus.VERIFY, enum:CommentStatus, enumName: 'CommentStatus', nullable: false, description: 'Тип' })
    status: CommentStatus;

    @ApiProperty({ type:() => RecordsDto, nullable: true, description: 'Запись' })
    records: RecordsDto;

    @ApiProperty({type: () => UserDto, nullable: true, description: 'Пользователь' })
    user: UserDto

    @ApiProperty({type: () => [PagesCommentsDto], nullable: true, description: 'Дочерние комметраии' })
    children?: PagesCommentsDto[];

    @ApiProperty({type: () => PagesCommentsDto, nullable: true, description: 'Родительский комментарий' })
    parent?: PagesCommentsDto;
}

export class CreatePagesCommentsDto extends DefaultBaseDto{
    @ApiProperty({ example: 'Комментарий', nullable: true, description: 'Комментарий' })
    @IsNotEmpty({message: 'Комментарий обьязательное поле'})
    @IsString({message: 'Комментарий должен быть строкой'})
    content: string;

    @ApiProperty({ nullable: true, description: 'Запись' })
    @IsNotEmpty({message: 'Запись обьязательное поле'})
    @ApiProperty({type: DropDownDto, nullable: true, description: 'Запись' })
    records: DropDownDto;

    @ApiProperty({nullable: true, description: 'Пользователь' })
    @IsNotEmpty({message: 'Пользователь обьязательное поле'})
    @ApiProperty({type: DropDownDto, nullable: true, description: 'Пользователь' })
    user: DropDownDto
}

export class CreateCommentsDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Комментарий', nullable: true, description: 'Комментарий' })
    @IsNotEmpty({message: 'Комментарий обьязательное поле'})
    @IsString({message: 'Комментарий должен быть строкой'})
    content: string;

    @ApiProperty({ nullable: true, description: 'Запись' })
    @IsNotEmpty({message: 'Запись обьязательное поле'})
    @IsNumber({}, {message: 'Запись должна быть числом'})
    records: number;

    @ApiProperty({ nullable: true, description: 'Запись' })
    commentId?: number;
}

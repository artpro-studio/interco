import { ApiProperty } from "@nestjs/swagger";
import { BaseSeoEntity } from "src/entity/base-seo.entity";
import { UserEntity } from "src/user/entity/user.entity";
import { Column, Entity, ManyToOne, OneToMany } from "typeorm";
import { PagesEntity } from "./pages.entity";
import { PagesCommentsEntity } from "./pages-comments.entity";
import { PagesParamsValueEntity } from "./pages-params-value.entity";

 @Entity({
    name: 'records'
 })
export class RecordsEntity extends BaseSeoEntity {
    @ApiProperty({ example: 'Заголовок', nullable: false, description: 'Заголовок' })
    @Column({ nullable: false, length: 1024 })
    title: string;

    @ApiProperty({ example: 'Описание', nullable: true, description: 'Описание' })
    @Column({ nullable: true,})
    description: string;

    @ApiProperty({ example: 0, nullable: true, description: 'Счетчик просмотров' })
    @Column({ type: 'int', default: 0, nullable: false})
    countView: number;

    @ApiProperty({ description: 'Комментарии' })
    @OneToMany(() => PagesCommentsEntity, (comment) => comment.records)
    comments: PagesCommentsEntity[];

    @ApiProperty({ description: 'Страница' })
    @ManyToOne(() => PagesEntity, (pages) => pages.records)
    pages: PagesEntity;

    @ApiProperty({ description: 'Пользователь' })
    @ManyToOne(() => UserEntity, (user) => user.pagesRecords)
    author: UserEntity;

    @ApiProperty({ description: 'Запись(статья)' })
    @OneToMany(() => PagesParamsValueEntity, (paramsValue) => paramsValue.record)
    paramsValue: PagesParamsValueEntity[];
}

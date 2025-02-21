import { ApiProperty } from "@nestjs/swagger";
import { UserEntity } from "src/user/entity/user.entity";
import { Column, Entity, JoinColumn, ManyToOne, OneToMany, OneToOne } from "typeorm";
import { PagesEntity } from "./pages.entity";
import { PagesCommentsEntity } from "./pages-comments.entity";
import { PagesParamsFieldEntity } from "./pages-params-field.entity";
import { RecordsTitleEntity } from "./records-title.entity";
import { DefaultBaseEntity } from "src/entity/base.entity";
import { RecordsSeoEntity } from "./records-seo.entity";
import { RecordsDescriptionEntity } from "./records-description.entity";

 @Entity({
    name: 'records'
 })
export class RecordsEntity extends DefaultBaseEntity {
    @ApiProperty({ description: 'Заголовок' })
    @OneToOne(() => RecordsTitleEntity)
    @JoinColumn()
    title: RecordsTitleEntity;

    @ApiProperty({ nullable: true, description: 'Описание' })
    @OneToOne(() => RecordsDescriptionEntity)
    @JoinColumn()
    description: RecordsDescriptionEntity;

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
    @OneToMany(() => PagesParamsFieldEntity, (paramsValue) => paramsValue.record)
    paramsField: PagesParamsFieldEntity[];

    @ApiProperty({ description: 'Сео парамметры' })
    @OneToOne(() => RecordsSeoEntity)
    @JoinColumn()
    seo: RecordsSeoEntity;
}

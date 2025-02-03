import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseEntity } from "src/entity/base.entity";
import { UserEntity } from "src/user/entity/user.entity";
import { Column, Entity, JoinTable, ManyToMany, ManyToOne, OneToMany, TreeChildren, TreeLevelColumn, TreeParent } from "typeorm";
import { RecordsEntity } from "./records.entity";
import { CommentStatus } from "../interface";

@Entity({
    name: 'pages-comments'
})
export class PagesCommentsEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Комментарий', nullable: false, description: 'Комментарий' })
    @Column({ nullable: true,})
    content: string;

    @ApiProperty({ example: CommentStatus.VERIFY, enum:CommentStatus, enumName: 'CommentStatus', nullable: false, description: 'Тип' })
    @Column({ enum: CommentStatus, default: CommentStatus.VERIFY, nullable: false})
    status: CommentStatus;

    @ApiProperty({ description: 'Запись' })
    @ManyToOne(() => RecordsEntity, (record) => record.comments)
    records: RecordsEntity;

    @ApiProperty({ description: 'Пользователь' })
    @ManyToOne(() => UserEntity, (user) => user.pagesComments)
    user: UserEntity

    @ApiProperty({ description: 'Пользователи которым понравились комметарии' })
    @ManyToMany(() => UserEntity)
    @JoinTable({
        name: 'users_comments_like'
    })
    userLikes: UserEntity[];

    @TreeChildren()
    children: PagesCommentsEntity[]

    @TreeParent()
    parent: PagesCommentsEntity

    @TreeLevelColumn()
    level: number
}

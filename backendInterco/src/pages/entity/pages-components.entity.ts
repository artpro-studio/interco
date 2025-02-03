import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseEntity } from "src/entity/base.entity";
import { Column, Entity, ManyToOne } from "typeorm";
import { PagesEntity } from "./pages.entity";

@Entity({
    name: 'pages-components'
})
export class PagesComponentsEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 1, nullable: false, description: 'Порядок' })
    @Column({ type: 'int', nullable: false, default: 0})
    order: number;
    
    @ApiProperty({ example: 'main-head', nullable: false, description: 'Название компонента' })
    @Column({ nullable: false, length: 1024 })
    name: string;

    @ApiProperty({ example: {title: 'Заголовок', description: 'Описание'}, nullable: true, description: 'Json с данными' })
    @Column({type: 'json', nullable: true,})
    content: string;

    @ApiProperty({ description: 'Страница' })
    @ManyToOne(() => PagesEntity, (pages) => pages.components)
    pages: PagesEntity;
}
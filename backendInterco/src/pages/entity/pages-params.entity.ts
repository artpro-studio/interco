import { ApiProperty } from '@nestjs/swagger';
import { DefaultBaseEntity } from 'src/entity/base.entity';
import { Column, Entity, ManyToOne, OneToMany } from 'typeorm';
import { ITypePagesParams } from '../interface';
import { PagesParamsValueEntity } from './pages-params-value.entity';
import { PagesEntity } from './pages.entity';

@Entity({
    name: 'pages_params'
})
export class PagesParamsEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Название парамметра', nullable: false, description: 'Название парамметра' })
    @Column({ nullable: false, length: 1024 })
    name: string;

    @ApiProperty({ example: 'name', nullable: false, description: 'Символьный код' })
    @Column({ nullable: false, length: 1024 })
    slug: string;

    @ApiProperty({ example: ITypePagesParams.TEXT, enum: ITypePagesParams, enumName: 'ITypePagesParams', nullable: false, description: 'Тип' })
    @Column({ enum: ITypePagesParams, default: ITypePagesParams.TEXT, nullable: false})
    type: ITypePagesParams;

    @ApiProperty({ example: false, nullable: false, description: 'Тип' })
    @Column({ type: 'bool', default: false, nullable: false})
    isFilter: boolean;

    @ApiProperty({ description: 'Значение параметров' })
    @OneToMany(() => PagesParamsValueEntity, (paramsValue) => paramsValue.params)
    paramsValue: PagesParamsValueEntity[];

    @ApiProperty({ description: 'Страница' })
    @ManyToOne(() => PagesEntity, (pages) => pages.params)
    pages: PagesEntity;
}

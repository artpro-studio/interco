import { ApiProperty } from '@nestjs/swagger';
import { DefaultBaseEntity } from 'src/entity/base.entity';
import { Column, Entity, ManyToOne } from 'typeorm';
import { PagesParamsEntity } from './pages-params.entity';
import { PagesEntity } from './pages.entity';
import { RecordsEntity } from './records.entity';

@Entity({
    name: 'pages_params_value'
})
export class PagesParamsValueEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Значение', nullable: false, description: 'Значение' })
    @Column({ nullable: true})
    value: string;

    @ApiProperty({ example: {title: 'Заголовок', description: 'Описание'}, nullable: true, description: 'Json с данными' })
    @Column({type: 'json', nullable: true})
    valueJson: string;

    @ApiProperty({ description: 'Парамметр' })
    @ManyToOne(() => PagesParamsEntity, (params) => params.paramsValue)
    params: PagesParamsEntity;

    @ApiProperty({ description: 'Запись(статья)' })
    @ManyToOne(() => RecordsEntity, (record) => record.paramsValue)
    record: RecordsEntity;
}

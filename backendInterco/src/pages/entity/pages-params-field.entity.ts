import { ApiProperty } from '@nestjs/swagger';
import { DefaultBaseEntity } from 'src/entity/base.entity';
import { Column, Entity, ManyToOne, OneToMany } from 'typeorm';
import { PagesParamsEntity } from './pages-params.entity';
import { RecordsEntity } from './records.entity';
import { PagesParamsFieldValueEntity } from './pages-params-field-value.entity';

@Entity({
    name: 'pages_params_field'
})
export class PagesParamsFieldEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Значение', nullable: true, description: 'Значение' })
    @OneToMany(() => PagesParamsFieldValueEntity, (value) => value.pagesParamsField)
    value: PagesParamsFieldValueEntity[];

    @ApiProperty({ description: 'Парамметр' })
    @ManyToOne(() => PagesParamsEntity, (params) => params.paramsValue)
    params: PagesParamsEntity;

    @ApiProperty({ description: 'Запись(статья)' })
    @ManyToOne(() => RecordsEntity, (record) => record.paramsValue)
    record: RecordsEntity;
}

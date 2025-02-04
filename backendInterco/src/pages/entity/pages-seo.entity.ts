import { DefaultBaseEntity } from 'src/entity/base.entity';
import { PagesSeoParamsEntity } from './pages-seo-params.entity';
import { PagesEntity } from './pages.entity';
import { Entity, OneToMany, OneToOne } from 'typeorm';
import { ApiProperty } from '@nestjs/swagger';

@Entity({
    name: 'pages_seo'
})
export class PagesSeoEntity extends DefaultBaseEntity {
    @ApiProperty({ type: () => [PagesSeoParamsEntity], nullable: true, required: false })
    @OneToMany(() => PagesSeoParamsEntity, (params) => params.pagesSeo)
    params: PagesSeoParamsEntity[];
}

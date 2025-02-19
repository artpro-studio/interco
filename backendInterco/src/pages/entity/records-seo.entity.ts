import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseEntity } from "src/entity/base.entity";
import { Entity, OneToMany } from "typeorm";
import { RecordsSeoParamsEntity } from "./records-seo-params.entity";

@Entity({
    name: 'records_seo'
})
export class RecordsSeoEntity extends DefaultBaseEntity {
    @ApiProperty({ type: () => [RecordsSeoParamsEntity], nullable: true, required: false })
    @OneToMany(() => RecordsSeoParamsEntity, (params) => params.recordSeo)
    params: RecordsSeoParamsEntity[];
}

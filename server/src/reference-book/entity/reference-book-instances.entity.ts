import { DefaultBaseEntity } from "src/entity/base.entity";
import { ApiProperty } from '@nestjs/swagger';
import { ManyToOne, OneToMany, Entity } from 'typeorm';
import { ReferenceBookEntity } from "./reference-book.entity";
import { ReferenceBookInstancesValueEntity } from "./reference-book-instances-value.entity";

@Entity({
    name: 'reference_book_instances'
})
export class ReferenceBookInstancesEntity extends DefaultBaseEntity {
    @ApiProperty({ description: 'Справочник' })
    @ManyToOne(() => ReferenceBookEntity, (reference) => reference.instances)
    referenceBook: ReferenceBookEntity;

    @ApiProperty({ description: 'Значения' })
    @OneToMany(() => ReferenceBookInstancesValueEntity, (value) => value.instance)
    instancesValue: ReferenceBookInstancesValueEntity[];
}

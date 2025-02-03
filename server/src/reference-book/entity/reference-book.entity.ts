import { DefaultBaseEntity } from "src/entity/base.entity";
import { ApiProperty } from '@nestjs/swagger';
import { Column, OneToMany, Entity } from 'typeorm';
import { ReferenceBookAttributesEntity } from "./reference-book-attributes.entity";
import { ReferenceBookInstancesEntity } from "./reference-book-instances.entity";


@Entity({
    name: 'reference_book'
})
export class ReferenceBookEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Название', nullable: false, description: 'Название справочник' })
    @Column({ nullable: false, length: 1024 })
    name: string;

    @ApiProperty({ example: 'name', nullable: false, description: 'Символьный код' })
    @Column({ nullable: false, length: 1024 })
    slug: string;

    @ApiProperty({ description: 'Атрибуты' })
    @OneToMany(() => ReferenceBookAttributesEntity, (attribute) => attribute.referenceBook)
    attributes: ReferenceBookAttributesEntity[];

    @ApiProperty({ description: 'Записи' })
    @OneToMany(() => ReferenceBookInstancesEntity, (attribute) => attribute.referenceBook)
    instances: ReferenceBookInstancesEntity[];
}

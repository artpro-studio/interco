import { DefaultBaseEntity } from "src/entity/base.entity";
import { ApiProperty } from '@nestjs/swagger';
import { Column, ManyToOne, OneToMany, Entity } from 'typeorm';
import { ITypeAttributes } from "../interface";
import { ReferenceBookEntity } from "./reference-book.entity";
import { ReferenceBookInstancesValueEntity } from "./reference-book-instances-value.entity";

@Entity({
    name: 'reference_book_attributes'
})
export class ReferenceBookAttributesEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Название атрибута', nullable: false, description: 'Название атрибута' })
    @Column({ nullable: false, length: 1024 })
    name: string;

    @ApiProperty({ example: 'name', nullable: false, description: 'Символьный код' })
    @Column({ nullable: false, length: 1024 })
    slug: string;

    @ApiProperty({ example: ITypeAttributes.TEXT, nullable: false, description: 'Тип' })
    @Column({ enum: ITypeAttributes, default: ITypeAttributes.TEXT, nullable: false})
    type: ITypeAttributes;

    @ApiProperty({ description: 'Справочник' })
    @ManyToOne(() => ReferenceBookEntity, (reference) => reference.attributes)
    referenceBook: ReferenceBookEntity;

    @ApiProperty({ description: 'Значения' })
    @OneToMany(() => ReferenceBookInstancesValueEntity, (value) => value.attribute)
    instancesValue: ReferenceBookInstancesValueEntity[];
}

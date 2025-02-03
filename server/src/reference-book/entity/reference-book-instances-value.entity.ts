import { DefaultBaseEntity } from "src/entity/base.entity";
import { ApiProperty } from '@nestjs/swagger';
import { ManyToOne, Column, Entity } from 'typeorm';
import { ReferenceBookAttributesEntity } from "./reference-book-attributes.entity";
import { ReferenceBookInstancesEntity } from "./reference-book-instances.entity";

@Entity({
    name: 'reference_book_instances_value'
})
export class ReferenceBookInstancesValueEntity extends DefaultBaseEntity {
    @ApiProperty({ example: 'Значение', nullable: false, description: 'Значение' })
    @Column({ nullable: true})
    value: string;

    @ApiProperty({ example: {title: 'Заголовок', description: 'Описание'}, nullable: true, description: 'Json с данными' })
    @Column({type: 'json', nullable: true})
    valueJson: string;

    @ApiProperty({ description: 'Запись' })
    @ManyToOne(() => ReferenceBookInstancesEntity, (reference) => reference.instancesValue)
    instance: ReferenceBookInstancesEntity;

    @ApiProperty({ description: 'Атрибут' })
    @ManyToOne(() => ReferenceBookAttributesEntity, (reference) => reference.instancesValue)
    attribute: ReferenceBookAttributesEntity;
}

import { DefaultBaseDto } from "src/dto/base.dto";
import { ApiProperty } from '@nestjs/swagger';
import { ReferenceBookInstancesDto } from "../reference-book-instances/reference-book-instances.dto";
import { ReferenceBookAttributesDto } from "../reference-book-attributes/reference-book-attributes.dto";

export class ReferenceBookInstancesValueDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Значение', nullable: false, description: 'Значение' })
    value: string;

    @ApiProperty({ example: {title: 'Заголовок', description: 'Описание'}, nullable: true, description: 'Json с данными' })
    valueJson: string;
}

export class FullReferenceBookInstancesValueDto extends ReferenceBookInstancesValueDto {
    @ApiProperty({ type: () => ReferenceBookInstancesDto, description: 'Запись' })
    instance: ReferenceBookInstancesDto;

    @ApiProperty({ type: () => ReferenceBookAttributesDto, description: 'Атрибут' })
    attribute: ReferenceBookAttributesDto;
}

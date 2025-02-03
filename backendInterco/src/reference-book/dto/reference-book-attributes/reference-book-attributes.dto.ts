import { DefaultBaseDto } from 'src/dto/base.dto';
import { ApiProperty } from '@nestjs/swagger';
import { ITypeAttributes } from 'src/reference-book/interface';
import { ReferenceBookDto } from '../reference-book/reference-book.dto';
import { ReferenceBookInstancesValueDto } from '../reference-book-instances-value/reference-book-instances-value.dto';

export class ReferenceBookAttributesDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Название атрибута', nullable: false, description: 'Название атрибута' })
    name: string;

    @ApiProperty({ example: 'name', nullable: false, description: 'Символьный код' })
    slug: string;

    @ApiProperty({ example: ITypeAttributes.TEXT, enum: ITypeAttributes, nullable: false, description: 'Тип' })
    type: ITypeAttributes;
}

export class FullReferenceBookAttributesDto extends ReferenceBookAttributesDto {
    @ApiProperty({ type: () => ReferenceBookDto, description: 'Справочник' })
    referenceBook?: ReferenceBookDto;

    @ApiProperty({type: () => [ReferenceBookInstancesValueDto], description: 'Значения' })
    instancesValue?: ReferenceBookInstancesValueDto[];
}

export class CreateReferenceBookAttributesDto extends ReferenceBookAttributesDto {
    @ApiProperty({ example: 1, nullable: false, description: 'ID справочника' })
    referenceBookId: number;
}

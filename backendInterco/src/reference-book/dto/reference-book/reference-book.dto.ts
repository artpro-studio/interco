import { DefaultBaseDto } from 'src/dto/base.dto';
import { ApiProperty } from '@nestjs/swagger';
import { ReferenceBookAttributesDto } from '../reference-book-attributes/reference-book-attributes.dto';
import { ReferenceBookInstancesDto } from '../reference-book-instances/reference-book-instances.dto';

export class ReferenceBookDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Название', nullable: false, description: 'Название справочник' })
    name: string;

    @ApiProperty({ example: 'name', nullable: false, description: 'Символьный код' })
    slug: string;
}

export class FullReferenceBookDto extends ReferenceBookDto {
    @ApiProperty({ type: () => [ReferenceBookAttributesDto], description: 'Атрибуты' })
    attributes?: ReferenceBookAttributesDto[];

    @ApiProperty({ type: () => [ReferenceBookInstancesDto], description: 'Записи' })
    instances?: ReferenceBookInstancesDto[];
}

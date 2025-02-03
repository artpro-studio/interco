import { DefaultBaseDto } from "src/dto/base.dto";
import { ApiProperty } from '@nestjs/swagger';
import { ReferenceBookDto } from "../reference-book/reference-book.dto";
import { ReferenceBookInstancesValueDto } from "../reference-book-instances-value/reference-book-instances-value.dto";

export class ReferenceBookInstancesDto extends DefaultBaseDto {}

export class FullReferenceBookInstancesDto extends ReferenceBookInstancesDto {
    @ApiProperty({type: () => ReferenceBookDto, description: 'Справочник' })
    referenceBook?: ReferenceBookDto;

    @ApiProperty({type: () => [ReferenceBookInstancesValueDto], description: 'Значения' })
    instancesValue?: ReferenceBookInstancesValueDto[];
}

export class CreateReferenceBookInstancesDto extends DefaultBaseDto {}

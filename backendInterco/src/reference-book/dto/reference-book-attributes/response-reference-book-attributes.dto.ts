import { ResultDto, ResultPaginationOptionDto } from "src/dto/reponse.dto";
import { ApiProperty } from '@nestjs/swagger';
import { FullReferenceBookAttributesDto } from "./reference-book-attributes.dto";


export class ReferenceBookAttributesOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [FullReferenceBookAttributesDto], nullable: true, description: 'Ответ' })
    entity: FullReferenceBookAttributesDto[];
}

export class ReferenceBookAttributesListDto extends ResultDto {
    @ApiProperty({ type: () => ReferenceBookAttributesOptionDto, nullable: true, description: 'Ответ'})
    entity: ReferenceBookAttributesOptionDto;
}

export class ResultReferenceBookAttributesDto extends ResultDto {
    @ApiProperty({ type: () => FullReferenceBookAttributesDto, nullable: true, description: 'Ответ'})
    entity: FullReferenceBookAttributesDto;
}

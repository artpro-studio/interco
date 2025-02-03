import { ResultDto, ResultPaginationOptionDto } from "src/dto/reponse.dto";
import { ApiProperty } from '@nestjs/swagger';
import { FullReferenceBookDto } from "./reference-book.dto";


export class ReferenceBookOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [FullReferenceBookDto], nullable: true, description: 'Ответ' })
    entity: FullReferenceBookDto[];
}

export class ReferenceBookListDto extends ResultDto {
    @ApiProperty({ type: () => ReferenceBookOptionDto, nullable: true, description: 'Ответ'})
    entity: ReferenceBookOptionDto;
}

export class ResultReferenceBookDto extends ResultDto {
    @ApiProperty({ type: () => FullReferenceBookDto, nullable: true, description: 'Ответ'})
    entity: FullReferenceBookDto;
}

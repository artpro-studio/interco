import { BaseQuery, ResultDto, ResultPaginationOptionDto } from "src/dto/reponse.dto";
import { ApiProperty } from '@nestjs/swagger';
import { FullReferenceBookInstancesDto, ReferenceBookInstancesDto } from "./reference-book-instances.dto";


export class ResponseBookInstancesOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [FullReferenceBookInstancesDto], nullable: true, description: 'Ответ' })
    entity: FullReferenceBookInstancesDto[];
}

export class ResponseBookAttributesListDto extends ResultDto {
    @ApiProperty({ type: () => ResponseBookInstancesOptionDto, nullable: true, description: 'Ответ'})
    entity: ResponseBookInstancesOptionDto;
}

export class ResultReferenceBookInstancesDto extends ResultDto {
    @ApiProperty({ type: () => FullReferenceBookInstancesDto, nullable: true, description: 'Ответ'})
    entity: FullReferenceBookInstancesDto;
}

export class ResultReferenceBookInstanceBaseDto extends ResultDto {
    @ApiProperty({ type: () => ReferenceBookInstancesDto, nullable: true, description: 'Ответ'})
    entity: ReferenceBookInstancesDto;
}

export class ReferenceBookInstancesQuery extends BaseQuery {
    @ApiProperty({ example: 'slug', description: 'Символьный код формы' })
    slug: number;
}

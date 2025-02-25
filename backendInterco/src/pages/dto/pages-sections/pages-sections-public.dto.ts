import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { PagesDto } from "../pages/create-pages.dto";
import { ResultDto, ResultPaginationOptionDto } from "src/dto/reponse.dto";

export class PublicPagesSectionsDto extends DefaultBaseDto {
    @ApiProperty({ type: () => 'object', nullable: true, required: false, description: 'Значения' })
    title?: Record<string, any>;

    @ApiProperty({ type: () => 'object', nullable: true, required: false, description: 'Значения' })
    description?: Record<string, any>;;

    @ApiProperty({ type: () => PagesDto, nullable: true, required: false, description: 'Страница' })
    pages?: PagesDto;
}

export class PublicPagesSectionsOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [PublicPagesSectionsDto], nullable: true, description: 'Ответ' })
    entity: PublicPagesSectionsDto[];
}

export class PublicPagesSectionsPaginationDto extends ResultDto {
    @ApiProperty({ type: () => PublicPagesSectionsOptionDto, nullable: true, description: 'Ответ'})
    entity: PublicPagesSectionsOptionDto;
}

export class ResultPublicPagesSectionsDto extends ResultDto {
    @ApiProperty({ type: () => PublicPagesSectionsDto, nullable: true, description: 'Ответ'})
    entity?: PublicPagesSectionsDto;
}


export class PublicPagesSectionsListDto extends ResultDto {
    @ApiProperty({ type: () => [PublicPagesSectionsDto], nullable: true, description: 'Ответ'})
    entity?: [PublicPagesSectionsDto];
}

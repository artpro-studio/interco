import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { PagesDto } from "../pages/create-pages.dto";
import { RecordsDto } from "../records/create-records.dto";
import { PagesSectionsDescriptionValueDto } from "./pages-sections-description-value.dto";
import { PagesSectionsTitleValueDto } from "./pages-sections-title-value.dto";

export class PagesSectionsDto extends DefaultBaseDto {
    @ApiProperty({ type: () => [PagesSectionsTitleValueDto], nullable: true, required: false, description: 'Значения' })
    title?: PagesSectionsTitleValueDto[];

    @ApiProperty({ type: () => [PagesSectionsDescriptionValueDto], nullable: true, required: false, description: 'Значения' })
    description?: PagesSectionsDescriptionValueDto[];

    @ApiProperty({ type: () => PagesDto, nullable: true, required: false, description: 'Страница' })
    pages?: PagesDto;

    @ApiProperty({ type: () => [RecordsDto], nullable: true, required: false, description: 'Записи' })
    records?: RecordsDto[];
}

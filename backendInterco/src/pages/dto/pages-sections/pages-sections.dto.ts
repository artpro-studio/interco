import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { PagesDto } from "../pages/create-pages.dto";
import { RecordsDto } from "../records/create-records.dto";
import { PagesSectionsValueDto } from "./pages-sections-value.dto";

export class PagesSectionsDto extends DefaultBaseDto {
    @ApiProperty({ type: () => [PagesSectionsValueDto], nullable: true, required: false, description: 'Значения' })
    value?: PagesSectionsValueDto[];

    @ApiProperty({ type: () => PagesDto, nullable: true, required: false, description: 'Страница' })
    pages?: PagesDto;

    @ApiProperty({ type: () => [RecordsDto], nullable: true, required: false, description: 'Записи' })
    records?: RecordsDto[];
}

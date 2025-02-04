import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { PagesDto } from "../pages/create-pages.dto";
import { PagesSeoParamsDto } from "./pages-seo-params.dto";

export class PagesSeoDto extends DefaultBaseDto {
    @ApiProperty({ type: () => PagesDto, nullable: true, required: false })
    page?: PagesDto;

    @ApiProperty({ type: () => [PagesSeoParamsDto], nullable: true, required: false })
    params?: PagesSeoParamsDto[];
}

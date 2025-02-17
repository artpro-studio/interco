import { ApiProperty } from "@nestjs/swagger";
import { ResultDto } from "src/dto/reponse.dto";
import { PagesIblockSectionDto } from "./pages-iblock-section.dto";

export class ResultPagesIblockSectionDto extends ResultDto {
    @ApiProperty({ type: () => [PagesIblockSectionDto], nullable: true, description: 'Ответ'})
    entity: PagesIblockSectionDto[];
}

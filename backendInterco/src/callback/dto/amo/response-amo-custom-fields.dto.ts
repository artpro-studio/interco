import { ApiProperty } from "@nestjs/swagger";
import { ResultDto, ResultPaginationOptionDto } from "src/dto/reponse.dto";
import { AmoCustmoFieldsDto } from "./amo-custom-fields.dto";

export class AmoCustmoFieldsOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [AmoCustmoFieldsDto], nullable: true, description: 'Ответ' })
    entity: AmoCustmoFieldsDto[];
}

export class AmoCustmoFieldsListDto extends ResultDto {
    @ApiProperty({ type: () => AmoCustmoFieldsOptionDto, nullable: true, description: 'Ответ'})
    entity: AmoCustmoFieldsOptionDto;
}
export class ResultAmoCustmoFieldstDto extends ResultDto {
    @ApiProperty({ type: () => AmoCustmoFieldsDto, nullable: true, description: 'Ответ'})
    entity: AmoCustmoFieldsDto;
}

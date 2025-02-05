import { ApiProperty } from "@nestjs/swagger";
import { DefaultBaseDto } from "src/dto/base.dto";
import { IIblockField } from "src/pages/interface";
import { PagesIblockDto } from "../pages-iblock.dto";
import { PagesIblockFieldsLabelDto } from "../label/pages-iblock-fields-label.dto";

export class PagesIBlockFieldsDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Название', nullable: false, description: 'Название' })
    name: string;

    @ApiProperty({ example: 'Символьный код', nullable: false, description: 'Символьный код' })
    slug: string;

    @ApiProperty({ example: IIblockField.TEXT, enum: IIblockField, enumName: 'IIblockField', nullable: true, description: 'Тип поля' })
    type: IIblockField;

    @ApiProperty({type: () => [PagesIblockFieldsLabelDto], nullable: true, required: false, description: 'Label' })
    label?: PagesIblockFieldsLabelDto[]

    @ApiProperty({ type: () => PagesIblockDto, nullable: true, required: false, description: 'Информационный блок' })
    iblock?: PagesIblockDto;

    // records: PagesIblockFieldsRecordsEntity[]
}

import { ResultDto } from "src/dto/reponse.dto";
import { SettingsContactsDto } from "./settings-contacts.dto";
import { ApiProperty } from "@nestjs/swagger";

export class ResultSettingsContactsDto extends ResultDto {
    @ApiProperty({ type: () => SettingsContactsDto, nullable: true, description: 'Ответ'})
    entity?: SettingsContactsDto;
}

export class ResultSettingsContactsListDto extends ResultDto {
    @ApiProperty({ type: () => [SettingsContactsDto], nullable: true, description: 'Ответ'})
    entity?: SettingsContactsDto[];
}
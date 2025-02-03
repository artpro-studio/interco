import { ResultDto } from "src/dto/reponse.dto";
import { ApiProperty } from '@nestjs/swagger';
import { FullSettingsMenuItemDto, SettingsMenuItemDto } from "./settings-menu-item.dto";

export class ResultSettingsMenuItemDto extends ResultDto {
    @ApiProperty({ type: () => SettingsMenuItemDto, nullable: true, description: 'Ответ'})
    entity?: SettingsMenuItemDto;
}

export class ResponseSettingsMenuItemDto extends ResultDto {
    @ApiProperty({ type: () => [FullSettingsMenuItemDto], nullable: true, description: 'Ответ'})
    entity?: FullSettingsMenuItemDto[];
}

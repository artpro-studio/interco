import { ResultDto, ResultPaginationOptionDto } from "src/dto/reponse.dto";
import { ApiProperty } from '@nestjs/swagger';
import { FullSettingsMenuDto, SettingsMenuDto } from "./settings-menu.dto";


export class SettingsMenuOptionDto extends ResultPaginationOptionDto {
    @ApiProperty({ type: () => [SettingsMenuDto], nullable: true, description: 'Ответ' })
    entity: SettingsMenuDto[];
}

export class ResponseSettingsMenuDto extends ResultDto {
    @ApiProperty({ type: () => [SettingsMenuDto], nullable: true, description: 'Ответ'})
    entity: SettingsMenuDto[];
}

export class ResponseListSettingsMenuDto extends ResultDto {
    @ApiProperty({ type: () => SettingsMenuOptionDto, nullable: true, description: 'Ответ'})
    entity: SettingsMenuOptionDto;
}

export class ResultSettingsMenuDto extends ResultDto {
    @ApiProperty({ type: () => FullSettingsMenuDto, nullable: true, description: 'Ответ' })
    entity: FullSettingsMenuDto
}

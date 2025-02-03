import { DefaultBaseDto } from "src/dto/base.dto";
import { ApiProperty } from '@nestjs/swagger';
import { SettingsMenuItemDto } from "./settings-menu-item.dto";

export class SettingsMenuDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Меню', nullable: false, description: 'Название меню' })
    title: string;

    @ApiProperty({ example: '#test', nullable: false, description: 'Hash' })
    slug: string;
}

export class FullSettingsMenuDto extends SettingsMenuDto {
    @ApiProperty({ type: () => [SettingsMenuItemDto], nullable: true, description: 'Пукты меню' })
    points?: SettingsMenuItemDto[]
}

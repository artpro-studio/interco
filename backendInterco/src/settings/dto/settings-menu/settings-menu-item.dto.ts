import { DefaultBaseDto } from "src/dto/base.dto";
import { ApiProperty } from '@nestjs/swagger';
import { DropDownDto } from "src/dto/response-drop-down.dto";
import { SettingsMenuDto } from "./settings-menu.dto";
import { PagesDto } from "src/pages/dto/pages/create-pages.dto";

export class SettingsMenuItemDto extends DefaultBaseDto {
    @ApiProperty({ example: 'Меню', nullable: false, description: 'Название меню' })
    title: string;

    @ApiProperty({ example: '#test', nullable: false, description: 'Hash' })
    hash: string;

    @ApiProperty({ example: 1, nullable: false, description: 'Порядок' })
    order: number;
}

export class CreateSettingsMenuItemDto extends SettingsMenuItemDto {
    @ApiProperty({ example: 1, nullable: false, description: 'ID меню' })
    menuId: number;

    @ApiProperty({ example: 1, nullable: false, description: 'ID родителя' })
    parentId: number;

    @ApiProperty({ example: 1, nullable: true, description: 'ID страницы' })
    pagesDropDown?: DropDownDto;

}
export class FullSettingsMenuItemDto extends SettingsMenuItemDto {
    @ApiProperty({ type: () => SettingsMenuDto, nullable: false, description: 'Менб' })
    menu?: SettingsMenuItemDto;

    @ApiProperty({ type: () => PagesDto, nullable: false, description: 'Менб' })
    pages?: PagesDto;
}

export class OrderSettingsMenuItemDto {
    @ApiProperty({ type: () => [SettingsMenuItemDto], nullable: false, description: 'ID меню' })
    data: SettingsMenuItemDto[];
}


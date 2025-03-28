import { ApiTags, ApiOperation, ApiResponse, ApiParam, ApiQuery } from '@nestjs/swagger';
import { Controller, Get, Query } from '@nestjs/common';
import { SettingsMenuItemService } from '../service/menu/settings-menu-item.service';
import { ResponseSettingsMenuItemDto } from '../dto/settings-menu/response-settings-menu-item.dto';
import { SettingsService } from '../service/settings.service';
import { ResultSettingsDto } from '../dto/response-settings.dto';

@ApiTags('Публичные настройки')
@Controller('settings-public')
export class SettingsPublicController {
    constructor(
        private readonly settingsMenuItemService: SettingsMenuItemService,
        private readonly settingsService: SettingsService,
    ) {}

    @ApiOperation({ summary: 'Получение настроек' })
    @ApiResponse({ status: 200, type: ResultSettingsDto })
    @Get('settings')
    getSettings(): Promise<ResultSettingsDto> {
        return this.settingsService.get();
    }

    @ApiOperation({ summary: 'Получение списка пунктов меню' })
    @ApiResponse({ status: 200, type: ResponseSettingsMenuItemDto })
    @ApiQuery({ name: 'slug', type: String, required: true, description: 'Список меню' })
    @Get('menu')
    getMenuForSlug(@Query() query: {slug: string}): Promise<ResponseSettingsMenuItemDto> {
        return this.settingsMenuItemService.getForSlug(query.slug);
    }
}

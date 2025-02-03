import { ApiTags, ApiOperation, ApiResponse, ApiParam } from '@nestjs/swagger';
import { ApiExceptionDecorators } from 'src/decorators/exception-decorators';
import { Controller, UseGuards, Get, Post, Body, Patch, Delete, Param } from '@nestjs/common';
import { SettingsMenuItemService } from '../../service/menu/settings-menu-item.service';
import { ResponseSettingsMenuItemDto, ResultSettingsMenuItemDto } from '../../dto/settings-menu/response-settings-menu-item.dto';
import { JwtAuthGuardAdmin } from 'src/auth/jwt-auth-admin.guard';
import { CreateSettingsMenuItemDto, OrderSettingsMenuItemDto, SettingsMenuItemDto } from '../../dto/settings-menu/settings-menu-item.dto';
import { ResultDto } from 'src/dto/reponse.dto';

@ApiTags('Настройки')
@ApiExceptionDecorators()
@UseGuards(JwtAuthGuardAdmin)
@Controller('settings-menu-item')
export class SettingsMenuItemController {
    constructor(private readonly settingsMenuService: SettingsMenuItemService) {}

    @ApiOperation({ summary: 'Обновление пункта меню' })
    @ApiResponse({ status: 200, type: ResultSettingsMenuItemDto })
    @Patch('update-order')
    onUpdateOrder(@Body() body: OrderSettingsMenuItemDto): Promise<ResultSettingsMenuItemDto> {
        return this.settingsMenuService.onUpdateOrder(body.data);
    }

    @ApiOperation({ summary: 'Получение списка пунктов меню' })
    @ApiResponse({ status: 200, type: ResponseSettingsMenuItemDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID меню' })
    @Get('list/:id')
    get(@Param() params): Promise<ResponseSettingsMenuItemDto> {
        return this.settingsMenuService.get(Number(params.id));
    }

    @ApiOperation({ summary: 'Получение пункта меню' })
    @ApiResponse({ status: 200, type: ResultSettingsMenuItemDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID меню' })
    @Get(':id')
    getOne(@Param() params): Promise<ResultSettingsMenuItemDto> {
        return this.settingsMenuService.getOne(Number(params.id));
    }

    @ApiOperation({ summary: 'Создание пункта меню' })
    @ApiResponse({ status: 201, type: ResultSettingsMenuItemDto })
    @Post()
    create(@Body() body: CreateSettingsMenuItemDto): Promise<ResultSettingsMenuItemDto> {
        return this.settingsMenuService.create(body);
    }

    @ApiOperation({ summary: 'Обновление пункта меню' })
    @ApiResponse({ status: 200, type: ResultSettingsMenuItemDto })
    @Patch()
    update(@Body() body: CreateSettingsMenuItemDto): Promise<ResultSettingsMenuItemDto> {
        return this.settingsMenuService.update(body);
    }

    @ApiOperation({ summary: 'Удаление пункта меню' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiParam({  name: 'id',  type: Number, required: true, description: 'ID страницы' })
    @Delete(':id')
    delete(@Param() params): Promise<ResultDto> {
        return this.settingsMenuService.delete(Number(params.id));
    }
}

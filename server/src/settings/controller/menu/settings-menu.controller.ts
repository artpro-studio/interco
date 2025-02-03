import { ApiTags, ApiOperation, ApiResponse, ApiParam, ApiQuery } from '@nestjs/swagger';
import { ApiExceptionDecorators } from 'src/decorators/exception-decorators';
import { Controller, UseGuards, Get, Post, Body, Patch, Delete, Param, Query } from '@nestjs/common';
import { JwtAuthGuardAdmin } from 'src/auth/jwt-auth-admin.guard';
import { BaseQuery, ResultDto } from 'src/dto/reponse.dto';
import { SettingsMenuService } from 'src/settings/service/menu/settings-menu.service';
import { ResponseListSettingsMenuDto, ResultSettingsMenuDto } from 'src/settings/dto/settings-menu/response-settings-menu.dto';
import { SettingsMenuDto } from 'src/settings/dto/settings-menu/settings-menu.dto';

@ApiTags('Настройки')
@ApiExceptionDecorators()
@UseGuards(JwtAuthGuardAdmin)
@Controller('settings-menu')
export class SettingsMenuController {
    constructor(private readonly settingsMenuService: SettingsMenuService) {}

    @ApiOperation({ summary: 'Удаление меню по ids' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiQuery({  name: 'ids',  type: Number, isArray: true, required: true, description: 'IDs меню' })
    @Delete('/delete-ids')
    deleteIds(@Query() query): Promise<ResultDto> {
        return this.settingsMenuService.deleteIds(query.ids);
    }

    @ApiOperation({ summary: 'Получение списка меню' })
    @ApiResponse({ status: 200, type: ResponseListSettingsMenuDto })
    @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
    @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
    @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
    @Get()
    get(@Query() query: BaseQuery): Promise<ResponseListSettingsMenuDto> {
        return this.settingsMenuService.get(query);
    }

    @ApiOperation({ summary: 'Получение меню' })
    @ApiResponse({ status: 200, type: ResultSettingsMenuDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID меню' })
    @Get(':id')
    getOne(@Param() params): Promise<ResultSettingsMenuDto> {
        return this.settingsMenuService.getOne(Number(params.id));
    }

    @ApiOperation({ summary: 'Создание меню' })
    @ApiResponse({ status: 201, type: ResultSettingsMenuDto })
    @Post()
    create(@Body() body: SettingsMenuDto): Promise<ResultSettingsMenuDto> {
        return this.settingsMenuService.create(body);
    }

    @ApiOperation({ summary: 'Обновление меню' })
    @ApiResponse({ status: 200, type: ResultSettingsMenuDto })
    @Patch()
    update(@Body() body: SettingsMenuDto): Promise<ResultSettingsMenuDto> {
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

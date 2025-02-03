import { Body, Controller, Get, Param, Patch, Post, Query, UseGuards } from "@nestjs/common";
import { ApiBearerAuth, ApiOperation, ApiParam, ApiQuery, ApiResponse, ApiTags } from "@nestjs/swagger";
import { ApiExceptionDecorators } from "src/decorators/exception-decorators";
import { SettingsContactsService } from "../service/settings-contacts.service";
import { SettingsContactsDto } from "../dto/settings-contacts.dto";
import { ResultDto } from "src/dto/reponse.dto";
import { JwtAuthGuardAdmin } from "src/auth/jwt-auth-admin.guard";
import { ResultSettingsContactsDto, ResultSettingsContactsListDto } from "../dto/response-settings-contacts.dto";

@ApiTags('Настройки')
@ApiExceptionDecorators()
@ApiBearerAuth()
@UseGuards(JwtAuthGuardAdmin)
@Controller('settings-contacts')
export class SettingsContactsController {
    constructor(private readonly settingsContactsService: SettingsContactsService) {}

    @ApiOperation({ summary: 'Создание контактов' })
    @ApiResponse({ status: 201, type: ResultSettingsContactsDto })
    @Post()
    create(@Body() body: SettingsContactsDto) {
        return this.settingsContactsService.create(body);
    }

    @ApiOperation({ summary: 'Обновление контактов' })
    @ApiResponse({ status: 200, type: ResultSettingsContactsDto })
    @Patch()
    update(@Body() body: SettingsContactsDto) {
        return this.settingsContactsService.update(body);
    }

    @ApiOperation({ summary: 'Получение найстрокий по id' })
    @ApiResponse({ status: 200, type: ResultSettingsContactsDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID пользователя' })
    @Get(':id')
    getOne(@Param() param: {id: number}) {
        return this.settingsContactsService.getOne(param.id);
    }

    @ApiOperation({ summary: 'Получение настроек' })
    @ApiResponse({ status: 200, type: ResultSettingsContactsListDto })
    @ApiQuery({ name: 'isPhone', type: Boolean, required: true, description: 'Телефон?'})
    @Get()
    get(@Query() query: {isPhone: boolean}) {
        return this.settingsContactsService.get(query.isPhone);
    }
}
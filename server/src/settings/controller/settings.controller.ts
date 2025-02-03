import { ResultDto } from './../../dto/reponse.dto';
import { SettingsService } from './../service/settings.service';
import { ApiExceptionDecorators } from './../../decorators/exception-decorators';
import { Body, Controller, Get, Patch, Post, UseGuards } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiResponse, ApiBearerAuth } from '@nestjs/swagger';
import { CreateSettingsDto, FullSettingsDto } from '../dto/settings.dto';
import { JwtAuthGuardAdmin } from 'src/auth/jwt-auth-admin.guard';
import { ResultSettingsDto } from '../dto/response-settings.dto';

@ApiTags('Настройки')
@ApiExceptionDecorators()
@Controller('settings')
export class SettingsController {
    constructor(private readonly settingsService: SettingsService) {}

    @ApiOperation({ summary: 'Есть ли настроки сайта' })
    @ApiResponse({ status: 200, type: ResultDto })
    @Get('is-active')
    isActive(): Promise<ResultDto> {
        return this.settingsService.isActive();
    }

    @ApiOperation({ summary: 'Создание настроек' })
    @ApiResponse({ status: 201, type: ResultDto })
    @Post()
    create(@Body() body: CreateSettingsDto): Promise<ResultDto> {
        return this.settingsService.create(body);
    }

    @ApiOperation({ summary: 'Обновление настроек' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiBearerAuth()
    @UseGuards(JwtAuthGuardAdmin)
    @Patch()
    update(@Body() body: FullSettingsDto): Promise<ResultDto> {
        return this.settingsService.update(body);
    }

    @ApiOperation({ summary: 'Получение настроек' })
    @ApiResponse({ status: 200, type: ResultSettingsDto })
    @ApiBearerAuth()
    @UseGuards(JwtAuthGuardAdmin)
    @Get()
    get(): Promise<ResultSettingsDto> {
        return this.settingsService.get();
    }
}
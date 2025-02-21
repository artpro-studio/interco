import { RecordsListDto, RecordsQuery, ResultRecordsCreateDto } from './../dto/records/response-records.dto';
import { Body, Controller, Delete, Get, Param, Patch, Post, Query, UseGuards } from '@nestjs/common';
import { ApiExceptionDecorators } from 'src/decorators/exception-decorators';
import { ApiBearerAuth, ApiOperation, ApiParam, ApiQuery, ApiResponse, ApiTags } from '@nestjs/swagger';
import { JwtAuthGuardAdmin } from 'src/auth/jwt-auth-admin.guard';
import { BaseQuery, ResultDto } from 'src/dto/reponse.dto';
import { RecordsService } from '../service/records.service';
import { ResultRecordsFullDto } from '../dto/records/response-records.dto';
import { CreateRecordsDto} from '../dto/records/create-records.dto';
import { ResultDropDownDto } from 'src/dto/response-drop-down.dto';
import { RecordsRepository } from '../repository/records.repository';

@ApiTags('Страницы')
@Controller('records')
@ApiExceptionDecorators()
@ApiBearerAuth()
@UseGuards(JwtAuthGuardAdmin)
export class RecordsController {
    constructor(
        private readonly recordsService: RecordsService,
        private readonly recordsRepository: RecordsRepository,
    ) {}

    @ApiOperation({ summary: 'Select список записей' })
    @ApiResponse({ status: 200, type: ResultDropDownDto })
    @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
    @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
    @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
    @Get('select')
    async getSelect(@Query() query: BaseQuery): Promise<ResultDropDownDto> {
        const result = await this.recordsRepository.getSelect(query)
        return {
        isSuccess: true,
        entity: {
            count: result.count,
            entity: result.entity
        }
    }
    }

    @ApiOperation({ summary: 'Получение записи' })
    @ApiResponse({ status: 200, type: ResultRecordsFullDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID записи' })
    @Get(':id')
    getOne(@Param() params): Promise<ResultRecordsFullDto> {
        return this.recordsService.getOne(Number(params.id));
    }

    @ApiOperation({ summary: 'Получение записи для создания и редактирования' })
    @ApiResponse({ status: 200, type: ResultRecordsCreateDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID записи' })
    @Get('get-create-or-update/:id')
    getCreateOrUpdate(@Param() params): Promise<ResultRecordsCreateDto> {
        return this.recordsService.getCreateOrUpdate(Number(params.id));
    }

    @ApiOperation({ summary: 'Удаление записей по ids' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiQuery({  name: 'ids',  type: Number, isArray: true, required: true, description: 'IDs записей' })
    @Delete('/delete-ids')
    async deleteIds(@Query() query: {ids: number[]}): Promise<ResultDto> {
        const status = await this.recordsRepository.deleteIds(query.ids)
        return {
            isSuccess: status,
            message: status
                ? 'Запись удалена'
                : 'Не удалось удалить запись',
        };
    }

    @ApiOperation({ summary: 'Список записей' })
    @ApiResponse({ status: 200, type: RecordsListDto })
    @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
    @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
    @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
    @ApiQuery({ name: 'id', type: Number, required: false, description: 'ID страницы'})
    @ApiQuery({ name: 'pages', type: Number, isArray: true, required: false, description: 'ids странииц'})
    @Get()
    get(@Query() body: RecordsQuery): Promise<RecordsListDto> {
        return this.recordsService.get(body);
    }

    @ApiOperation({ summary: 'Создание записи' })
    @ApiResponse({ status: 201, type: ResultRecordsCreateDto })
    @Post()
    create(@Body() body: CreateRecordsDto): Promise<ResultRecordsCreateDto> {
        return this.recordsService.create(body);
    }

    @ApiOperation({ summary: 'Обновление записи' })
    @ApiResponse({ status: 200, type: ResultRecordsCreateDto })
    @Patch()
    update(@Body() body: CreateRecordsDto): Promise<ResultRecordsCreateDto> {
        return this.recordsService.update(body);
    }

    @ApiOperation({ summary: 'Удаление записи' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiParam({  name: 'id',  type: Number, required: true, description: 'ID записи' })
    @Delete(':id')
    async delete(@Param() params): Promise<ResultDto> {
    const query = await this.recordsRepository.delete(params.id)
    return {
        isSuccess: query,
        message: query
            ? 'Запись удалена'
            : 'Не удалось удалить запись',
    };
    }
}

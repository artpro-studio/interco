import { Body, Controller, Delete, Get, Param, Patch, Post, Query, UseGuards } from "@nestjs/common";
import { ApiBearerAuth, ApiOperation, ApiParam, ApiQuery, ApiResponse, ApiTags } from "@nestjs/swagger";
import { JwtAuthGuardAdmin } from "src/auth/jwt-auth-admin.guard";
import { ApiExceptionDecorators } from "src/decorators/exception-decorators";
import { PagesIblockRecordsRepository } from "../repository/pages-iblock-records.repository";
import { PagesIblockRecordsListDto, PagesIblockRecordsPublicListDto, PagesIblockRecordsQuery, ResultPagesIblockRecordsDto, ResultPagesIblockRecordsPublicDto } from "../dto/iblock/records/response-iblock-records.dto";
import { PagesIblockRecordsDto } from "../dto/iblock/records/pages-iblock-records.dto";
import { ResultDto } from "src/dto/reponse.dto";
import { PagesIblockRecordsService } from "../service/pages-iblock-records.service";
import { CreatePagesIblockRecordDto } from "../dto/iblock/records/create-pages-iblock-records";

@ApiTags('Информационные блоки страницы')
@Controller('pages-iblock-records')
@ApiExceptionDecorators()
@ApiBearerAuth()
@UseGuards(JwtAuthGuardAdmin)
export class PagesIblockRecordsController {
    constructor(
        private readonly pagesIblockRecordsRepository: PagesIblockRecordsRepository,
        private readonly pagesIblockRecordsService: PagesIblockRecordsService,
    ) {}

    @ApiOperation({ summary: 'Одна запись' })
    @ApiResponse({ status: 200, type: ResultPagesIblockRecordsPublicDto })
    @ApiParam({  name: 'id',  type: Number, required: true, description: 'ID' })
    @Get(':id')
    async getOne(@Param() params): Promise<ResultPagesIblockRecordsPublicDto> {
        return this.pagesIblockRecordsService.getOne(params.id)
    }

    @ApiOperation({ summary: 'Список записей' })
    @ApiResponse({ status: 200, type: PagesIblockRecordsListDto })
    @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
    @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
    @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
    @ApiQuery({ name: 'iblockID', type: Number, required: true, description: 'ID iblock'})
    @Get()
    async get(@Query() query: PagesIblockRecordsQuery): Promise<PagesIblockRecordsPublicListDto> {
        return this.pagesIblockRecordsService.get(query);
    }

    @ApiOperation({ summary: 'Создание записи' })
    @ApiResponse({ status: 201, type: ResultPagesIblockRecordsPublicDto })
    @Post()
    async create(@Body() body: CreatePagesIblockRecordDto): Promise<ResultPagesIblockRecordsPublicDto> {
        return this.pagesIblockRecordsService.create(body)
    }

    @ApiOperation({ summary: 'Обновление записи' })
    @ApiResponse({ status: 200, type: ResultPagesIblockRecordsPublicDto })
    @Patch()
    async update(@Body() body: CreatePagesIblockRecordDto): Promise<ResultPagesIblockRecordsPublicDto> {
        return this.pagesIblockRecordsService.update(body)
    }

    @ApiOperation({ summary: 'Удаление записей по ids' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiQuery({  name: 'ids',  type: Number, isArray: true, required: true, description: 'IDs' })
    @Delete('/delete-ids')
    async deleteIds(@Query() query): Promise<ResultDto> {
        const result = await this.pagesIblockRecordsRepository.deleteIds(query.ids);
        return {
            isSuccess: result,
        }
    }
    @ApiOperation({ summary: 'Удаление записи' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiParam({  name: 'id',  type: Number, required: true, description: 'ID' })
    @Delete(':id')
    async delete(@Param() params): Promise<ResultDto> {
        const result = await this.pagesIblockRecordsRepository.delete(Number(params.id));

        return {
            isSuccess: result
        }
    }
}

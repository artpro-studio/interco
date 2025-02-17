import { Body, Controller, Delete, Get, Param, Patch, Post, Query, UseGuards } from "@nestjs/common";
import { ApiBearerAuth, ApiOperation, ApiParam, ApiQuery, ApiResponse, ApiTags } from "@nestjs/swagger";
import { JwtAuthGuardAdmin } from "src/auth/jwt-auth-admin.guard";
import { ApiExceptionDecorators } from "src/decorators/exception-decorators";
import { PagesIblockRepository } from "../repository/pages-iblock.repository";
import { BaseQuery, ResultDto } from "src/dto/reponse.dto";
import { PagesIblockDto } from "../dto/iblock/pages-iblock.dto";
import { PagesIblockListDto, PagesIblockQuery, ResultPagesIblockDto } from "../dto/iblock/response-iblock.dto";
import { PagesIblockService } from '../service/pages-iblock.service';
import { PagesIblockFieldsRepository } from "../repository/pages-iblock-fields.repository";
import { PagesIblockFieldsListDto, PagesIblockFieldsQuery } from "../dto/iblock/fields/response-pages-iblock-fields.dto";
import { PagesIblockSectionRepository } from '../repository/pages-iblock-section.repository';
import { ResultPagesIblockSectionDto } from "../dto/iblock/section/response-iblock-section.dto";

@ApiTags('Информационные блоки страницы')
@Controller('pages-iblock')
@ApiExceptionDecorators()
@ApiBearerAuth()
@UseGuards(JwtAuthGuardAdmin)
export class PagesIblockController {
    constructor(
        private readonly pagesIblockRepository: PagesIblockRepository,
        private readonly pagesIblockFieldsRepository: PagesIblockFieldsRepository,
        private readonly pagesIblockService: PagesIblockService,
        private readonly pagesIblockSectionRepository: PagesIblockSectionRepository,
    ) {}

    @ApiOperation({ summary: 'Разделы у iblock' })
    @ApiResponse({ status: 200, type: ResultPagesIblockSectionDto })
    @ApiQuery({ name: 'iblockID', type: Number, required: true, description: 'ID iblock'})
    @Get('sections')
    async getSections(@Query() query: {iblockID: number}): Promise<ResultPagesIblockSectionDto> {
        return {
            isSuccess: true,
            entity: await this.pagesIblockSectionRepository.getForIblock(query.iblockID)
        };
    }

    @ApiOperation({ summary: 'Список полей у iblock' })
    @ApiResponse({ status: 200, type: PagesIblockFieldsListDto })
    @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
    @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
    @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
    @ApiQuery({ name: 'iblockID', type: Number, required: true, description: 'ID iblock'})
    @Get('fields')
    async getFields(@Query() query: PagesIblockFieldsQuery): Promise<PagesIblockFieldsListDto> {
        return {
            isSuccess: true,
            entity: await this.pagesIblockFieldsRepository.get(query)
        };
    }

    @ApiOperation({ summary: 'Список' })
    @ApiResponse({ status: 200, type: ResultPagesIblockDto })
    @ApiParam({  name: 'id',  type: Number, required: true, description: 'ID' })
    @Get(':id')
    async getOne(@Param() params): Promise<ResultPagesIblockDto> {
        return {
            isSuccess: true,
            entity: await this.pagesIblockRepository.getOne(Number(params.id))
        };
    }

    @ApiOperation({ summary: 'Список' })
    @ApiResponse({ status: 200, type: PagesIblockListDto })
    @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
    @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
    @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
    @ApiQuery({ name: 'pageID', type: Number, required: true, description: 'ID страницы'})
    @Get()
    async get(@Query() query: PagesIblockQuery): Promise<PagesIblockListDto> {
        return {
            isSuccess: true,
            entity: await this.pagesIblockRepository.get(query)
        };
    }

    @ApiOperation({ summary: 'Создание' })
    @ApiResponse({ status: 201, type: ResultPagesIblockDto })
    @Post()
    async create(@Body() body: PagesIblockDto): Promise<ResultPagesIblockDto> {
        return this.pagesIblockService.create(body);
    }

    @ApiOperation({ summary: 'Обновление' })
    @ApiResponse({ status: 200, type: ResultPagesIblockDto })
    @Patch()
    async update(@Body() body: PagesIblockDto): Promise<ResultPagesIblockDto> {
        return this.pagesIblockService.update(body);
    }

    @ApiOperation({ summary: 'Удаление по ids' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiQuery({  name: 'ids',  type: Number, isArray: true, required: true, description: 'IDs' })
    @Delete('/delete-ids')
    async deleteIds(@Query() query): Promise<ResultDto> {
        const result = await this.pagesIblockRepository.deleteIds(query.ids);
        return {
            isSuccess: result,
        }
    }
    @ApiOperation({ summary: 'Удаление' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiParam({  name: 'id',  type: Number, required: true, description: 'ID' })
    @Delete(':id')
    async delete(@Param() params): Promise<ResultDto> {
        const result = await this.pagesIblockRepository.delete(Number(params.id));

        return {
            isSuccess: result
        }
    }
}

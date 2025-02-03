import { Body, Controller, Delete, Get, Param, Patch, Post, Query, UseGuards } from "@nestjs/common";
import { ApiBearerAuth, ApiOperation, ApiParam, ApiQuery, ApiResponse, ApiTags } from "@nestjs/swagger";
import { JwtAuthGuardAdmin } from "src/auth/jwt-auth-admin.guard";
import { ApiExceptionDecorators } from "src/decorators/exception-decorators";
import { PagesParamsRepository } from "../repository/pages-params.repository";
import { BaseQuery, ResultDto } from "src/dto/reponse.dto";
import { PagesParamsListDto, ResultPagesParamsDto } from "../dto/pages-params/response-pages-params.dto";
import { PagesParamsService } from "../service/pages-params.service";
import { CreatePagesParamsDto } from '../dto/pages-params/pages-params.dto';

@ApiTags('Страницы')
@Controller('pages-params')
@ApiExceptionDecorators()
@ApiBearerAuth()
@UseGuards(JwtAuthGuardAdmin)
export class PagesParamsController {
    constructor(
        private readonly pagesParamsRepository: PagesParamsRepository,
        private readonly pagesParamsService: PagesParamsService,
    ) {}

    @ApiOperation({ summary: 'Список парамметров' })
    @ApiResponse({ status: 200, type: PagesParamsListDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID страницы' })
    @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
    @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
    @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
    @Get('/list/:id')
    async get(@Query() query: BaseQuery, @Param() params: {id: number}): Promise<PagesParamsListDto> {
        const { count, entity } = await this.pagesParamsRepository.get(params.id, query);
        return {
            isSuccess: true,
            entity: {
                count,
                entity
            }
        }
    }

    @ApiOperation({ summary: 'Получение парамметра' })
    @ApiResponse({ status: 200, type: ResultPagesParamsDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID справчоника' })
    @Get(':id')
    async getOne(@Param() params): Promise<ResultPagesParamsDto> {
        const entity = await this.pagesParamsRepository.getOneForID(Number(params.id))
        return {
            isSuccess: true,
            entity
        }
    }

    @ApiOperation({ summary: 'Создание парамметра' })
    @ApiResponse({ status: 201, type: ResultPagesParamsDto })
    @Post()
    async create(@Body() body: CreatePagesParamsDto): Promise<ResultPagesParamsDto> {
        return this.pagesParamsService.create(body)
    }

    @ApiOperation({ summary: 'Обновление парамметра' })
    @ApiResponse({ status: 200, type: ResultPagesParamsDto })
    @Patch()
    async update(@Body() body: CreatePagesParamsDto): Promise<ResultPagesParamsDto> {
        return this.pagesParamsService.update(body)
    }

    @ApiOperation({ summary: 'Удаление парамметров справочника по ids' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiQuery({  name: 'ids',  type: Number, isArray: true, required: true, description: 'IDs парамметров' })
    @Delete('/delete-ids')
    async deleteIds(@Query() query: {ids: number[]}): Promise<ResultDto> {
        const result = await this.pagesParamsRepository.deleteIds(query.ids);

        return {
            isSuccess: result,
            message: result
                ? 'Парамметры удалены'
                : 'Не удалось удалить справочники',
            };
    }

    @ApiOperation({ summary: 'Удаление парамметров' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiParam({  name: 'id',  type: Number, required: true, description: 'ID парамметра' })
    @Delete(':id')
    async delete(@Param() params): Promise<ResultDto> {
        const query =  await this.pagesParamsRepository.delete(params.id)

        return {
            isSuccess: query,
            message: query
                ? 'Парамметр удалена'
                : 'Не удалось удалить справочник',
        };
    }
}

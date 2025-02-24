import { Body, Controller, Delete, Get, Param, Patch, Post, Query, UseGuards } from "@nestjs/common";
import { ApiBearerAuth, ApiOperation, ApiParam, ApiQuery, ApiResponse, ApiTags } from "@nestjs/swagger";
import { JwtAuthGuardAdmin } from "src/auth/jwt-auth-admin.guard";
import { ApiExceptionDecorators } from "src/decorators/exception-decorators";
import { PagesSectionsService } from "../service/pages-sections.service";
import { PagesSectionsRepository } from "../repository/pages-sections.repository";
import { PagesSectionsListDto, PagesSectionsQuery, ResultPagesSectionsDto } from "../dto/pages-sections/response-pages-sections.dto";
import { ResultDto } from "src/dto/reponse.dto";
import { PagesSectionsDto } from "../dto/pages-sections/pages-sections.dto";

@ApiTags('Страницы')
@Controller('pages-sections')
@ApiExceptionDecorators()
@ApiBearerAuth()
@UseGuards(JwtAuthGuardAdmin)
export class PagesSectionsController {
    constructor(
        private readonly pagesSectionsRepository: PagesSectionsRepository,
        private readonly pagesSectionsService: PagesSectionsService,
    ) {}

    @ApiOperation({ summary: 'Получение раздела' })
    @ApiResponse({ status: 200, type: ResultPagesSectionsDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID раздела' })
    @Get(':id')
    async getOne(@Param() params): Promise<ResultPagesSectionsDto> {
        return {
            isSuccess: true,
            entity: await this.pagesSectionsRepository.getOne(Number(params.id))
        };
    }

    @ApiOperation({ summary: 'Удаление разделов по ids' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiQuery({  name: 'ids',  type: Number, isArray: true, required: true, description: 'IDs страниц' })
    @Delete('/delete-ids')
    async deleteIds(@Query() query): Promise<ResultDto> {
        const result =  await this.pagesSectionsRepository.deleteIds(query.ids);
        return {
            isSuccess: !!result
        };
    }

    @ApiOperation({ summary: 'Создание раздела' })
    @ApiResponse({ status: 201, type: ResultPagesSectionsDto })
    @Post()
    create(@Body() body: PagesSectionsDto): Promise<ResultPagesSectionsDto> {
        return this.pagesSectionsService.create(body);
    }

    @ApiOperation({ summary: 'Обновление раздела' })
    @ApiResponse({ status: 200, type: ResultPagesSectionsDto })
    @Patch()
    update(@Body() body: PagesSectionsDto): Promise<ResultPagesSectionsDto> {
        return this.pagesSectionsService.update(body);
    }

    @ApiOperation({ summary: 'Список разделов' })
    @ApiResponse({ status: 200, type: PagesSectionsListDto })
    @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
    @ApiQuery({name: 'pages', type: Number, required: true, description: 'ID страницы' })
    @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
    @Get()
    async get(@Query() query: PagesSectionsQuery): Promise<PagesSectionsListDto> {
        const result = await this.pagesSectionsRepository.get(query);
        return {
            isSuccess: true,
            entity: {
                ...result
            }
        };
    }

    @ApiOperation({ summary: 'Удаление раздела' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiParam({  name: 'id',  type: Number, required: true, description: 'ID раздела' })
    @Delete(':id')
    async delete(@Param() params): Promise<ResultDto> {
        const result = await this.pagesSectionsRepository.delete(Number(params.id))
        return {
            isSuccess: !!result
        }
    }
}

import { Controller, Post, Body, Patch, Delete, Param, Get, Query, UseGuards } from '@nestjs/common';
import { ApiOperation, ApiResponse, ApiParam, ApiQuery, ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { ReferenceBookListDto, ResultReferenceBookDto } from '../dto/reference-book/response-reference-book.dto';
import { ReferenceBookDto } from '../dto/reference-book/reference-book.dto';
import { ReferenceBookRepository } from '../repository/reference-book-repository';
import { BaseQuery, ResultDto } from 'src/dto/reponse.dto';
import { ApiExceptionDecorators } from 'src/decorators/exception-decorators';
import { JwtAuthGuardAdmin } from 'src/auth/jwt-auth-admin.guard';

@ApiTags('Справочник')
@ApiExceptionDecorators()
@ApiBearerAuth()
@UseGuards(JwtAuthGuardAdmin)
@Controller('reference-book')
export class ReferenceBookController {
    constructor(
        private readonly referenceBookRepository: ReferenceBookRepository
    ) {}

    @ApiOperation({ summary: 'Список справочников' })
    @ApiResponse({ status: 200, type: ReferenceBookListDto })
    @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
    @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
    @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
    @Get()
    async get(@Query() query: BaseQuery): Promise<ReferenceBookListDto> {
        const { count, entity } = await this.referenceBookRepository.get(query);
        return {
            isSuccess: true,
            entity: {
                count,
                entity
            }
        }
    }

    @ApiOperation({ summary: 'Получение справочника' })
    @ApiResponse({ status: 200, type: ResultReferenceBookDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID справчоника' })
    @Get(':id')
    async getOne(@Param() params): Promise<ResultReferenceBookDto> {
        const entity = await this.referenceBookRepository.getOneForID(Number(params.id))
        return {
            isSuccess: true,
            entity
        }
    }

    @ApiOperation({ summary: 'Создание справочника' })
    @ApiResponse({ status: 201, type: ResultReferenceBookDto })
    @Post()
    async create(@Body() body: ReferenceBookDto): Promise<ResultReferenceBookDto> {
        const entity = await this.referenceBookRepository.create(body)
        return {
            isSuccess: true,
            entity
        };
    }

    @ApiOperation({ summary: 'Обновление справчоника' })
    @ApiResponse({ status: 200, type: ResultReferenceBookDto })
    @Patch()
    async update(@Body() body: ReferenceBookDto): Promise<ResultReferenceBookDto> {
        const entity = await this.referenceBookRepository.create(body)
        return {
            isSuccess: true,
            entity
        };
    }

    @ApiOperation({ summary: 'Удаление справочников по ids' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiQuery({  name: 'ids',  type: Number, isArray: true, required: true, description: 'IDs страниц' })
    @Delete('/delete-ids')
    async deleteIds(@Query() query: {ids: number[]}): Promise<ResultDto> {
        const result = await this.referenceBookRepository.deleteIds(query.ids);

        return {
            isSuccess: result,
            message: result
                ? 'Cправочники удалены'
                : 'Не удалось удалить справочники',
            };
    }

    @ApiOperation({ summary: 'Удаление справочника' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiParam({  name: 'id',  type: Number, required: true, description: 'ID страницы' })
    @Delete(':id')
    async delete(@Param() params): Promise<ResultDto> {
        const query =  await this.referenceBookRepository.delete(params.id)

        return {
            isSuccess: query,
            message: query
                ? 'Cправочник удалена'
                : 'Не удалось удалить справочник',
        };
    }

}

import { Controller, Post, Body, Patch, Delete, Param, Get, Query, UseGuards } from '@nestjs/common';
import { ApiOperation, ApiResponse, ApiParam, ApiQuery, ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { ReferenceBookDto } from '../dto/reference-book/reference-book.dto';
import { BaseQuery, ResultDto } from 'src/dto/reponse.dto';
import { ApiExceptionDecorators } from 'src/decorators/exception-decorators';
import { JwtAuthGuardAdmin } from 'src/auth/jwt-auth-admin.guard';
import { ReferenceBookAttributesRepository } from '../repository/reference-book-attributes.repository';
import { ReferenceBookAttributesListDto, ResultReferenceBookAttributesDto } from '../dto/reference-book-attributes/response-reference-book-attributes.dto';
import { ReferenceBookAttributesService } from '../service/reference-book-attributes.service';
import { CreateReferenceBookAttributesDto } from '../dto/reference-book-attributes/reference-book-attributes.dto';

@ApiTags('Справочник')
@ApiExceptionDecorators()
@ApiBearerAuth()
@UseGuards(JwtAuthGuardAdmin)
@Controller('reference-book-attribute')
export class ReferenceBookAttributeController {
    constructor(
        private readonly referenceBookAttributesRepository: ReferenceBookAttributesRepository,
        private readonly referenceBookAttributesService: ReferenceBookAttributesService,
    ) {}

    @ApiOperation({ summary: 'Список атрибутов справочника' })
    @ApiResponse({ status: 200, type: ReferenceBookAttributesListDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID справчоника' })
    @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
    @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
    @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
    @Get('/list/:id')
    async get(@Query() query: BaseQuery, @Param() params: {id: number}): Promise<ReferenceBookAttributesListDto> {
        const { count, entity } = await this.referenceBookAttributesRepository.get(params.id, query);
        return {
            isSuccess: true,
            entity: {
                count,
                entity
            }
        }
    }

    @ApiOperation({ summary: 'Получение атрибута справчоника' })
    @ApiResponse({ status: 200, type: ResultReferenceBookAttributesDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID справчоника' })
    @Get(':id')
    async getOne(@Param() params): Promise<ResultReferenceBookAttributesDto> {
        const entity = await this.referenceBookAttributesRepository.getOneForID(Number(params.id))
        return {
            isSuccess: true,
            entity
        }
    }

    @ApiOperation({ summary: 'Создание атрибута справочинка' })
    @ApiResponse({ status: 201, type: ResultReferenceBookAttributesDto })
    @Post()
    async create(@Body() body: CreateReferenceBookAttributesDto): Promise<ResultReferenceBookAttributesDto> {
        return this.referenceBookAttributesService.create(body)
    }

    @ApiOperation({ summary: 'Обновление атрибута справочинка' })
    @ApiResponse({ status: 200, type: ResultReferenceBookAttributesDto })
    @Patch()
    async update(@Body() body: CreateReferenceBookAttributesDto): Promise<ResultReferenceBookAttributesDto> {
        return this.referenceBookAttributesService.update(body)
    }

    @ApiOperation({ summary: 'Удаление атрибутов справочника по ids' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiQuery({  name: 'ids',  type: Number, isArray: true, required: true, description: 'IDs атрибутов' })
    @Delete('/delete-ids')
    async deleteIds(@Query() query: {ids: number[]}): Promise<ResultDto> {
        const result = await this.referenceBookAttributesRepository.deleteIds(query.ids);

        return {
            isSuccess: result,
            message: result
                ? 'Cправочники удалены'
                : 'Не удалось удалить справочники',
            };
    }

    @ApiOperation({ summary: 'Удаление атрибута справочника' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiParam({  name: 'id',  type: Number, required: true, description: 'ID атрибута' })
    @Delete(':id')
    async delete(@Param() params): Promise<ResultDto> {
        const query =  await this.referenceBookAttributesRepository.delete(params.id)

        return {
            isSuccess: query,
            message: query
                ? 'Cправочник удалена'
                : 'Не удалось удалить справочник',
        };
    }

}

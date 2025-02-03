import { Controller, UseGuards, Query, Get, Param, Post, Body, Delete, Patch } from '@nestjs/common';
import { ApiTags, ApiBearerAuth, ApiOperation, ApiResponse, ApiQuery, ApiParam } from '@nestjs/swagger';
import { ApiExceptionDecorators } from 'src/decorators/exception-decorators';
import { JwtAuthGuardAdmin } from 'src/auth/jwt-auth-admin.guard';
import { BaseQuery, ResultDto } from 'src/dto/reponse.dto';
import { AmoCustomRepository } from '../repository/amo-custom-fields.repository';
import { AmoCustmoFieldsListDto, ResultAmoCustmoFieldstDto } from '../dto/amo/response-amo-custom-fields.dto';
import { AmoCustmoFieldsDto } from '../dto/amo/amo-custom-fields.dto';

@ApiTags('Формы заявок (callback)')
@ApiExceptionDecorators()
@ApiBearerAuth()
@UseGuards(JwtAuthGuardAdmin)
@Controller('amo-custom-fields')
export class AmoCustomFieldsController {
    constructor(private readonly amoCustomRepository: AmoCustomRepository) {}

    @ApiOperation({ summary: 'Список кастомных полей' })
    @ApiResponse({ status: 200, type: AmoCustmoFieldsListDto })
    @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
    @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
    @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
    @Get()
    async get(@Query() query: BaseQuery): Promise<AmoCustmoFieldsListDto> {
        const { count, entity } = await this.amoCustomRepository.get(query);
        return {
            isSuccess: true,
            entity: {
                count,
                entity
            }
        }
    }

    @ApiOperation({ summary: 'Получение кастомного поля' })
    @ApiResponse({ status: 200, type: ResultAmoCustmoFieldstDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID' })
    @Get(':id')
    async getOne(@Param() params): Promise<ResultAmoCustmoFieldstDto> {
        const entity = await this.amoCustomRepository.getOneForID(Number(params.id))
        return {
            isSuccess: true,
            entity
        }
    }

    @ApiOperation({ summary: 'Создание кастомного поля' })
    @ApiResponse({ status: 201, type: ResultAmoCustmoFieldstDto })
    @Post()
    async create(@Body() body: AmoCustmoFieldsDto): Promise<ResultAmoCustmoFieldstDto> {
        const entity = await this.amoCustomRepository.create(body)
        return {
            isSuccess: !!entity,
            entity,
            message: !entity ? 'Такаое поле уже существует' : undefined
        };
    }

    @ApiOperation({ summary: 'Обновление кастомного поля' })
    @ApiResponse({ status: 200, type: ResultAmoCustmoFieldstDto })
    @Patch()
    async update(@Body() body: AmoCustmoFieldsDto): Promise<ResultAmoCustmoFieldstDto> {
        const entity = await this.amoCustomRepository.update(body)
        return {
            isSuccess: !!entity,
            entity,
            message: !entity ? 'Такаое поле уже существует' : ''
        };
    }

    @ApiOperation({ summary: 'Удаление кастомного поля по ids' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiQuery({  name: 'ids',  type: Number, isArray: true, required: true, description: 'IDs' })
    @Delete('/delete-ids')
    async deleteIds(@Query() query: {ids: number[]}): Promise<ResultDto> {
        const result = await this.amoCustomRepository.deleteIds(query.ids);

        return {
            isSuccess: result,
            message: result
                ? 'Поля удалены'
                : 'Не удалось удалить поля',
            };
    }

    @ApiOperation({ summary: 'Удаление кастомного поля' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiParam({  name: 'id',  type: Number, required: true, description: 'ID' })
    @Delete(':id')
    async delete(@Param() params): Promise<ResultDto> {
        const query =  await this.amoCustomRepository.delete(params.id)

        return {
            isSuccess: query,
            message: query
                ? 'Поле удалено'
                : 'Не удалось удалить поле',
        };
    }

}

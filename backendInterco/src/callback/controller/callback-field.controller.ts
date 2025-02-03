import { ApiTags, ApiBearerAuth, ApiOperation, ApiResponse, ApiParam, ApiQuery } from '@nestjs/swagger';
import { ApiExceptionDecorators } from 'src/decorators/exception-decorators';
import { UseGuards, Controller, Delete, Param, Query, Patch, Post, Get, Body } from '@nestjs/common';
import { JwtAuthGuardAdmin } from 'src/auth/jwt-auth-admin.guard';
import { CallbackFieldRepository } from '../repository/callback-field.repository';
import { BaseQuery, ResultDto } from 'src/dto/reponse.dto';
import { CreateCallbackFieldDto } from '../dto/callback-field/callback-field.dto';
import { CallbackFieldListDto, ResultCallbackFieldDto } from '../dto/callback-field/response-callback-field.dto';
import { CallbackFieldService } from '../service/callback-field.service';

@ApiTags('Формы заявок (callback)')
@ApiExceptionDecorators()
@ApiBearerAuth()
@UseGuards(JwtAuthGuardAdmin)
@Controller('callback-field')
export class CallbackFieldController {
    constructor(
        private readonly callbackFieldRepository: CallbackFieldRepository,
        private readonly callbackFieldService: CallbackFieldService
    ) {}

    @ApiOperation({ summary: 'Список полей форсы' })
    @ApiResponse({ status: 200, type: CallbackFieldListDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID формы' })
    @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
    @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
    @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
    @Get('/list/:id')
    async get(@Query() query: BaseQuery, @Param() params: {id: number}): Promise<CallbackFieldListDto> {
        const { count, entity } = await this.callbackFieldRepository.get(params.id, query);
        return {
            isSuccess: true,
            entity: {
                count,
                entity
            }
        }
    }

    @ApiOperation({ summary: 'Получение поля' })
    @ApiResponse({ status: 200, type: ResultCallbackFieldDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID поля' })
    @Get(':id')
    async getOne(@Param() params): Promise<ResultCallbackFieldDto> {
        const entity = await this.callbackFieldRepository.getOneForID(Number(params.id))
        return {
            isSuccess: true,
            entity
        }
    }

    @ApiOperation({ summary: 'Создание поля формы' })
    @ApiResponse({ status: 201, type: ResultCallbackFieldDto })
    @Post()
    async create(@Body() body: CreateCallbackFieldDto): Promise<ResultCallbackFieldDto> {
        return this.callbackFieldService.create(body)
    }

    @ApiOperation({ summary: 'Обновление поля формы' })
    @ApiResponse({ status: 200, type: ResultCallbackFieldDto })
    @Patch()
    async update(@Body() body: CreateCallbackFieldDto): Promise<ResultCallbackFieldDto> {
        return this.callbackFieldService.update(body)
    }

    @ApiOperation({ summary: 'Удаление атрибутов справочника по ids' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiQuery({  name: 'ids',  type: Number, isArray: true, required: true, description: 'IDs полей' })
    @Delete('/delete-ids')
    async deleteIds(@Query() query: {ids: number[]}): Promise<ResultDto> {
        const result = await this.callbackFieldRepository.deleteIds(query.ids);

        return {
            isSuccess: result,
            message: result
                ? 'Поля удалены'
                : 'Не удалось удалить поля',
            };
    }

    @ApiOperation({ summary: 'Удаление поля формы' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiParam({  name: 'id',  type: Number, required: true, description: 'ID формы' })
    @Delete(':id')
    async delete(@Param() params): Promise<ResultDto> {
        const query =  await this.callbackFieldRepository.delete(params.id)

        return {
            isSuccess: query,
            message: query
                ? 'Поле удалено'
                : 'Не удалось удалить поле',
        };
    }
}

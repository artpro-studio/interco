import { Controller, UseGuards, Query, Get, Param, Post, Body, Delete, Patch } from '@nestjs/common';
import { ApiTags, ApiBearerAuth, ApiOperation, ApiResponse, ApiQuery, ApiParam } from '@nestjs/swagger';
import { ApiExceptionDecorators } from 'src/decorators/exception-decorators';
import { JwtAuthGuardAdmin } from 'src/auth/jwt-auth-admin.guard';
import { CallbackRepository } from '../repository/callback.repository';
import { BaseQuery, ResultDto } from 'src/dto/reponse.dto';
import { CallbackListDto, ResultCallbackDto } from '../dto/callback/response-callback.dto';
import { CallbackDto } from '../dto/callback/callback.dto';

@ApiTags('Формы заявок (callback)')
@ApiExceptionDecorators()
@ApiBearerAuth()
@UseGuards(JwtAuthGuardAdmin)
@Controller('callback')
export class CallbackController {
    constructor(private readonly callbackRepository: CallbackRepository) {}

    @ApiOperation({ summary: 'Список форм заявок' })
    @ApiResponse({ status: 200, type: CallbackListDto })
    @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
    @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
    @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
    @Get()
    async get(@Query() query: BaseQuery): Promise<CallbackListDto> {
        const { count, entity } = await this.callbackRepository.get(query);
        return {
            isSuccess: true,
            entity: {
                count,
                entity
            }
        }
    }

    @ApiOperation({ summary: 'Получение формы' })
    @ApiResponse({ status: 200, type: ResultCallbackDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID формы' })
    @Get(':id')
    async getOne(@Param() params): Promise<ResultCallbackDto> {
        const entity = await this.callbackRepository.getOneForID(Number(params.id))
        return {
            isSuccess: true,
            entity
        }
    }

    @ApiOperation({ summary: 'Создание формы' })
    @ApiResponse({ status: 201, type: ResultCallbackDto })
    @Post()
    async create(@Body() body: CallbackDto): Promise<ResultCallbackDto> {
        const entity = await this.callbackRepository.create(body)
        return {
            isSuccess: true,
            entity
        };
    }

    @ApiOperation({ summary: 'Обновление формы' })
    @ApiResponse({ status: 200, type: ResultCallbackDto })
    @Patch()
    async update(@Body() body: CallbackDto): Promise<ResultCallbackDto> {
        const entity = await this.callbackRepository.create(body)
        return {
            isSuccess: true,
            entity
        };
    }

    @ApiOperation({ summary: 'Удаление формы по ids' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiQuery({  name: 'ids',  type: Number, isArray: true, required: true, description: 'IDs формы' })
    @Delete('/delete-ids')
    async deleteIds(@Query() query: {ids: number[]}): Promise<ResultDto> {
        const result = await this.callbackRepository.deleteIds(query.ids);

        return {
            isSuccess: result,
            message: result
                ? 'Формы удалены'
                : 'Не удалось удалить формы',
            };
    }

    @ApiOperation({ summary: 'Удаление формы' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiParam({  name: 'id',  type: Number, required: true, description: 'ID формы' })
    @Delete(':id')
    async delete(@Param() params): Promise<ResultDto> {
        const query =  await this.callbackRepository.delete(params.id)

        return {
            isSuccess: query,
            message: query
                ? 'Форма удалена'
                : 'Не удалось удалить форму',
        };
    }

}

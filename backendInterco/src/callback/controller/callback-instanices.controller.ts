import { ApiTags, ApiBearerAuth, ApiParam, ApiOperation, ApiResponse, ApiQuery } from '@nestjs/swagger';
import { ApiExceptionDecorators } from 'src/decorators/exception-decorators';
import { UseGuards, Controller, Get, Post, Body, Param, Query, Patch, Delete } from '@nestjs/common';
import { JwtAuthGuardAdmin } from 'src/auth/jwt-auth-admin.guard';
import { BaseQuery, ResultDto } from 'src/dto/reponse.dto';
import { CallbackInstancesService } from '../service/callback-instances.service';
import { CreateCallbackInstancesDto } from '../dto/callback-instances/callback-instances.dto';
import { CallbackInstancesListBaseDto, ResultCallbackInstancesBaseDto } from '../dto/callback-instances/response-callback-instances.dto';

@ApiTags('Формы заявок (callback)')
@ApiExceptionDecorators()
@ApiBearerAuth()
@UseGuards(JwtAuthGuardAdmin)
@Controller('callback-instances')
export class CallbackInstancesController {
    constructor(
        private readonly callbackInstancesService: CallbackInstancesService,
    ) {}

    @ApiOperation({ summary: 'Запись справочника' })
    @ApiResponse({ status: 200, type: ResultCallbackInstancesBaseDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID записи' })
    @Get('one/:id')
    async getOne(@Param() params: {id: number}): Promise<ResultCallbackInstancesBaseDto> {
        return this.callbackInstancesService.getOneForID(Number(params.id));
    }

    @ApiOperation({ summary: 'Список записей справочника' })
    @ApiResponse({ status: 200, type: CallbackInstancesListBaseDto })
    @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
    @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
    @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID справчоника' })
    @Get(':id')
    async get(@Param() params: {id: number}, @Query() query: BaseQuery): Promise<CallbackInstancesListBaseDto> {
        return this.callbackInstancesService.get(params.id, query);
    }

    @ApiOperation({ summary: 'Создание записей справочника' })
    @ApiResponse({ status: 201, type: ResultCallbackInstancesBaseDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID формы' })
    @Post(':id')
    create(@Param() params: {id: number}, @Body() body: CreateCallbackInstancesDto) {
        return this.callbackInstancesService.create(params.id, body);
    }

    @ApiOperation({ summary: 'Обуновление записи справочника' })
    @ApiResponse({ status: 200, type: ResultCallbackInstancesBaseDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID записи' })
    @Patch(':id')
    update(@Param() params: {id: number}, @Body() body: CreateCallbackInstancesDto) {
        return this.callbackInstancesService.update(params.id, body);
    }

    @ApiOperation({ summary: 'Удаление записей по ids' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiQuery({  name: 'ids',  type: Number, isArray: true, required: true, description: 'IDs записей' })
    @UseGuards(JwtAuthGuardAdmin)
    @Delete('/delete-ids')
    deleteIds(@Query() query): Promise<ResultDto> {
      return this.callbackInstancesService.deleteIds(query.ids.map((el) => Number(el)));
    }

    @ApiOperation({ summary: 'Удаление записи справочника' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiParam({  name: 'id',  type: Number, required: true, description: 'ID записи' })
    @Delete(':id')
    delete(@Param() params): Promise<ResultDto> {
        return this.callbackInstancesService.delete(Number(params.id));
    }
}

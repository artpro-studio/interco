import { ApiTags, ApiBearerAuth, ApiParam, ApiOperation, ApiResponse, ApiQuery } from '@nestjs/swagger';
import { ApiExceptionDecorators } from 'src/decorators/exception-decorators';
import { UseGuards, Controller, Get, Post, Body, Param, Query, Patch, Delete } from '@nestjs/common';
import { JwtAuthGuardAdmin } from 'src/auth/jwt-auth-admin.guard';
import { ReferenceBookInstancesService } from '../service/reference-book-instances.service';
import { ResponseBookAttributesListDto, ResultReferenceBookInstanceBaseDto, ResultReferenceBookInstancesDto } from '../dto/reference-book-instances/response-reference-book-instances.dto';
import { BaseQuery, ResultDto } from 'src/dto/reponse.dto';
import { CreateReferenceBookInstancesDto } from '../dto/reference-book-instances/reference-book-instances.dto';
import { ReferenceBookInstancesRepository } from '../repository/reference-book-instances.repository';

@ApiTags('Справочник')
@ApiExceptionDecorators()
@ApiBearerAuth()
@UseGuards(JwtAuthGuardAdmin)
@Controller('reference-book-instances')
export class ReferenceBookInstancesController {
    constructor(
        private readonly referenceBookInstancesService: ReferenceBookInstancesService,
    ) {}

    @ApiOperation({ summary: 'Список записей справочника' })
    @ApiResponse({ status: 200, type: ResponseBookAttributesListDto })
    @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
    @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
    @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID справчоника' })
    @Get(':id')
    async get(@Param() params: {id: number}, @Query() query: BaseQuery): Promise<ResponseBookAttributesListDto> {
        return this.referenceBookInstancesService.get(params.id, query);
    }

    @ApiOperation({ summary: 'Запись справочника' })
    @ApiResponse({ status: 200, type: ResultReferenceBookInstanceBaseDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID записи' })
    @Get('one/:id')
    async getOne(@Param() params: {id: number}): Promise<ResultReferenceBookInstanceBaseDto> {
        return this.referenceBookInstancesService.getOneForID(Number(params.id));
    }

    @ApiOperation({ summary: 'Создание записей справочника' })
    @ApiResponse({ status: 201, type: ResultDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID справчоника' })
    @Post(':id')
    create(@Param() params: {id: number}, @Body() body: CreateReferenceBookInstancesDto) {
        return this.referenceBookInstancesService.create(params.id, body);
    }

    @ApiOperation({ summary: 'Обуновление записи справочника' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID записи' })
    @Patch(':id')
    update(@Param() params: {id: number}, @Body() body: CreateReferenceBookInstancesDto) {
        return this.referenceBookInstancesService.update(params.id, body);
    }

    @ApiOperation({ summary: 'Удаление записей по ids' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiQuery({  name: 'ids',  type: Number, isArray: true, required: true, description: 'IDs записей' })
    @UseGuards(JwtAuthGuardAdmin)
    @Delete('/delete-ids')
    deleteIds(@Query() query): Promise<ResultDto> {
      return this.referenceBookInstancesService.deleteIds(query.ids.map((el) => Number(el)));
    }

    @ApiOperation({ summary: 'Удаление записи справочника' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiParam({  name: 'id',  type: Number, required: true, description: 'ID записи' })
    @Delete(':id')
    delete(@Param() params): Promise<ResultDto> {
        return this.referenceBookInstancesService.delete(Number(params.id));
    }
}

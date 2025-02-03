import { ResultPagesComponentsDto, PagesComponentsListDto } from './../dto/pages-components/response-pages-components.dto';
import { Body, Controller, Delete, Get, Param, Patch, Post, Query, UseGuards } from '@nestjs/common';
import { ApiExceptionDecorators } from 'src/decorators/exception-decorators';
import { ApiBearerAuth, ApiOperation, ApiParam, ApiQuery, ApiResponse, ApiTags } from '@nestjs/swagger';
import { JwtAuthGuardAdmin } from 'src/auth/jwt-auth-admin.guard';
import { ResultDto } from 'src/dto/reponse.dto';
import { PagesComponentsService } from '../service/pages-components.service';
import { CreatePagesComponents } from '../dto/pages-components/create-pages-components.dto';

@ApiTags('Страницы')
@Controller('pages-components')
@ApiExceptionDecorators()
@ApiBearerAuth()
@UseGuards(JwtAuthGuardAdmin)
export class PagesComponentsController {
  constructor(
    private readonly pagesComponentsService: PagesComponentsService
) {}

  @ApiOperation({ summary: 'Получение компонента' })
  @ApiResponse({ status: 200, type: ResultPagesComponentsDto })
  @ApiParam({ name: 'id', type: Number, required: true, description: 'ID компонента' })
  @Get(':id')
  getOne(@Param() params): Promise<ResultPagesComponentsDto> {
    return this.pagesComponentsService.getOne(Number(params.id));
  }

  @ApiOperation({ summary: 'Удаление комментарий по ids' })
  @ApiResponse({ status: 200, type: ResultDto })
  @ApiQuery({  name: 'ids',  type: Number, isArray: true, required: true, description: 'IDs записей' })
  @Delete('/delete-ids')
  deleteIds(@Query() query): Promise<ResultDto> {
    return this.pagesComponentsService.deleteIds(query.ids);
  }

  @ApiOperation({ summary: 'Создание компонента' })
  @ApiResponse({ status: 201, type: ResultPagesComponentsDto })
  @Post()
  create(@Body() body: CreatePagesComponents): Promise<ResultPagesComponentsDto> {
      return this.pagesComponentsService.create(body);
  }

  @ApiOperation({ summary: 'Обновление компонента' })
  @ApiResponse({ status: 200, type: ResultPagesComponentsDto })
  @Patch()
  update(@Body() body: CreatePagesComponents): Promise<ResultPagesComponentsDto> {
      return this.pagesComponentsService.update(body);
  }

  @ApiOperation({ summary: 'Список компонентов' })
  @ApiResponse({ status: 200, type: PagesComponentsListDto })
  @ApiQuery({ name: 'id', type: Number, required: true, description: 'ID cтраницы'})
  @Get()
  get(@Query() query: {id: number}): Promise<PagesComponentsListDto> {
      return this.pagesComponentsService.get(query.id);
  }

  @ApiOperation({ summary: 'Удаление компонента' })
  @ApiResponse({ status: 200, type: ResultDto })
  @ApiParam({  name: 'id',  type: Number, required: true, description: 'ID компонента' })
  @Delete(':id')
  delete(@Param() params): Promise<ResultDto> {
    return this.pagesComponentsService.delete(Number(params.id));
  }
}

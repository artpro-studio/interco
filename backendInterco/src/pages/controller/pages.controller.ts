import { Body, Controller, Delete, Get, Param, Patch, Post, Query, UseGuards } from '@nestjs/common';
import { PagesService } from '../service/pages.service';
import { ApiExceptionDecorators } from 'src/decorators/exception-decorators';
import { ApiBearerAuth, ApiOperation, ApiParam, ApiQuery, ApiResponse, ApiTags } from '@nestjs/swagger';
import { JwtAuthGuardAdmin } from 'src/auth/jwt-auth-admin.guard';
import { PagesListDto, PagesQuery, ResultPagesDto, ResultPagesFullDto } from '../dto/pages/response-pages.dto';
import { PagesDto } from '../dto/pages/create-pages.dto';
import { PagesType } from '../interface';
import { BaseQuery, ResultDto } from 'src/dto/reponse.dto';
import { ResultDropDownDto } from 'src/dto/response-drop-down.dto';

@ApiTags('Страницы')
@Controller('pages')
@ApiExceptionDecorators()
@ApiBearerAuth()
@UseGuards(JwtAuthGuardAdmin)
export class PagesController {
  constructor(private readonly pagesService: PagesService) {}

  @ApiOperation({ summary: 'Select список страниц' })
  @ApiResponse({ status: 200, type: ResultDropDownDto })
  @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
  @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
  @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
  @Get('select')
  getSelect(@Query() query: BaseQuery): Promise<ResultDropDownDto> {
      return this.pagesService.getSelect(query);
  }

  @ApiOperation({ summary: 'Получение списка страниц по id для select' })
  @ApiResponse({ status: 200, type: ResultDropDownDto })
  @ApiQuery({ name: 'ids', type: Number, isArray: true, required: true, description: 'Массив id страниц' })
  @Get('select-ids')
  getSelectIds(@Query() query: {ids: number[]}): Promise<ResultDropDownDto> {
      return this.pagesService.getSelectIds(query.ids);
  }

  @ApiOperation({ summary: 'Проверка есть ли страница' })
  @ApiResponse({ status: 200, type: ResultDto })
  @ApiParam({ name: 'id', type: Number, required: true, description: 'ID страницы' })
  @Get('is-page:id')
  isPage(@Param() params): Promise<ResultDto> {
    return this.pagesService.isPage(Number(params.id));
  }

  @ApiOperation({ summary: 'Получение страницы' })
  @ApiResponse({ status: 200, type: ResultPagesFullDto })
  @ApiParam({ name: 'id', type: Number, required: true, description: 'ID страницы' })
  @Get(':id')
  getOne(@Param() params): Promise<ResultPagesFullDto> {
    return this.pagesService.getOne(Number(params.id));
  }

  @ApiOperation({ summary: 'Удаление страниц по ids' })
  @ApiResponse({ status: 200, type: ResultDto })
  @ApiQuery({  name: 'ids',  type: Number, isArray: true, required: true, description: 'IDs страниц' })
  @Delete('/delete-ids')
  deleteIds(@Query() query): Promise<ResultDto> {
    return this.pagesService.deleteIds(query.ids);
  }

  @ApiOperation({ summary: 'Создание страницы' })
  @ApiResponse({ status: 201, type: ResultPagesDto })
  @Post()
  create(@Body() body: PagesDto): Promise<ResultPagesDto> {
      return this.pagesService.create(body);
  }

  @ApiOperation({ summary: 'Обновление страницы' })
  @ApiResponse({ status: 200, type: ResultPagesDto })
  @Patch()
  update(@Body() body: PagesDto): Promise<ResultPagesDto> {
      return this.pagesService.update(body);
  }

  @ApiOperation({ summary: 'Список страниц' })
  @ApiResponse({ status: 200, type: PagesListDto })
  @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
  @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
  @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
  @ApiQuery({ name: 'pagesType', enum: PagesType, required: false, description: 'Тип страницы'})
  @Get()
  get(@Query() query: PagesQuery): Promise<PagesListDto> {
      return this.pagesService.get(query);
  }

  @ApiOperation({ summary: 'Удаление страницы' })
  @ApiResponse({ status: 200, type: ResultDto })
  @ApiParam({  name: 'id',  type: Number, required: true, description: 'ID страницы' })
  @Delete(':id')
  delete(@Param() params): Promise<ResultDto> {
    return this.pagesService.delete(Number(params.id));
  }
}

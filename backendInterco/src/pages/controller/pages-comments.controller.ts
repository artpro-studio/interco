import { Body, Controller, Delete, Get, Param, Patch, Post, Query, UseGuards } from '@nestjs/common';
import { ApiExceptionDecorators } from 'src/decorators/exception-decorators';
import { ApiBearerAuth, ApiOperation, ApiParam, ApiQuery, ApiResponse, ApiTags } from '@nestjs/swagger';
import { JwtAuthGuardAdmin } from 'src/auth/jwt-auth-admin.guard';
import { ResultDto } from 'src/dto/reponse.dto';
import { PagesCommentsService } from '../service/pages-comments.service';
import { CreatePagesCommentsDto, PagesCommentsDto } from '../dto/pages-comments/create-pages-comments.dto';
import { PagesCommentsListDto, PagesCommentsQuery, ResultPagesCommentsDto } from '../dto/pages-comments/response-pages-comments.dto';
import { CommentStatus } from '../interface';

@ApiTags('Страницы')
@Controller('pages-comments')
@ApiExceptionDecorators()
@ApiBearerAuth()
@UseGuards(JwtAuthGuardAdmin)
export class PagesCommentsController {
  constructor(private readonly pagesCommentsService: PagesCommentsService) {}


  @ApiOperation({ summary: 'Обновление статусов комментариев' })
  @ApiResponse({ status: 200, type: ResultDto })
  @ApiQuery({ name: 'ids',  type: Number, isArray: true, required: true, description: 'IDs комментариев' })
  @ApiQuery({ name: 'status', enum: CommentStatus, enumName: 'CommentStatus', required: true, description: 'Статус' })
  @Get('on-success-status-ids/:id')
  onSuccessStatusIds(@Query() query): Promise<ResultDto> {
    return this.pagesCommentsService.onSuccessStatusIds(query.ids, query.status);
  }

  @ApiOperation({ summary: 'Обновление статуса комментария' })
  @ApiResponse({ status: 200, type: ResultDto })
  @ApiParam({ name: 'id', type: Number, required: true, description: 'ID комметария' })
  @ApiQuery({ name: 'status', enum: CommentStatus, enumName: 'CommentStatus', required: true, description: 'Статус' })
  @Get('on-success-status/:id')
  onSuccessStatus(@Param() params, @Query() query): Promise<ResultDto> {
    return this.pagesCommentsService.onSuccessStatus(Number(params.id), query.status);
  }

  @ApiOperation({ summary: 'Получение комментария' })
  @ApiResponse({ status: 200, type: ResultPagesCommentsDto })
  @ApiParam({ name: 'id', type: Number, required: true, description: 'ID комметария' })
  @Get(':id')
  getOne(@Param() params): Promise<ResultPagesCommentsDto> {
    return this.pagesCommentsService.getOne(Number(params.id));
  }

  @ApiOperation({ summary: 'Удаление комментарий по ids' })
  @ApiResponse({ status: 200, type: ResultDto })
  @ApiQuery({  name: 'ids',  type: Number, isArray: true, required: true, description: 'IDs записей' })
  @Delete('/delete-ids')
  deleteIds(@Query() query): Promise<ResultDto> {
    return this.pagesCommentsService.deleteIds(query.ids);
  }

  @ApiOperation({ summary: 'Создание комментария' })
  @ApiResponse({ status: 201, type: ResultPagesCommentsDto })
  @Post()
  create(@Body() body: CreatePagesCommentsDto): Promise<ResultPagesCommentsDto> {
      return this.pagesCommentsService.create(body);
  }

  @ApiOperation({ summary: 'Обновление комментария' })
  @ApiResponse({ status: 200, type: ResultPagesCommentsDto })
  @Patch()
  update(@Body() body: CreatePagesCommentsDto): Promise<ResultPagesCommentsDto> {
      return this.pagesCommentsService.update(body);
  }

  @ApiOperation({ summary: 'Список комментарий' })
  @ApiResponse({ status: 200, type: PagesCommentsListDto })
  @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
  @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
  @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
  @ApiQuery({ name: 'status', enum: CommentStatus, enumName: 'CommentStatus',  required: false, description: 'Статус'})
  @ApiQuery({ name: 'id', type: Number, required: false, description: 'ID записи'})
  @ApiQuery({ name: 'blogId', type: Number, required: false, description: 'ID блога'})
  @Get()
  get(@Query() body: PagesCommentsQuery): Promise<PagesCommentsListDto> {
      return this.pagesCommentsService.get(body);
  }

  @ApiOperation({ summary: 'Удаление комментария' })
  @ApiResponse({ status: 200, type: ResultDto })
  @ApiParam({  name: 'id',  type: Number, required: true, description: 'ID комментария' })
  @Delete(':id')
  delete(@Param() params): Promise<ResultDto> {
    return this.pagesCommentsService.delete(Number(params.id));
  }
}

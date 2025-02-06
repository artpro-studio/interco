import { Body, Controller, Get, Param, Post, Query, Req, UseGuards } from '@nestjs/common';
import { PagesService } from '../service/pages.service';
import { ApiBearerAuth, ApiOperation, ApiParam, ApiQuery, ApiResponse, ApiTags } from '@nestjs/swagger';
import { PagesListDto, ResultPagesFullDto } from '../dto/pages/response-pages.dto';
import { PagesComponentsService } from '../service/pages-components.service';
import { PagesComponentsListDto } from '../dto/pages-components/response-pages-components.dto';
import { RecordsListDto, RecordsQuerySlug, ResultRecordsFullDto } from '../dto/records/response-records.dto';
import { RecordsService } from '../service/records.service';
import { PagesCommentsListDto, ResultPagesCommentsDto } from '../dto/pages-comments/response-pages-comments.dto';
import { PagesCommentsService } from '../service/pages-comments.service';
import { CreateCommentsDto, CreatePagesCommentsDto } from '../dto/pages-comments/create-pages-comments.dto';
import { ApiExceptionDecorators } from 'src/decorators/exception-decorators';
import { JwtAuthGuard } from 'src/auth/jwt-auth.guard';
import { CommentStatus } from '../interface';
import { BaseQuery, ResultDto } from 'src/dto/reponse.dto';
import { ResultPagesSeoPublicDto } from '../dto/seo/response-seo';
import { PagesSeoService } from '../service/pages-seo.service';

@ApiTags('Публичные запросы для страниц')
@ApiExceptionDecorators()
@Controller('pages-public')
export class PagesPublicController {
    constructor(
        private readonly pagesService: PagesService,
        private readonly recordsService: RecordsService,
        private readonly pagesComponentsService: PagesComponentsService,
        private readonly pagesCommentsService: PagesCommentsService,
        private readonly pagesSeoService: PagesSeoService,
    ) {}

    @ApiOperation({ summary: 'Получение сео параметров у страницы' })
    @ApiResponse({ status: 200, type: ResultPagesSeoPublicDto })
    @ApiQuery({ name: 'slug', type: String, description: 'Slug страницы' })
    @Get('get-seo-for-page')
    getSeoPage(@Query() query: {slug: string}): Promise<ResultPagesSeoPublicDto> {
        return this.pagesSeoService.getPageSeoParamsPublic(query.slug);
    }

    @ApiOperation({ summary: 'Получение страницы' })
    @ApiResponse({ status: 200, type: ResultPagesFullDto })
    @ApiQuery({ name: 'slug', type: String, description: 'Slug страницы' })
    @Get('')
    getOneForSlug(@Query() query: {slug: string}): Promise<ResultPagesFullDto> {
        return this.pagesService.getOneForSlug(query.slug);
    }

    @ApiOperation({ summary: 'Получение компонентов страницы' })
    @ApiResponse({ status: 200, type: PagesComponentsListDto })
    @ApiQuery({ name: 'slug', type: String, description: 'Slug страницы' })
    @Get('components')
    getComponentsForSlug(@Query() query: {slug: string}): Promise<PagesComponentsListDto> {
        return this.pagesComponentsService.getComponentsForSlug(query.slug);
    }

    @ApiOperation({ summary: 'Получение всех страниц с типом блог' })
    @ApiResponse({ status: 200, type: PagesListDto })
    @Get('pages-blogs')
    getPagesBlogs(): Promise<PagesListDto> {
        return this.pagesService.getPagesBlogs();
    }

    @ApiOperation({ summary: 'Получение записей блога' })
    @ApiResponse({ status: 200, type: RecordsListDto })
    @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
    @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
    @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
    @ApiQuery({ name: 'slug', type: String, required: true, description: 'Символьный код страницы'})
    @Get('records-blog')
    getRecordsBlogs(@Query() query: RecordsQuerySlug): Promise<RecordsListDto> {
        return this.recordsService.getForSlug(query);
    }

    @ApiOperation({ summary: 'Получение одной записи блога' })
    @ApiResponse({ status: 200, type: ResultRecordsFullDto })
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID записи' })
    @Get('record/:id')
    getRecord(@Param() params): Promise<ResultRecordsFullDto> {
        return this.recordsService.getOne(Number(params.id));
    }

    @ApiOperation({ summary: 'Получение комментариев записи' })
    @ApiResponse({ status: 200, type: PagesCommentsListDto })
    @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
    @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
    @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID записи' })
    @Get('record-comments/:id')
    getRecordComments(@Param() params, @Query() query: BaseQuery, @Req() req): Promise<PagesCommentsListDto> {
        return this.pagesCommentsService.getTree({
            search: query.search,
            limit: query.limit,
            page: query.page,
            id: Number(params.id),
            status: CommentStatus.SUCCESS,
        }, req);
    }

    @ApiOperation({ summary: 'Понравился комметарий' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiBearerAuth()
    @UseGuards(JwtAuthGuard)
    @ApiParam({ name: 'id', type: Number, required: true, description: 'ID записи' })
    @Get('is-like-comment/:id')
    isLikeComment(@Query() query: {isLike: boolean}, @Param() params: {id: number}, @Req() req): Promise<ResultPagesCommentsDto> {
        return this.pagesCommentsService.isLikeComment(query.isLike, params.id, req);
    }

    @ApiOperation({ summary: 'Создание комментария' })
    @ApiResponse({ status: 201, type: ResultPagesCommentsDto })
    @ApiExceptionDecorators()
    @ApiBearerAuth()
    @UseGuards(JwtAuthGuard)
    @Post('create-comments')
    createComment(@Body() body: CreateCommentsDto, @Req() req): Promise<ResultPagesCommentsDto> {
        return this.pagesCommentsService.createForRequest(body, req);
    }
}

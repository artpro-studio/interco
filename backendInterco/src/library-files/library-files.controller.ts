import {
  Controller,
  UseGuards,
  Post,
  Body,
  Get,
  Patch,
  Param,
  Delete,
  Req,
  Query,
  UseInterceptors,
  UploadedFile,
  Headers,
} from '@nestjs/common';
import { LibraryFilesService } from './library-files.service';
import {
  ApiBearerAuth,
  ApiTags,
  ApiOperation,
  ApiParam,
  ApiQuery,
  ApiResponse,
  ApiBody,
  ApiConsumes,
} from '@nestjs/swagger';
import {FileInterceptor} from '@nestjs/platform-express';
import {JwtAuthGuard} from '../auth/jwt-auth.guard';
import { BaseQueryId, ResultDto } from 'src/dto/reponse.dto';
import { ResponseLibraryFiles, ResponseLibraryFilesList, ResponseLibraryListDto } from './dto/response-library-files.dto';
import { CreateLibraryFilesDto } from './dto/create-library-files.dto';
import { FileType } from './interface';

@ApiTags('Файловая система')
@ApiBearerAuth()
@UseGuards(JwtAuthGuard)
@Controller('library-files')
export class LibraryFilesController {
  constructor(private readonly libraryFilesService: LibraryFilesService) {
  }

  @ApiOperation({ summary: 'Загрузка файла' })
  @ApiResponse({ status: 201, type: ResponseLibraryFiles })
  @ApiQuery({name: 'id', type: Number, required: false, description: 'ID директории'})
  @ApiConsumes('multipart/form-data')
  @UseInterceptors(FileInterceptor('file'))
  @ApiBody({
    schema: {
      type: 'object',
      properties: {
        file: {
          type: 'string',
          format: 'binary',
          description: 'Файл'
        }
      },
    },
  })
  @Post('upload')
  async uploadFile(@UploadedFile() file: any,  @Headers() header, @Query() body: {id?: number}) {
    return await this.libraryFilesService.uploadFile(file, header.authorization, body.id);
  }

  @ApiOperation({ summary: 'Список директорий' })
  @ApiResponse({ status: 200, type: ResponseLibraryListDto })
  @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница'})
  @ApiQuery({name: 'search', type: String, required: false, description: 'Название директории'})
  @Get('list-directory')
  getListDirectory(@Query() query: {page: number, search: string}): Promise<ResultDto> {
    return this.libraryFilesService.getListDirectory(query.page, query.search);
  }

  @ApiOperation({ summary: 'Список файлов у директории' })
  @ApiResponse({ status: 200, type: ResponseLibraryFilesList })
  @ApiQuery({name: 'directory', type: Number, required: true, description: 'Директория'})
  @Get('files-for-directory')
  getFilesForDirectory(@Query() query: {directory: number}): Promise<ResponseLibraryFilesList> {
    return this.libraryFilesService.getFilesForDirectory(query.directory);
  }

  @ApiOperation({ summary: 'Удаление файлов' })
  @ApiResponse({ status: 200, type: ResultDto })
  @ApiQuery({  name: 'ids',  type: Number, isArray: true, required: true, description: 'IDs файлов и директорий' })
  @Delete('/delete-ids')
  deleteFileIds(@Query() query, @Req() req): Promise<ResultDto> {
    return this.libraryFilesService.deleteFileIds(query.ids.map(el => Number(el)), req);
  }

  @ApiOperation({ summary: 'Создание директории' })
  @ApiResponse({ status: 201, type: ResponseLibraryFiles })
  @Post()
  create(@Body() body: CreateLibraryFilesDto): Promise<ResponseLibraryFiles> {
    return this.libraryFilesService.create(body);
  }

  @ApiOperation({ summary: 'Удаление файла' })
  @ApiResponse({ status: 200, type: ResultDto })
  @ApiParam({name: 'id', type: Number, required: true, description: 'ID файла или раздела'})
  @Delete(':id')
  delete(@Param() params, @Req() req): Promise<ResultDto> {
    return this.libraryFilesService.deleteFile(Number(params.id), req);
  }

  @ApiOperation({ summary: 'Список файлов' })
  @ApiResponse({ status: 200, type: ResponseLibraryListDto })
  @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница'})
  @ApiQuery({name: 'limit', type: Number, required: true, description: 'Кол-во записей'})
  @ApiQuery({name: 'directory', type: Number, required: false, description: 'Директория'})
  @ApiQuery({name: 'fileName', type: String, required: false, description: 'Название файла'})
  @ApiQuery({name: 'type', enum: FileType, enumName: 'FileType', required: false, description: 'Тип файла'})
  @Get()
  get(@Query() query: {page: number, limit: number, directory: number | undefined, fileName: string | null, type: FileType | null}): Promise<ResponseLibraryListDto> {
    return this.libraryFilesService.get(Number(query.page), Number(query.limit), query.directory, query.fileName, query.type);
  }

  @ApiOperation({ summary: 'Получение одого файла' })
  @ApiResponse({ status: 200, type: ResponseLibraryFiles })
  @ApiParam({name: 'id', type: Number, required: true, description: 'ID'})
  @Get(':id')
  getOne(@Param() params: BaseQueryId): Promise<ResponseLibraryFiles> {
    return this.libraryFilesService.getOne(Number(Number(params.id)));
  }

  @ApiOperation({ summary: 'Обновление название файла' })
  @ApiResponse({ status: 200, type: ResultDto })
  @ApiParam({name: 'id', type: Number, required: true, description: 'ID'})
  @ApiQuery({name: 'name', type: String, required: true, description: 'Страница'})
  @Patch(':id')
  update(@Param() params: BaseQueryId, @Query() query: {name: string}): Promise<ResultDto> {
    return this.libraryFilesService.update(Number(params.id), query.name);
  }
}

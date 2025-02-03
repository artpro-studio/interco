import { ApiExceptionDecorators } from './../decorators/exception-decorators';
import { ResultDto } from 'src/dto/reponse.dto';
import { UserDto } from './dto/user.dto';
import {
    Controller,
    Query,
    Get,
    Post,
    Body,
    Patch,
    Delete,
    Param,
    UseGuards,
    Req,
} from '@nestjs/common';
import {
  ApiBearerAuth,
    ApiOperation,
    ApiParam,
    ApiQuery,
    ApiResponse,
    ApiTags,
} from '@nestjs/swagger';
import { BaseQuery } from 'src/dto/reponse.dto';
import { ResultUserDto, UserFilterDto, UserListDto } from './dto/response-user.dto';
import { UserService } from './user.service';
import { JwtAuthGuard } from 'src/auth/jwt-auth.guard';
import { JwtAuthGuardAdmin } from 'src/auth/jwt-auth-admin.guard';
import { Role } from './role-interface';
import { query } from 'express';
import { ResultDropDownDto } from 'src/dto/response-drop-down.dto';

@ApiTags('Пользователи')
@ApiExceptionDecorators()
@ApiBearerAuth()
@UseGuards(JwtAuthGuard)
@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @ApiOperation({ summary: 'Select список пользователей' })
  @ApiResponse({ status: 200, type: ResultDropDownDto })
  @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
  @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
  @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
  @Get('select')
  getSelect(@Query() query: BaseQuery): Promise<ResultDropDownDto> {
      return this.userService.getSelect(query);
  }

  @ApiOperation({ summary: 'Получение информации о текущем пользователе' })
  @ApiResponse({ status: 200, type: ResultUserDto })
  @Get('/currentUser')
  getCurrentInfo(@Req() req): Promise<ResultUserDto> {
      return this.userService.getCurrentInfo(req);
  }

  @ApiOperation({ summary: 'Удаление пользователей по ids' })
  @ApiResponse({ status: 200, type: ResultDto })
  @ApiQuery({  name: 'ids',  type: Number, isArray: true, required: true, description: 'IDs пользователей' })
  @UseGuards(JwtAuthGuardAdmin)
  @Delete('/delete-ids')
  deleteIds(@Query() query): Promise<ResultDto> {
    return this.userService.deleteIds(query.ids);
  }

  @ApiOperation({ summary: 'Список пользователей' })
  @ApiResponse({ status: 200, type: UserListDto })
  @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
  @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
  @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
  @ApiQuery({ name: 'role', enum: Role, enumName: 'Role', required: false, isArray: true, description: 'Роль'})
  @UseGuards(JwtAuthGuardAdmin)
  @Get()
  get(@Query() query: UserFilterDto): Promise<UserListDto> {
    return this.userService.get(query);
  }

  @ApiOperation({ summary: 'Получение пользователя' })
  @ApiResponse({ status: 200, type: ResultUserDto })
  @ApiParam({ name: 'id', type: Number, required: true, description: 'ID пользователя' })
  @UseGuards(JwtAuthGuardAdmin)
  @Get(':id')
  getOne(@Param() params): Promise<ResultUserDto> {
    return this.userService.getOne(Number(params.id));
  }

  @ApiOperation({ summary: 'Создание пользователя' })
  @ApiResponse({ status: 201, type: ResultUserDto })
  @UseGuards(JwtAuthGuardAdmin)
  @Post()
  create(@Body() body: UserDto): Promise<ResultUserDto> {
    return this.userService.create(body);
  }

  @ApiOperation({ summary: 'Обновление пользователя' })
  @ApiResponse({ status: 200, type: ResultUserDto })
  @UseGuards(JwtAuthGuardAdmin)
  @Patch()
  update(@Body() body: UserDto): Promise<ResultUserDto> {
    return this.userService.update(body);
  }

  @ApiOperation({ summary: 'Удаление пользователя' })
  @ApiResponse({ status: 200, type: ResultDto })
  @ApiParam({  name: 'id',  type: Number, required: true, description: 'ID пользователя' })
  @UseGuards(JwtAuthGuardAdmin)
  @Delete(':id')
  delete(@Param() params): Promise<ResultDto> {
    return this.userService.delete(Number(params.id));
  }
}

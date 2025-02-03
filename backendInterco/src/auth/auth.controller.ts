import { ResultDto } from './../dto/reponse.dto';
import { ApiExceptionDecorators } from './../decorators/exception-decorators';
import {LoginDto, RegisterDto, ResultLogin} from './dto/login.dto';
import { Body, Controller, Post, Get, Query } from '@nestjs/common';
import { AuthService } from './auth.service';
import { ApiOperation, ApiResponse, ApiTags, ApiQuery } from '@nestjs/swagger';

@ApiTags('Авторизация')
@ApiExceptionDecorators()
@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @ApiOperation({ summary: 'Подтверждение смены пароль' })
  @ApiResponse({ status: 200, type: ResultDto })
  @ApiQuery({name: 'uuid', type: String, required: true, description: 'UUID'})
  @ApiQuery({name: 'password', type: String, required: true, description: 'Пароль'})
  @Get('/replace-password')
  replacePassword(@Query() quary:{uuid: string, password: string}): Promise<ResultDto> {
    return this.authService.replacePassword(quary.uuid, quary.password);
  }

  @ApiOperation({ summary: 'Подтверждение почты' })
  @ApiResponse({ status: 200, type: ResultDto })
  @ApiQuery({name: 'uuid', type: String, required: true, description: 'UUID'})
  @Get('/confirm-email')
  confirmEmail(@Query() quary:{uuid: string}): Promise<ResultDto> {
    return this.authService.confirmEmail(quary.uuid);
  }

  @ApiOperation({ summary: 'Проверка есть ли активный uuid' })
  @ApiResponse({ status: 200, type: ResultDto })
  @ApiQuery({name: 'uuid', type: String, required: true, description: 'UUID'})
  @Get('/is-active-uuid')
  isActiveUUID(@Query() quary:{uuid: string}): Promise<ResultDto> {
    return this.authService.isActiveUUID(quary.uuid);
  }

  @ApiOperation({ summary: 'Запрос на смену пароль' })
  @ApiResponse({ status: 200, type: ResultDto })
  @ApiQuery({name: 'email', type: String, required: true, description: 'E-mail'})
  @Get('/confirm-replace')
  confirmReplace(@Query() quary:{email: string}): Promise<ResultDto> {
    return this.authService.confirmReplace(quary.email);
  }

  @ApiOperation({ summary: 'Авторизация' })
  @ApiResponse({ status: 201, type: ResultLogin })
  @Post('login')
  login(@Body() body: LoginDto): Promise<ResultLogin> {
      return this.authService.login(body);
  }

  @ApiOperation({ summary: 'Регистрация' })
  @ApiResponse({ status: 201, type: ResultDto })
  @Post('register')
  register(@Body() body: RegisterDto): Promise<ResultDto> {
    return this.authService.register(body);
  }
}

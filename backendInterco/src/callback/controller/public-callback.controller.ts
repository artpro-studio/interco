import {
    Body,
    ClassSerializerInterceptor,
    Controller,
    Post,
    Req,
    UploadedFile,
    UseInterceptors,
} from '@nestjs/common';
import {
    ApiBody,
    ApiConsumes,
    ApiOperation,
    ApiResponse,
    ApiTags,
} from '@nestjs/swagger';
import { ApiExceptionDecorators } from 'src/decorators/exception-decorators';
import { PublicCallbackService } from '../service/public-callback.service';
import { ResultDto } from 'src/dto/reponse.dto';
import { PublicCallbackDto } from '../dto/public-callback/public-callback.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import { Request } from 'express';

@ApiTags('Публичная форма заявок')
@ApiExceptionDecorators()
@Controller('callback-public')
export class PublicCallbackController {
    constructor(
        private readonly publicCallbackService: PublicCallbackService
    ) {}

    @ApiOperation({ summary: 'Создание и отправка новой заявки' })
    @ApiResponse({ status: 201, type: ResultDto })
    @Post()
    async create(@Body() body: PublicCallbackDto): Promise<ResultDto> {
        return this.publicCallbackService.create(body);
    }
}

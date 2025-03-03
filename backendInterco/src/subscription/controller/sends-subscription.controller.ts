import {
    Body,
    Controller,
    Get,
    Param,
    Post,
    Query,
    UseGuards,
} from '@nestjs/common';
import {
    ApiBearerAuth,
    ApiOperation,
    ApiParam,
    ApiQuery,
    ApiResponse,
    ApiTags,
} from '@nestjs/swagger';
import { JwtAuthGuardAdmin } from 'src/auth/jwt-auth-admin.guard';
import { ApiExceptionDecorators } from 'src/decorators/exception-decorators';
import { SendsSubscriptionService } from '../service/sends-subscription.service';
import { SendsSubscriptionRepository } from '../repository/sends-subscription.repository';
import {
    ResultSendsSubscriptionDto,
    SendsSubscriptionListDto,
} from '../dto/sends-subscription/respone-sends-subscription.dto';
import { SendsSubscriptionDto } from '../dto/sends-subscription/sends-subscription.dto';
import { BaseQuery } from 'src/dto/reponse.dto';

@ApiTags('Рассылки')
@Controller('sends-subscription')
@ApiExceptionDecorators()
@ApiBearerAuth()
@UseGuards(JwtAuthGuardAdmin)
export class SendsSubscriptionController {
    constructor(
        private readonly sendsSubscriptionService: SendsSubscriptionService,
        private readonly sendsSubscriptionRepository: SendsSubscriptionRepository
    ) {}

    @ApiOperation({ summary: 'Создание' })
    @ApiResponse({ status: 201, type: ResultSendsSubscriptionDto })
    @Post()
    async create(
        @Body() body: SendsSubscriptionDto
    ): Promise<ResultSendsSubscriptionDto> {
        return this.sendsSubscriptionService.create(body);
    }

    @ApiOperation({ summary: 'Одна рассылка' })
    @ApiResponse({ status: 200, type: ResultSendsSubscriptionDto })
    @ApiParam({
        name: 'id',
        type: Number,
        required: true,
        description: 'ID',
    })
    @Get(':id')
    async getOne(@Param() params): Promise<ResultSendsSubscriptionDto> {
        return {
            isSuccess: true,
            entity: await this.sendsSubscriptionRepository.getOne(
                Number(params.id)
            ),
        };
    }

    @ApiOperation({ summary: 'Список' })
    @ApiResponse({ status: 200, type: SendsSubscriptionListDto })
    @ApiQuery({
        name: 'search',
        type: String,
        required: true,
        description: 'Поиск',
    })
    @ApiQuery({
        name: 'page',
        type: Number,
        required: true,
        description: 'Страница',
    })
    @ApiQuery({
        name: 'limit',
        type: Number,
        required: true,
        description: 'Количество',
    })
    @Get()
    async get(@Query() query: BaseQuery): Promise<SendsSubscriptionListDto> {
        return {
            isSuccess: true,
            entity: {
                ...(await this.sendsSubscriptionRepository.get(query)),
            },
        };
    }
}

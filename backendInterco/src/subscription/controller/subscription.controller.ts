import {
    Body,
    Controller,
    Delete,
    Get,
    Param,
    Patch,
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
import { SubscriptionRepository } from '../repository/subscription.repository';
import { BaseQuery, ResultDto } from 'src/dto/reponse.dto';
import { SubscriptionDto } from '../dto/subscription.dto';
import {
    ResultSubscriptionDto,
    SubscriptionListDto,
} from '../dto/response-subscription.dto';

@ApiTags('Подписки')
@Controller('subscription')
@ApiExceptionDecorators()
@ApiBearerAuth()
@UseGuards(JwtAuthGuardAdmin)
export class SubscriptionController {
    constructor(
        private readonly subscriptionRepository: SubscriptionRepository
    ) {}

    @ApiOperation({ summary: 'Создание' })
    @ApiResponse({ status: 201, type: ResultSubscriptionDto })
    @Post()
    async create(
        @Body() body: SubscriptionDto
    ): Promise<ResultSubscriptionDto> {
        return {
            isSuccess: true,
            entity: await this.subscriptionRepository.create(body),
        };
    }

    @ApiOperation({ summary: 'Обновление' })
    @ApiResponse({ status: 200, type: ResultSubscriptionDto })
    @Patch()
    async update(
        @Body() body: SubscriptionDto
    ): Promise<ResultSubscriptionDto> {
        return {
            isSuccess: true,
            entity: await this.subscriptionRepository.udapte(body),
        };
    }

    @ApiOperation({ summary: 'Список' })
    @ApiResponse({ status: 200, type: SubscriptionListDto })
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
    async get(@Query() query: BaseQuery): Promise<SubscriptionListDto> {
        return {
            isSuccess: true,
            entity: {
                ...(await this.subscriptionRepository.get(query)),
            },
        };
    }

    @ApiOperation({ summary: 'Удаление по ids' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiQuery({
        name: 'ids',
        type: Number,
        isArray: true,
        required: true,
        description: 'IDs страниц',
    })
    @Delete('/delete-ids')
    async deleteIds(@Query() query): Promise<ResultDto> {
        const result = await this.subscriptionRepository.deleteIds(query.ids);
        return {
            isSuccess: result,
        };
    }

    @ApiOperation({ summary: 'Удаление' })
    @ApiResponse({ status: 200, type: ResultDto })
    @ApiParam({
        name: 'id',
        type: Number,
        required: true,
        description: 'ID страницы',
    })
    @Delete(':id')
    async delete(@Param() params): Promise<ResultDto> {
        return {
            isSuccess: await this.subscriptionRepository.delete(
                Number(params.id)
            ),
        };
    }
}

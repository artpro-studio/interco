import { Body, Controller, Post } from '@nestjs/common';
import { ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { ApiExceptionDecorators } from 'src/decorators/exception-decorators';
import { ResultSubscriptionDto } from '../dto/response-subscription.dto';
import { SubscriptionDto } from '../dto/subscription.dto';
import { SubscriptionService } from '../service/subscription.service';

@ApiTags('Подписки')
@Controller('public-subscription')
@ApiExceptionDecorators()
export class PublicSubscriptionController {
    constructor(private readonly subscriptionService: SubscriptionService) {}

    @ApiOperation({ summary: 'Создание(публичный)' })
    @ApiResponse({ status: 201, type: ResultSubscriptionDto })
    @Post()
    create(@Body() body: SubscriptionDto): Promise<ResultSubscriptionDto> {
        return this.subscriptionService.create(body);
    }
}

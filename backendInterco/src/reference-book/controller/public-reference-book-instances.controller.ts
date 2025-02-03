import { ApiTags, ApiOperation, ApiResponse, ApiQuery } from '@nestjs/swagger';
import { ApiExceptionDecorators } from 'src/decorators/exception-decorators';
import { Controller, Get, Query } from '@nestjs/common';
import { ReferenceBookInstancesQuery, ResponseBookAttributesListDto } from '../dto/reference-book-instances/response-reference-book-instances.dto';
import { ReferenceBookInstancesService } from '../service/reference-book-instances.service';

@ApiTags('Публичный справочник')
@ApiExceptionDecorators()
@Controller('public-reference-book-instances')
export class PublicReferenceBookInstancesController {
    constructor(
        private readonly referenceBookInstancesService: ReferenceBookInstancesService
    ){}

    @ApiOperation({ summary: 'Список записей справочника' })
    @ApiResponse({ status: 200, type: ResponseBookAttributesListDto })
    @ApiQuery({ name: 'search', type: String, required: true, description: 'Поиск' })
    @ApiQuery({name: 'page', type: Number, required: true, description: 'Страница' })
    @ApiQuery({ name: 'limit', type: Number, required: true, description: 'Количество'})
    @ApiQuery({ name: 'slug', type: String, required: true, description: 'Символьный код справочника'})
    @Get('')
    async get(@Query() query: ReferenceBookInstancesQuery): Promise<ResponseBookAttributesListDto> {
        return this.referenceBookInstancesService.getForSlug(query);
    }
}

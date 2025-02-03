import { Injectable } from '@nestjs/common';
import { ReferenceBookAttributesRepository } from '../repository/reference-book-attributes.repository';
import { ReferenceBookRepository } from '../repository/reference-book-repository';
import { CreateReferenceBookAttributesDto } from '../dto/reference-book-attributes/reference-book-attributes.dto';
import { ResultReferenceBookAttributesDto } from '../dto/reference-book-attributes/response-reference-book-attributes.dto';

@Injectable()
export class ReferenceBookAttributesService {
    constructor(
        private readonly referenceBookAttributesRepository: ReferenceBookAttributesRepository,
        private readonly referenceBookRepository: ReferenceBookRepository,
    ) {}

    async create(body: CreateReferenceBookAttributesDto): Promise<ResultReferenceBookAttributesDto> {
        const referenceBook = await this.referenceBookRepository.getOneForID(body.referenceBookId);
        const entity = await this.referenceBookAttributesRepository.create({
            ...body,
            referenceBook,
        })

        return {isSuccess: true, entity}
    }

    async update(body: CreateReferenceBookAttributesDto): Promise<ResultReferenceBookAttributesDto> {
        const referenceBook = await this.referenceBookRepository.getOneForID(body.referenceBookId);
        const entity = await this.referenceBookAttributesRepository.update({
            ...body,
            referenceBook,
        })

        return {isSuccess: true, entity}
    }
}

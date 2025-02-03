import { InjectRepository } from '@nestjs/typeorm';
import { Repository, ILike } from 'typeorm';
import { ReferenceBookEntity } from '../entity/reference-book.entity';
import { FullReferenceBookDto, ReferenceBookDto } from '../dto/reference-book/reference-book.dto';
import { BaseQuery } from 'src/dto/reponse.dto';

export class ReferenceBookRepository {
    constructor(
        @InjectRepository(ReferenceBookEntity) private readonly referenceBookRepository: Repository<ReferenceBookEntity>,
    ) {}

    async getOneForID(id): Promise<ReferenceBookDto> {
        return await this.referenceBookRepository.findOne({
            where: {
                id
            }
        })
    }

    async get(body: BaseQuery): Promise<{
        count: number,
        entity: FullReferenceBookDto[]
    }> {
        try {
            const take = Number(body.limit);
            const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
            const query = this.referenceBookRepository.createQueryBuilder('referenceBook').take(take).skip(skip).orderBy('referenceBook.id', 'ASC');
            if (body.search) {
                query.orWhere({
                    name: ILike(`%${body.search}%`)
                })
            }

            return {
                count: await query.getCount(),
                entity: await query.getMany()
            }
        } catch (error) {
            console.log(error)
        }
    }

    async create(body: ReferenceBookDto): Promise<ReferenceBookDto> {
        const entity = this.referenceBookRepository.create(body);
        await this.referenceBookRepository.save(entity);

        return entity;
    }

     // Обновление страницы
     async update(body: ReferenceBookDto): Promise<ReferenceBookDto> {
        const referenceBook = this.getOneForID(body.id)
        const entity = {
            ...referenceBook,
            ...body,
        };
        await this.referenceBookRepository.save(entity);

        return entity
    }

    async deleteIds(ids: number[]): Promise<boolean> {
        const query = await this.referenceBookRepository
        .createQueryBuilder('referenceBook')
        .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
        })
        .softDelete()
        .execute();

        return !!query.affected;
    }

    async delete(id: number): Promise<boolean> {
        const query = await this.referenceBookRepository
        .createQueryBuilder('referenceBook')
        .where('id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return !!query.affected
    }
}

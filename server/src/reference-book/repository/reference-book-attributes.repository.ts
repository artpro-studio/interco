import { InjectRepository } from '@nestjs/typeorm';
import { Repository, ILike } from 'typeorm';
import { BaseQuery } from 'src/dto/reponse.dto';
import { ReferenceBookAttributesEntity } from '../entity/reference-book-attributes.entity';
import { FullReferenceBookAttributesDto } from '../dto/reference-book-attributes/reference-book-attributes.dto';

export class ReferenceBookAttributesRepository {
    constructor(
        @InjectRepository(ReferenceBookAttributesEntity) private readonly referenceBookAttributesRepository: Repository<ReferenceBookAttributesEntity>,
    ) {}

    async getOneForID(id): Promise<FullReferenceBookAttributesDto> {
        return await this.referenceBookAttributesRepository.findOne({
            where: {
                id
            }
        })
    }

    async get(referenceBookId: number, body: BaseQuery): Promise<{
        count: number,
        entity: FullReferenceBookAttributesDto[]
    }> {
        try {
            const take = Number(body.limit);
            const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
            const query = this.referenceBookAttributesRepository.createQueryBuilder('referenceBookAttributes').take(take).skip(skip).orderBy('referenceBookAttributes.id', 'ASC')
            .leftJoin('referenceBookAttributes.referenceBook', 'referenceBook')
            .andWhere('referenceBook.id = :id', {
                id: referenceBookId
            })
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

    async create(body: FullReferenceBookAttributesDto): Promise<FullReferenceBookAttributesDto> {
        const entity = this.referenceBookAttributesRepository.create(body);
        await this.referenceBookAttributesRepository.save(entity);

        return entity;
    }

     // Обновление страницы
     async update(body: FullReferenceBookAttributesDto): Promise<FullReferenceBookAttributesDto> {
        const referenceBook = this.getOneForID(body.id)
        const entity = {
            ...referenceBook,
            ...body,
        };
        await this.referenceBookAttributesRepository.save(entity);

        return entity
    }

    async deleteIds(ids: number[]): Promise<boolean> {
        const query = await this.referenceBookAttributesRepository
        .createQueryBuilder('referenceBookAttributes')
        .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
        })
        .softDelete()
        .execute();

        return !!query.affected;
    }

    async delete(id: number): Promise<boolean> {
        const query = await this.referenceBookAttributesRepository
        .createQueryBuilder('referenceBookAttributes')
        .where('id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return !!query.affected
    }
}

import { InjectRepository } from '@nestjs/typeorm';
import { ReferenceBookInstancesEntity } from '../entity/reference-book-instances.entity';
import { Repository, ILike } from 'typeorm';
import { FullReferenceBookInstancesDto, ReferenceBookInstancesDto } from '../dto/reference-book-instances/reference-book-instances.dto';
import { ReferenceBookDto } from '../dto/reference-book/reference-book.dto';
import { BaseQuery } from 'src/dto/reponse.dto';
import { ReferenceBookInstancesQuery } from '../dto/reference-book-instances/response-reference-book-instances.dto';

export class ReferenceBookInstancesRepository {
    constructor(
        @InjectRepository(ReferenceBookInstancesEntity) private readonly referenceBookInstancesRepository: Repository<ReferenceBookInstancesEntity>
    ) {}

    async getForIDs(ids: number[]): Promise<FullReferenceBookInstancesDto[]> {
        const query = this.referenceBookInstancesRepository.createQueryBuilder('instances')
            .leftJoin('instances.referenceBook', 'referenceBook')
            .leftJoin('instances.instancesValue', 'instancesValue')
            .leftJoin('instancesValue.attribute', 'attribute')
            .andWhere('instances.id in (:...ids)', {ids})
            .addSelect(['instancesValue.id', 'instancesValue.value'])
            .addSelect(['attribute.id', 'attribute.name', 'attribute.slug'])

        return await query.getMany();
    }

    async getOneForID(id: number): Promise<FullReferenceBookInstancesDto> {
        const query = this.referenceBookInstancesRepository.createQueryBuilder('instances')
            .leftJoin('instances.referenceBook', 'referenceBook')
            .leftJoin('instances.instancesValue', 'instancesValue')
            .leftJoin('instancesValue.attribute', 'attribute')
            .where('instances.id = :id', {id})
            .addSelect(['instancesValue.id', 'instancesValue.value', 'instancesValue.valueJson'])
            .addSelect(['attribute.id', 'attribute.name', 'attribute.slug', 'attribute.type'])

        return await query.getOne();
    }

    async getForSlug(body: ReferenceBookInstancesQuery): Promise<{
        count: number,
        entity: FullReferenceBookInstancesDto[]
    }> {
        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.referenceBookInstancesRepository.createQueryBuilder('instances').skip(skip).take(take)
            .leftJoin('instances.referenceBook', 'referenceBook')
            .leftJoin('instances.instancesValue', 'instancesValue')
            .leftJoin('instancesValue.attribute', 'attribute')
            .where('referenceBook.slug = :slug', {slug: body.slug})
            .addSelect(['instancesValue.id', 'instancesValue.value'])
            .addSelect(['attribute.id', 'attribute.name', 'attribute.slug'])

        if (body.search) {
            query.andWhere(`instancesValue.value iLIKE '%${body.search}%'`);
        }

        return {
            count: await query.getCount(),
            entity: await query.getMany()
        }
    }

    async get(idReferenceBook: number, body: BaseQuery): Promise<{
        count: number,
        entity: FullReferenceBookInstancesDto[]
    }> {
        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.referenceBookInstancesRepository.createQueryBuilder('instances').skip(skip).take(take)
            .leftJoin('instances.referenceBook', 'referenceBook')
            .leftJoin('instances.instancesValue', 'instancesValue')
            .leftJoin('instancesValue.attribute', 'attribute')
            .where('referenceBook.id = :id', {id: idReferenceBook})
            .addSelect(['instancesValue.id', 'instancesValue.value'])
            .addSelect(['attribute.id', 'attribute.name', 'attribute.slug'])

            if (body.search) {
                query.andWhere(`instancesValue.value iLIKE '%${body.search}%'`);
            }

        return {
            count: await query.getCount(),
            entity: await query.getMany()
        }
    }

    async create(referenceBook: ReferenceBookDto): Promise<ReferenceBookInstancesDto> {
        const entity = this.referenceBookInstancesRepository.create({
            referenceBook
        })
        await this.referenceBookInstancesRepository.save(entity)

        return entity;
    }

    async delete(id: number) {
        const query = await this.referenceBookInstancesRepository
        .createQueryBuilder('instances')
        .where('instances.id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return !!query.affected
    }

    async deleteIds(ids: number[]) {
         const query = await this.referenceBookInstancesRepository
          .createQueryBuilder('user')
          .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
          })
          .softDelete()
          .execute();

          return !!query.affected
    }
}

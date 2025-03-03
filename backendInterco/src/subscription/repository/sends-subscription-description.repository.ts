import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { BaseQuery } from 'src/dto/reponse.dto';
import { SendsSubscriptionDescriptoinEntity } from '../entity/sends-subscriptioin-decription.entity';
import { SendsSubscriptionDescriptionDto } from '../dto/sends-subscription/sends-subscription-description.dto';

@Injectable()
export class SendsSubscriptionDescriptionRepository {
    constructor(
        @InjectRepository(SendsSubscriptionDescriptoinEntity)
        private readonly sendsSubscriptionDescriptoinRepository: Repository<SendsSubscriptionDescriptoinEntity>
    ) {}

    async get(body: BaseQuery): Promise<{
        count: number;
        limit: number;
        entity: SendsSubscriptionDescriptionDto[];
    }> {
        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.sendsSubscriptionDescriptoinRepository
            .createQueryBuilder('description')
            .take(take)
            .skip(skip)
            .orderBy('description.id', 'ASC');

        return {
            count: await query.getCount(),
            limit: take,
            entity: await query.getMany(),
        };
    }

    async getOne(id: number): Promise<SendsSubscriptionDescriptionDto> {
        const query = this.sendsSubscriptionDescriptoinRepository
            .createQueryBuilder('description')
            .andWhere('description.id = :id', { id });

        return await query.getOne();
    }

    async create(
        body: SendsSubscriptionDescriptionDto
    ): Promise<SendsSubscriptionDescriptionDto> {
        const entity = this.sendsSubscriptionDescriptoinRepository.create(body);
        await this.sendsSubscriptionDescriptoinRepository.save(entity);

        return entity;
    }

    async udapte(
        body: SendsSubscriptionDescriptionDto
    ): Promise<SendsSubscriptionDescriptionDto> {
        return await this.sendsSubscriptionDescriptoinRepository.save(body);
    }

    // Удаление записи
    async delete(id: number): Promise<boolean> {
        const query = await this.sendsSubscriptionDescriptoinRepository
            .createQueryBuilder('description')
            .where('id = :id AND deletedAt is NULL', {
                id,
            })
            .softDelete()
            .execute();

        return !!query.affected;
    }

    // Массовое удаление записей
    async deleteIds(ids: number[]): Promise<boolean> {
        const query = await this.sendsSubscriptionDescriptoinRepository
            .createQueryBuilder('description')
            .where('id IN (:...ids) AND deletedAt is NULL', {
                ids,
            })
            .softDelete()
            .execute();

        return !!query.affected;
    }
}

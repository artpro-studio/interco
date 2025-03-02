import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { SubscriptionEntity } from '../entity/subscription.entity';
import { Repository } from 'typeorm';
import { SubscriptionDto } from '../dto/subscription.dto';
import { BaseQuery } from 'src/dto/reponse.dto';

@Injectable()
export class SubscriptionRepository {
    constructor(
        @InjectRepository(SubscriptionEntity)
        private readonly subscriptionRepository: Repository<SubscriptionEntity>
    ) {}

    async getForEmail(email: string): Promise<SubscriptionDto> {
        const query = this.subscriptionRepository
            .createQueryBuilder('subscription')
            .andWhere('subscription.email = :email', { email });

        return await query.getOne();
    }

    async get(
        body: BaseQuery
    ): Promise<{ count: number; limit: number; entity: SubscriptionDto[] }> {
        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.subscriptionRepository
            .createQueryBuilder('subscription')
            .take(take)
            .skip(skip)
            .orderBy('subscription.id', 'ASC');

        return {
            count: await query.getCount(),
            limit: take,
            entity: await query.execute(),
        };
    }

    async getOne(id: number): Promise<SubscriptionDto> {
        const query = this.subscriptionRepository
            .createQueryBuilder('subscription')
            .andWhere('subscription.id = :id', { id });

        return await query.getOne();
    }

    async create(body: SubscriptionDto): Promise<SubscriptionDto> {
        const entity = this.subscriptionRepository.create(body);
        await this.subscriptionRepository.save(entity);

        return entity;
    }

    async udapte(body: SubscriptionDto): Promise<SubscriptionDto> {
        return await this.subscriptionRepository.save(body);
    }

    // Удаление записи
    async delete(id: number): Promise<boolean> {
        const query = await this.subscriptionRepository
            .createQueryBuilder('subscription')
            .where('id = :id AND deletedAt is NULL', {
                id,
            })
            .softDelete()
            .execute();

        return !!query.affected;
    }

    // Массовое удаление записей
    async deleteIds(ids: number[]): Promise<boolean> {
        const query = await this.subscriptionRepository
            .createQueryBuilder('subscription')
            .where('id IN (:...ids) AND deletedAt is NULL', {
                ids,
            })
            .softDelete()
            .execute();

        return !!query.affected;
    }
}

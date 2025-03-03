import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { BaseQuery } from 'src/dto/reponse.dto';
import { SendsSubscriptionTitleEntity } from '../entity/sends-subscriptioin-title.entity';
import { SendsSubscriptionTitleDto } from '../dto/sends-subscription/sends-subscription-title.dto';

@Injectable()
export class SendsSubscriptionTitleRepository {
    constructor(
        @InjectRepository(SendsSubscriptionTitleEntity)
        private readonly sendsSubscriptionTitleRepository: Repository<SendsSubscriptionTitleEntity>
    ) {}

    async get(body: BaseQuery): Promise<{
        count: number;
        limit: number;
        entity: SendsSubscriptionTitleDto[];
    }> {
        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.sendsSubscriptionTitleRepository
            .createQueryBuilder('title')
            .take(take)
            .skip(skip)
            .orderBy('title.id', 'ASC');

        return {
            count: await query.getCount(),
            limit: take,
            entity: await query.getMany(),
        };
    }

    async getOne(id: number): Promise<SendsSubscriptionTitleDto> {
        const query = this.sendsSubscriptionTitleRepository
            .createQueryBuilder('title')
            .andWhere('title.id = :id', { id });

        return await query.getOne();
    }

    async create(
        body: SendsSubscriptionTitleDto
    ): Promise<SendsSubscriptionTitleDto> {
        const entity = this.sendsSubscriptionTitleRepository.create(body);
        await this.sendsSubscriptionTitleRepository.save(entity);

        return entity;
    }

    async udapte(
        body: SendsSubscriptionTitleDto
    ): Promise<SendsSubscriptionTitleDto> {
        return await this.sendsSubscriptionTitleRepository.save(body);
    }

    // Удаление записи
    async delete(id: number): Promise<boolean> {
        const query = await this.sendsSubscriptionTitleRepository
            .createQueryBuilder('title')
            .where('id = :id AND deletedAt is NULL', {
                id,
            })
            .softDelete()
            .execute();

        return !!query.affected;
    }

    // Массовое удаление записей
    async deleteIds(ids: number[]): Promise<boolean> {
        const query = await this.sendsSubscriptionTitleRepository
            .createQueryBuilder('title')
            .where('id IN (:...ids) AND deletedAt is NULL', {
                ids,
            })
            .softDelete()
            .execute();

        return !!query.affected;
    }
}

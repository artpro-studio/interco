import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { BaseQuery } from 'src/dto/reponse.dto';
import { SendsSubscriptionEntity } from '../entity/sends-subscriptioin.entity';
import { SendsSubscriptionDto } from '../dto/sends-subscription/sends-subscription.dto';
import {
    getFieldsSendsSubscriptionDescription,
    getFieldsSendsSubscriptionTitle,
} from '../helpers/getFields';
import { publicFormatterListSendsSubscription } from '../helpers/getParser';
import { getFieldsTask } from 'src/task/helpers/getFields';

@Injectable()
export class SendsSubscriptionRepository {
    constructor(
        @InjectRepository(SendsSubscriptionEntity)
        private readonly sendsSubscriptionRepository: Repository<SendsSubscriptionEntity>
    ) {}

    async get(body: BaseQuery): Promise<{
        count: number;
        limit: number;
        entity: SendsSubscriptionDto[];
    }> {
        const titleFields = getFieldsSendsSubscriptionTitle('title');
        const descriptionFields =
            getFieldsSendsSubscriptionDescription('description');
        const taskFields = getFieldsTask('task');

        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.sendsSubscriptionRepository
            .createQueryBuilder('sends')
            .take(take)
            .skip(skip)
            .orderBy('sends.id', 'ASC')
            .leftJoin('sends.title', 'title')
            .addSelect(titleFields)
            .leftJoin('sends.description', 'description')
            .addSelect(descriptionFields)
            .leftJoin('sends.task', 'task')
            .addSelect(taskFields);

        return {
            count: await query.getCount(),
            limit: take,
            entity: await query.getMany(),
        };
    }

    async getOne(id: number): Promise<SendsSubscriptionDto> {
        const titleFields = getFieldsSendsSubscriptionTitle('title');
        const descriptionFields =
            getFieldsSendsSubscriptionDescription('description');

        const query = this.sendsSubscriptionRepository
            .createQueryBuilder('sends')
            .leftJoin('sends.title', 'title')
            .addSelect(titleFields)
            .leftJoin('sends.description', 'description')
            .addSelect(descriptionFields)
            .andWhere('sends.id = :id', { id });

        return await query.getOne();
    }

    async create(body: SendsSubscriptionDto): Promise<SendsSubscriptionDto> {
        const entity = this.sendsSubscriptionRepository.create(body);
        await this.sendsSubscriptionRepository.save(entity);

        return entity;
    }

    async udapte(body: SendsSubscriptionDto): Promise<SendsSubscriptionDto> {
        return await this.sendsSubscriptionRepository.save(body);
    }

    // Удаление записи
    async delete(id: number): Promise<boolean> {
        const query = await this.sendsSubscriptionRepository
            .createQueryBuilder('sends')
            .where('id = :id AND deletedAt is NULL', {
                id,
            })
            .softDelete()
            .execute();

        return !!query.affected;
    }

    // Массовое удаление записей
    async deleteIds(ids: number[]): Promise<boolean> {
        const query = await this.sendsSubscriptionRepository
            .createQueryBuilder('sends')
            .where('id IN (:...ids) AND deletedAt is NULL', {
                ids,
            })
            .softDelete()
            .execute();

        return !!query.affected;
    }
}

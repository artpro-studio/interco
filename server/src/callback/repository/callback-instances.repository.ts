
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CallbackInstancesEntity } from '../entity/callback-instances.entity';
import { FullCallbackInstancesDto } from '../dto/callback-instances/callback-instances.dto';
import { CallbackInstancesQuery } from '../dto/callback-instances/response-callback-instances.dto';
import { BaseQuery } from 'src/dto/reponse.dto';
import { CallbackDto } from '../dto/callback/callback.dto';

export class CallbackInstancesRepository {
    constructor(
        @InjectRepository(CallbackInstancesEntity) private readonly callbackInstancesRepository: Repository<CallbackInstancesEntity>
    ) {}

    async getForIDs(ids: number[]): Promise<FullCallbackInstancesDto[]> {
        const query = this.callbackInstancesRepository.createQueryBuilder('instances')
            .leftJoin('instances.callback', 'callback')
            .leftJoin('instances.instancesValue', 'instancesValue')
            .leftJoin('instancesValue.field', 'field')
            .andWhere('instances.id in (:...ids)', {ids})
            .addSelect(['instancesValue.id', 'instancesValue.value'])
            .addSelect(['field.id', 'field.name', 'field.attribute'])

        return await query.getMany();
    }

    async getOneForID(id: number): Promise<FullCallbackInstancesDto> {
        const query = this.callbackInstancesRepository.createQueryBuilder('instances')
            .leftJoin('instances.callback', 'callback')
            .leftJoin('instances.instancesValue', 'instancesValue')
            .leftJoin('instancesValue.field', 'field')
            .where('instances.id = :id', {id})
            .addSelect(['instancesValue.id', 'instancesValue.value'])
            .addSelect(['field.id', 'field.name', 'field.attribute', 'field.type'])

        return await query.getOne();
    }

    async getForSlug(body: CallbackInstancesQuery): Promise<{
        count: number,
        entity: FullCallbackInstancesDto[]
    }> {
        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.callbackInstancesRepository.createQueryBuilder('instances').skip(skip).take(take)
            .leftJoin('instances.callback', 'callback')
            .leftJoin('instances.instancesValue', 'instancesValue')
            .leftJoin('instancesValue.field', 'field')
            .where('callback.id = :id', {id: body.slug})
            .addSelect(['instancesValue.id', 'instancesValue.value'])
            .addSelect(['field.id', 'field.name', 'field.attribute'])

        if (body.search) {
            query.andWhere(`instancesValue.value iLIKE '%${body.search}%'`);
        }

        return {
            count: await query.getCount(),
            entity: await query.getMany()
        }
    }

    async get(idCallback: number, body: BaseQuery): Promise<{
        count: number,
        entity: FullCallbackInstancesDto[]
    }> {
        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.callbackInstancesRepository.createQueryBuilder('instances').skip(skip).take(take)
            .leftJoin('instances.callback', 'callback')
            .leftJoin('instances.instancesValue', 'instancesValue')
            .leftJoin('instancesValue.field', 'field')
            .where('callback.id = :id', {id: idCallback})
            .addSelect(['instancesValue.id', 'instancesValue.value'])
            .addSelect(['field.id', 'field.name', 'field.attribute'])

            if (body.search) {
                query.andWhere(`instancesValue.value iLIKE '%${body.search}%'`);
            }

        return {
            count: await query.getCount(),
            entity: await query.getMany()
        }
    }

    async create(body: CallbackDto): Promise<FullCallbackInstancesDto> {
        const entity = this.callbackInstancesRepository.create({
            callback: body
        })
        await this.callbackInstancesRepository.save(entity)

        return entity;
    }

    async delete(id: number) {
        const query = await this.callbackInstancesRepository
        .createQueryBuilder('instances')
        .where('instances.id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return !!query.affected
    }

    async deleteIds(ids: number[]): Promise<boolean> {
         const query = await this.callbackInstancesRepository
          .createQueryBuilder('instances')
          .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
          })
          .softDelete()
          .execute();

          return !!query.affected
    }
}

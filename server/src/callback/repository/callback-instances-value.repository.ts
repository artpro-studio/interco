import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CallbackInstancesValueDto } from '../dto/callback-instances-value/callback-instances-value.dto';
import { CallbackFieldDto } from '../dto/callback-field/callback-field.dto';
import { CallbackInstancesDto } from '../dto/callback-instances/callback-instances.dto';
import { CallbackInstancesValueEntity } from '../entity/callback-instances-value.entity';

export class CallbackInstancesValueRepository {
    constructor(
        @InjectRepository(CallbackInstancesValueEntity) private readonly callbackInstancesValueRepository: Repository<CallbackInstancesValueEntity>
    ) {}

    async create(body: {
        field: CallbackFieldDto,
        instance: CallbackInstancesDto,
        value: string
    }) {
        const entity = this.callbackInstancesValueRepository.create(body);
        await this.callbackInstancesValueRepository.save(entity)

        return entity;
    }

    async update(body: CallbackInstancesValueDto) {
        return await this.callbackInstancesValueRepository.save(body)
    }

    async delete(id: number) {
        const query = await this.callbackInstancesValueRepository
        .createQueryBuilder('value')
        .where('value.id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return !!query.affected
    }

    async deleteIds(ids: number[]) {
        const query = await this.callbackInstancesValueRepository
         .createQueryBuilder('value')
         .where('id IN (:...ids) AND deletedAt is NULL', {
           ids,
         })
         .softDelete()
         .execute();

         return !!query.affected
   }
}

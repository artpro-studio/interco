import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { ReferenceBookInstancesValueEntity } from '../entity/reference-book-instances-value.entity';
import { ReferenceBookAttributesDto } from '../dto/reference-book-attributes/reference-book-attributes.dto';
import { ReferenceBookInstancesDto } from '../dto/reference-book-instances/reference-book-instances.dto';
import { ReferenceBookInstancesValueDto } from '../dto/reference-book-instances-value/reference-book-instances-value.dto';

export class ReferenceBookInstancesValueRepository {
    constructor(
        @InjectRepository(ReferenceBookInstancesValueEntity) private readonly referenceBookInstancesValueRepository: Repository<ReferenceBookInstancesValueEntity>
    ) {}

    async create(body: {
        attribute: ReferenceBookAttributesDto,
        instance: ReferenceBookInstancesDto,
        value: string
        valueJson: any
    }) {
        const entity = this.referenceBookInstancesValueRepository.create(body);
        await this.referenceBookInstancesValueRepository.save(entity)

        return entity;
    }

    async update(body: ReferenceBookInstancesValueDto) {
        return await this.referenceBookInstancesValueRepository.save(body)
    }

    async delete(id: number) {
        const query = await this.referenceBookInstancesValueRepository
        .createQueryBuilder('value')
        .where('value.id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return !!query.affected
    }

    async deleteIds(ids: number[]) {
        const query = await this.referenceBookInstancesValueRepository
         .createQueryBuilder('value')
         .where('id IN (:...ids) AND deletedAt is NULL', {
           ids,
         })
         .softDelete()
         .execute();

         return !!query.affected
   }
}

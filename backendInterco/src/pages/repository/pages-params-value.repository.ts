import { InjectRepository } from "@nestjs/typeorm";
import { PagesParamsValueEntity } from "../entity/pages-params-value.entity";
import { Repository } from "typeorm";
import { PagesParamsDto } from "../dto/pages-params/pages-params.dto";
import { RecordsDto } from "../dto/records/create-records.dto";
import { PagesParamsValueDto } from "../dto/pages-params-value/pages-params-value.dto";
import { Injectable } from "@nestjs/common";

@Injectable()
export class PagesParamsValueRepository {
    constructor(
        @InjectRepository(PagesParamsValueEntity) private readonly pagesParamsValueRepository: Repository<PagesParamsValueEntity>
    ) {}

    async create(body: {
        params: PagesParamsDto,
        record: RecordsDto,
        value: string
        valueJson: any
    }) {
        const entity = this.pagesParamsValueRepository.create(body);
        await this.pagesParamsValueRepository.save(entity)

        return entity;
    }

    async update(body: PagesParamsValueDto) {
        return await this.pagesParamsValueRepository.save(body)
    }

    async delete(id: number) {
        const query = await this.pagesParamsValueRepository
        .createQueryBuilder('value')
        .where('value.id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return !!query.affected
    }

    async deleteIds(ids: number[]) {
        const query = await this.pagesParamsValueRepository
         .createQueryBuilder('value')
         .where('id IN (:...ids) AND deletedAt is NULL', {
           ids,
         })
         .softDelete()
         .execute();

         return !!query.affected
   }
}

import { InjectRepository } from "@nestjs/typeorm";
import { PagesParamsFieldEntity } from "../entity/pages-params-field.entity";
import { Repository } from "typeorm";
import { PagesParamsDto } from "../dto/pages-params/pages-params.dto";
import { RecordsDto } from "../dto/records/create-records.dto";
import { PagesParamsFieldDto } from "../dto/pages-params-field/pages-params-field.dto";
import { Injectable } from "@nestjs/common";

@Injectable()
export class PagesParamsFieldRepository {
    constructor(
        @InjectRepository(PagesParamsFieldEntity) private readonly pagesParamsFieldRepository: Repository<PagesParamsFieldEntity>
    ) {}

    async create(body: {
        params: PagesParamsDto,
        record: RecordsDto,
    }) {
        const entity = this.pagesParamsFieldRepository.create(body);
        await this.pagesParamsFieldRepository.save(entity)

        return entity;
    }

    async update(body: PagesParamsFieldDto) {
        return await this.pagesParamsFieldRepository.save(body)
    }

    async delete(id: number) {
        const query = await this.pagesParamsFieldRepository
        .createQueryBuilder('value')
        .where('value.id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return !!query.affected
    }

    async deleteIds(ids: number[]) {
        const query = await this.pagesParamsFieldRepository
         .createQueryBuilder('value')
         .where('id IN (:...ids) AND deletedAt is NULL', {
           ids,
         })
         .softDelete()
         .execute();

         return !!query.affected
   }
}

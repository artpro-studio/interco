import { InjectRepository } from '@nestjs/typeorm';
import { ILike, Repository } from 'typeorm';
import { PagesParamsEntity } from '../entity/pages-params.entity';
import { FullPagesParamsDto } from '../dto/pages-params/pages-params.dto';
import { BaseQuery } from 'src/dto/reponse.dto';
import { Injectable } from '@nestjs/common';

@Injectable()
export class PagesParamsRepository {
    constructor(
        @InjectRepository(PagesParamsEntity) private readonly pagesParamsRepository: Repository<PagesParamsEntity>,
    ) {}

    async getOneForID(id: number): Promise<FullPagesParamsDto> {
        const query = this.pagesParamsRepository.createQueryBuilder('pagesParams')
            .where('pagesParams.id = :id', {id})
        return await query.getOne();
    }

    async get(pagesId: number, body: BaseQuery): Promise<{
        count: number,
        entity: FullPagesParamsDto[]
    }> {
        try {
            const take = Number(body.limit);
            const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
            const query = this.pagesParamsRepository.createQueryBuilder('pagesParams')
                .take(take)
                .skip(skip)
                .orderBy('pagesParams.id', 'ASC')
                .leftJoin('pagesParams.pages', 'pages')
                .andWhere('pages.id = :id', {
                    id: pagesId
                });

            if (body.search) {
                query.orWhere({
                    name: ILike(`%${body.search}%`)
                })
            }

            return {
                count: await query.getCount(),
                entity: await query.getMany()
            }
        } catch (error) {
            console.log(error)
        }
    }

    async create(body: FullPagesParamsDto): Promise<FullPagesParamsDto> {
        const entity = this.pagesParamsRepository.create(body);
        await this.pagesParamsRepository.save(entity);

        return entity;
    }

     // Обновление страницы
     async update(body: FullPagesParamsDto): Promise<FullPagesParamsDto> {
        const pagesParam = await this.getOneForID(body.id)
        const entity = {
            ...pagesParam,
            ...body,
        };
        await this.pagesParamsRepository.save(entity);

        return entity
    }

    async deleteIds(ids: number[]): Promise<boolean> {
        const query = await this.pagesParamsRepository
        .createQueryBuilder('pagesParams')
        .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
        })
        .softDelete()
        .execute();

        return !!query.affected;
    }

    async delete(id: number): Promise<boolean> {
        const query = await this.pagesParamsRepository
        .createQueryBuilder('pagesParams')
        .where('id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return !!query.affected
    }
}

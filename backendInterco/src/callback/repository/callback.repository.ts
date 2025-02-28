import { InjectRepository } from '@nestjs/typeorm';
import { Repository, ILike } from 'typeorm';
import { CallbackEntity } from '../entity/callback.entity';
import { CallbackDto } from '../dto/callback/callback.dto';
import { BaseQuery } from 'src/dto/reponse.dto';
import { PagesCommentsController } from '../../pages/controller/pages-comments.controller';

export class CallbackRepository {
    constructor(
        @InjectRepository(CallbackEntity) private readonly callbackRepository: Repository<CallbackEntity>,
    ) {}

    async getForSlug(slug: string): Promise<CallbackDto> {
        const query = this.callbackRepository.createQueryBuilder('callback')
            .andWhere('callback.slug = :slug', {slug});

        return await query.getOne();
    }

    async getOneForID(id): Promise<CallbackDto> {
        return await this.callbackRepository.findOne({
            where: {
                id
            }
        })
    }

    async get(body: BaseQuery): Promise<{
        count: number,
        entity: CallbackDto[]
    }> {
        try {
            const take = Number(body.limit);
            const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
            const query = this.callbackRepository.createQueryBuilder('callback').take(take).skip(skip).orderBy('callback.id', 'ASC');
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

    async create(body: CallbackDto): Promise<CallbackDto> {
        const entity = this.callbackRepository.create(body);
        await this.callbackRepository.save(entity);

        return entity;
    }

     // Обновление страницы
     async update(body: CallbackDto): Promise<CallbackDto> {
        const referenceBook = this.getOneForID(body.id)
        const entity = {
            ...referenceBook,
            ...body,
        };
        await this.callbackRepository.save(entity);

        return entity
    }

    async deleteIds(ids: number[]): Promise<boolean> {
        const query = await this.callbackRepository
        .createQueryBuilder('callback')
        .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
        })
        .softDelete()
        .execute();

        return !!query.affected;
    }

    async delete(id: number): Promise<boolean> {
        const query = await this.callbackRepository
        .createQueryBuilder('callback')
        .where('id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return !!query.affected
    }

}

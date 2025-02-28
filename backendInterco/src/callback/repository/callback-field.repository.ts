import { InjectRepository } from '@nestjs/typeorm';
import { CallbackFieldEntity } from '../entity/callback-field.entity';
import { Repository, ILike } from 'typeorm';
import { FullCallbakcFieldDto } from '../dto/callback-field/callback-field.dto';
import { BaseQuery } from 'src/dto/reponse.dto';

export class CallbackFieldRepository {
    constructor(
        @InjectRepository(CallbackFieldEntity) private readonly callbackFieldRepository: Repository<CallbackFieldEntity>,
    ) {}

    async getForSlugForm(slugForm: string): Promise<FullCallbakcFieldDto[]> {
        const query = this.callbackFieldRepository.createQueryBuilder('callbackField')
            .leftJoin('callbackField.callback', 'callback')
            .andWhere('callback.slug = :slugForm', {
                slugForm
            })

        return await query.getMany();
    }

    async getOneForID(id): Promise<FullCallbakcFieldDto> {
        return await this.callbackFieldRepository.findOne({
            where: {
                id
            }
        })
    }

    async get(referenceBookId: number, body: BaseQuery): Promise<{
        count: number,
        entity: FullCallbakcFieldDto[]
    }> {
        try {
            const take = Number(body.limit);
            const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
            const query = this.callbackFieldRepository.createQueryBuilder('callbackField').take(take).skip(skip).orderBy('callbackField.id', 'ASC')
            .leftJoin('callbackField.callback', 'callback')
            .andWhere('callback.id = :id', {
                id: referenceBookId
            })
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

    async create(body: FullCallbakcFieldDto): Promise<FullCallbakcFieldDto> {
        const entity = this.callbackFieldRepository.create(body);
        await this.callbackFieldRepository.save(entity);

        return entity;
    }

     // Обновление страницы
     async update(body: FullCallbakcFieldDto): Promise<FullCallbakcFieldDto> {
        const referenceBook = this.getOneForID(body.id)
        const entity = {
            ...referenceBook,
            ...body,
        };
        await this.callbackFieldRepository.save(entity);

        return entity
    }

    async deleteIds(ids: number[]): Promise<boolean> {
        const query = await this.callbackFieldRepository
        .createQueryBuilder('callbackField')
        .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
        })
        .softDelete()
        .execute();

        return !!query.affected;
    }

    async delete(id: number): Promise<boolean> {
        const query = await this.callbackFieldRepository
        .createQueryBuilder('callbackField')
        .where('id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return !!query.affected
    }
}

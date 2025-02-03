import { InjectRepository } from "@nestjs/typeorm";
import { AmoCustmoFieldsEntity } from "../entity/amo-custom-fields.entity";
import { ILike, Repository } from "typeorm";
import { AmoCustmoFieldsDto } from "../dto/amo/amo-custom-fields.dto";
import { BaseQuery } from "src/dto/reponse.dto";
import { ICallbackFiledAttribute } from "../interface";

export class AmoCustomRepository {
    constructor(
        @InjectRepository(AmoCustmoFieldsEntity) private readonly amoCustmoFieldsRepository: Repository<AmoCustmoFieldsEntity>,
    ) {}

    async getOneForID(id): Promise<AmoCustmoFieldsDto> {
        return await this.amoCustmoFieldsRepository.findOne({
            where: {
                id
            }
        })
    }

    async getOneForAttribute(attribute: ICallbackFiledAttribute): Promise<AmoCustmoFieldsDto> {
        return await this.amoCustmoFieldsRepository.findOne({
            where: {
                attribute
            }
        })
    }

    async get(body: BaseQuery): Promise<{
        count: number,
        entity: AmoCustmoFieldsDto[]
    }> {
        try {
            const take = Number(body.limit);
            const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
            const query = this.amoCustmoFieldsRepository.createQueryBuilder('amo').take(take).skip(skip).orderBy('amo.id', 'ASC');
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

    async create(body: AmoCustmoFieldsDto): Promise<AmoCustmoFieldsDto | null> {
        const attributes = await this.get({
            search: '',
            page: 1,
            limit: 100,
        });
        const findItem = attributes.entity.find((el) => el.attribute === body.attribute)
        if (findItem) {
            return null;
        }
        const entity = this.amoCustmoFieldsRepository.create(body);
        await this.amoCustmoFieldsRepository.save(entity);

        return entity;
    }

     // Обновление страницы
     async update(body: AmoCustmoFieldsDto): Promise<AmoCustmoFieldsDto | null> {
        const fields = await this.get({
            search: '',
            page: 1,
            limit: 100,
        });
        const attributes = fields.entity.map((el) => el.attribute)
        const amo = await this.getOneForID(body.id)
        if (amo.attribute !== body.attribute && attributes.includes(body.attribute)) {
            return null;
        }
        const entity = {
            ...amo,
            ...body,
        };
        await this.amoCustmoFieldsRepository.save(entity);

        return entity
    }

    async deleteIds(ids: number[]): Promise<boolean> {
        const query = await this.amoCustmoFieldsRepository
        .createQueryBuilder('amo')
        .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
        })
        .softDelete()
        .execute();

        return !!query.affected;
    }

    async delete(id: number): Promise<boolean> {
        const query = await this.amoCustmoFieldsRepository
        .createQueryBuilder('amo')
        .where('id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return !!query.affected
    }
}

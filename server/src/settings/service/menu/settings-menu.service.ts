import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { BaseQuery, ResultDto } from 'src/dto/reponse.dto';
import { SettingsMenuEntity } from 'src/settings/entity/menu/settings-menu.entity';
import { ResponseListSettingsMenuDto, ResponseSettingsMenuDto, ResultSettingsMenuDto } from 'src/settings/dto/settings-menu/response-settings-menu.dto';
import { SettingsMenuDto } from 'src/settings/dto/settings-menu/settings-menu.dto';
import { PagesQuery } from 'src/pages/dto/pages/response-pages.dto';

@Injectable()
export class SettingsMenuService {
    constructor(
        @InjectRepository(SettingsMenuEntity) private readonly settingsMenuRepository: Repository<SettingsMenuEntity>,
    ) {}

    // Получение списка меню
    async get(body: BaseQuery): Promise<ResponseListSettingsMenuDto> {
        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.settingsMenuRepository.createQueryBuilder('settingsMenu')
            .take(take)
            .skip(skip)
            .orderBy('settingsMenu.id', 'ASC');

        return {
            isSuccess: true,
            entity: {
                count: await query.getCount(),
                entity: await query.getMany()
            }
        }
    }

    // Получение одного меню
    async getOne(id: number): Promise<ResultSettingsMenuDto> {
        const query = this.settingsMenuRepository.createQueryBuilder('settingsMenu')
        .andWhere('settingsMenu.id = :id', {id})
        return {
            isSuccess: true,
            entity: await query.getOne()
        }
    }

    // Создание меню
    async create(body: SettingsMenuDto): Promise<ResultSettingsMenuDto> {
        const entity = this.settingsMenuRepository.create(body);
        await this.settingsMenuRepository.save(entity);

        return {isSuccess: true, entity}
    }

    // Обновление
    async update(body: SettingsMenuDto): Promise<ResultSettingsMenuDto> {
        const page = await this.settingsMenuRepository.findOne({
            where: {
                id: body.id,
            }
        })
        const entity = {
            ...page,
            ...body,
        };
        await this.settingsMenuRepository.save(entity);

        return {isSuccess: true, entity}
    }

     // Массовое удаление страниц
     async deleteIds(ids: number[]): Promise<ResultDto> {
        const query = await this.settingsMenuRepository
        .createQueryBuilder('pages')
        .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
        })
        .softDelete()
        .execute();

        return {
        isSuccess: !!query.affected,
        message: !!query.affected
            ? 'Меню удалены'
            : 'Не удалось удалить меню',
        };
    }

    // Удаление меню
    async delete(id: number): Promise<ResultDto> {
        const query = await this.settingsMenuRepository
        .createQueryBuilder('pages')
        .where('id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return {
        isSuccess: !!query.affected,
        message: !!query.affected
            ? 'Меню удалено'
            : 'Не удалось удалить меню',
        };
    }
}

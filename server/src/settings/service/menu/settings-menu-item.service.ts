import { Injectable } from '@nestjs/common';
import { ResponseSettingsMenuItemDto, ResultSettingsMenuItemDto } from '../../dto/settings-menu/response-settings-menu-item.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { SettingsMenuItemEntity } from '../../entity/menu/settings-menu-item.entity';
import { Repository, getTreeRepository } from 'typeorm';
import { ResultDto } from 'src/dto/reponse.dto';
import { CreateSettingsMenuItemDto, SettingsMenuItemDto } from '../../dto/settings-menu/settings-menu-item.dto';
import { SettingsMenuService } from './settings-menu.service';
import { PagesService } from '../../../pages/service/pages.service';

@Injectable()
export class SettingsMenuItemService {
    constructor(
        @InjectRepository(SettingsMenuItemEntity) private readonly settingsMenuItemRepository: Repository<SettingsMenuItemEntity>,
        private readonly settingsMenuService: SettingsMenuService,
        private readonly pagesService: PagesService
    ) {}

    async onUpdateOrder(body: SettingsMenuItemDto[]): Promise<ResultDto> {
        try {
            await this.settingsMenuItemRepository.save(body)
            return { isSuccess: true }
        } catch (error) {
            return { isSuccess: false, message: 'Не удалось сохранить порядок' }
        }
    }

    async getForSlug(slug: string): Promise<ResponseSettingsMenuItemDto> {
        const query = await this.settingsMenuItemRepository.manager.getTreeRepository(SettingsMenuItemEntity).findTrees({
            depth: 2,
            relations: ['menu', 'pages']
        })

        return {
            isSuccess: true,
            entity: query.filter((el) => el.menu.slug === slug) as any
            //entity: query
        }
    }

    // Получение списка меню
    // ID - ID родителя меню
    async get(id: number): Promise<ResponseSettingsMenuItemDto> {
        // const query = this.settingsMenuItemRepository.createQueryBuilder('settingsMenu')
        // .leftJoin('settingsMenu.menu', 'menu')
        // .andWhere('menu.id = :id', {id})
        // TODO подумать на условием WHERE
        const query = await this.settingsMenuItemRepository.manager.getTreeRepository(SettingsMenuItemEntity).findTrees({
            depth: 2,
            relations: ['menu']
        })

        return {
            isSuccess: true,
            entity: query.filter((el) => el.menu.id === id) as any
            //entity: query
        }
    }

    // Получение одного меню
    async getOne(id: number): Promise<ResultSettingsMenuItemDto> {
        const query = this.settingsMenuItemRepository.createQueryBuilder('settingsMenu')
        .andWhere('settingsMenu.id = :id', {id})
        .leftJoin('settingsMenu.pages', 'pages')
        .addSelect(['pages.id', 'pages.name'])

        return {
            isSuccess: true,
            entity: await query.getOne()
        }
    }

    // Создание пункта меню
    async create(body: CreateSettingsMenuItemDto): Promise<ResultSettingsMenuItemDto> {
        let parent = null
        let pages = null
        const menu = (await this.settingsMenuService.getOne(body.menuId)).entity;
        if (!menu) {
            return {isSuccess: false, message: 'Меню не найдено'}
        }
        if (body.parentId) {
            parent = (await this.getOne(body.parentId)).entity
        }
        if (body.pagesDropDown?.value) {
            pages = (await this.pagesService.getOne(body.pagesDropDown.value)).entity
        }

        const entity = this.settingsMenuItemRepository.create({
            ...body,
            menu,
            parent,
            pages
        });
        await this.settingsMenuItemRepository.save(entity);

        return {isSuccess: true, entity}
    }

    // Обновление
    async update(body: CreateSettingsMenuItemDto): Promise<ResultSettingsMenuItemDto> {
        const page = await this.settingsMenuItemRepository.findOne({
            where: {
                id: body.id,
            }
        })
        const entity = {
            ...page,
            ...body,
        };
        await this.settingsMenuItemRepository.save(entity);

        return {isSuccess: true, entity}
    }

    // Удаление меню
    async delete(id: number): Promise<ResultDto> {
        try {
            const parent: any = (await this.getOne(id)).entity
            const children = await this.settingsMenuItemRepository.manager.getTreeRepository(SettingsMenuItemEntity).findDescendants(parent)
            const ids = children.map((el) => el.id)

            const query = await this.settingsMenuItemRepository
            .createQueryBuilder('settingsMenuItem')
            .where('id IN (:...ids) AND deletedAt is NULL', {
                ids,
            })
            .softDelete()
            .execute();

            return {
            isSuccess: !!query.affected,
            message: !!query.affected
                ? 'Страница удалена'
                : 'Не удалось удалить страницу',
            };

        } catch (error) {
            console.log(error)
        }
    }
}

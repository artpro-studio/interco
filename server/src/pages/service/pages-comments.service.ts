import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ILike, Repository } from 'typeorm';
import { ResultDto } from 'src/dto/reponse.dto';
import { RecordsEntity } from '../entity/records.entity';
import { PagesCommentsListDto, PagesCommentsQuery, ResultPagesCommentsDto } from '../dto/pages-comments/response-pages-comments.dto';
import { PagesCommentsEntity } from '../entity/pages-comments.entity';
import { CreateCommentsDto, CreatePagesCommentsDto, PagesCommentsDto } from '../dto/pages-comments/create-pages-comments.dto';
import { UserService } from 'src/user/user.service';
import { CommentStatus } from '../interface';
import { UserEntity } from 'src/user/entity/user.entity';
import { ResponseListSettingsMenuDto } from 'src/settings/dto/settings-menu/response-settings-menu.dto';

@Injectable()
export class PagesCommentsService {
    constructor(
        @InjectRepository(RecordsEntity) private readonly recordsRepository: Repository<RecordsEntity>,
        @InjectRepository(PagesCommentsEntity) private readonly pagesCommentsRepository: Repository<PagesCommentsEntity>,
        private userSerivce: UserService,
    ){}

    async isLikeComment(isLike: boolean, id: number, req:any): Promise<ResultDto> {
        try {
            const user = (await this.userSerivce.getCurrentInfo(req)).entity;
            if (!user) {
                return {isSuccess: false, message: 'Пользователь не найдена'}
            }

            const comment = await this.pagesCommentsRepository.createQueryBuilder('comments').where('comments.id = :id', {id}).getOne();
            if (!comment) {
                return {isSuccess: false, message: 'Комментарий не найден'}
            }
            const isLikeUser = !!(await this.pagesCommentsRepository.createQueryBuilder('comments')
                .andWhere('comments.id = :id', {id})
                .leftJoin('comments.userLikes', 'userLikes')
                .andWhere('userLikes.id IN (:...ids)', {ids: [user.id]})
                .getOne());

            const query = this.pagesCommentsRepository.createQueryBuilder('comments')
            .where('comments.id = :id', {id})
            .relation(PagesCommentsEntity, "userLikes")
            .of(comment)
            if (!isLikeUser) {
                await query.add(user)
            } else {
                await query.remove(user)
            }

            return {isSuccess: true}
        } catch (error) {
            console.log(error)
        }
    }

    async onSuccessStatusIds(ids:number[], status: CommentStatus): Promise<ResultDto> {
        const query = await this.pagesCommentsRepository
        .createQueryBuilder('comment')
        .update(PagesCommentsEntity)
        .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
        })
        .set({
            status
        })
        .execute();

        return {
            isSuccess: !!query.affected,
            message: !!query.affected
                ? 'Статусы обновлены'
                : 'Не удалось обновить статусы',
            };
    }

    async onSuccessStatus(id:number, status: CommentStatus): Promise<ResultDto> {
        const query = await this.pagesCommentsRepository
        .createQueryBuilder('comment')
        .update(PagesCommentsEntity)
        .where('id = :id AND deletedAt is NULL', {
            id,
        })
        .set({
            status
        })
        .execute();

        return {
            isSuccess: !!query.affected,
            message: !!query.affected
                ? 'Статус обновлен'
                : 'Не удалось обновить статус',
            };
    }

    // Получение одной записи
    async getOne(id: number): Promise<ResultPagesCommentsDto> {
        const entity = await this.pagesCommentsRepository.findOne({
            where: {
                id,
            },
            relations: ['records', 'user']
        })

        return {isSuccess: true, entity}
    }

    // Создание записи
    async create(body: CreatePagesCommentsDto): Promise<ResultPagesCommentsDto> {
        const records = await this.recordsRepository.findOne({
            where: {
                id: body.records.value
            }
        })
        if (!records) {
            return {isSuccess: false, message: 'Запись не найдена'}
        }
        const user = await this.userSerivce.findUserById(body.user.value);
        if (!user) {
            return {isSuccess: false, message: 'Пользователь не найдена'}
        }

        const entity = this.pagesCommentsRepository.create({
            ...body,
            records,
            user
        });

        await this.pagesCommentsRepository.save(entity);

        return {isSuccess: true, entity}
    }

    async createForRequest(body: CreateCommentsDto, req: any) {
        const user = (await this.userSerivce.getCurrentInfo(req)).entity;
        if (!user) {
            return {isSuccess: false, message: 'Пользователь не найдена'}
        }
        const records = await this.recordsRepository.findOne({
            where: {
                id: body.records
            }
        })
        if (!records) {
            return {isSuccess: false, message: 'Запись не найдена'}
        }

        let parent = null;
        let level = 1;
        if (body.commentId) {
            parent = await this.pagesCommentsRepository.findOne({
                where: {
                    id: body.commentId
                }
            });
            level = parent.level + 1;
        }

        const entity = this.pagesCommentsRepository.create({
            ...body,
            records,
            user,
            parent,
            level
        });

        await this.pagesCommentsRepository.save(entity);

        return {isSuccess: true, entity}
    }

    // Обновление записи
    async update(body: CreatePagesCommentsDto): Promise<ResultPagesCommentsDto> {
        const records = await this.recordsRepository.findOne({
            where: {
                id: body.records.value
            }
        })
        if (!records) {
            return {isSuccess: false, message: 'Запись не найдена'}
        }
        const user = await this.userSerivce.findUserById(body.user.value);
        if (!user) {
            return {isSuccess: false, message: 'Пользователь не найдена'}
        }

        const comments = await this.pagesCommentsRepository.findOne({
            where: {
                id: body.id,
            },
            relations: ['records', 'user']
        })
        const entity = {
            ...comments,
            ...body,
            user,
            records

        };
        await this.pagesCommentsRepository.update(entity.id, entity);

        return {isSuccess: true, entity}
    }

    // Список записей
    async get(body: PagesCommentsQuery): Promise<PagesCommentsListDto> {
        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.pagesCommentsRepository.createQueryBuilder('comments').take(take).skip(skip).orderBy('comments.id', 'ASC')
        .leftJoin('comments.records', 'records')
        .leftJoin('records.pages', 'pages')

        if (body.id) {
            query.andWhere({
                records: body.id
            })
        }

        if (body.blogId) {
            query.andWhere('pages.id = :id', {
                id: body.blogId
            })
        }
        if (body.search) {
            query.orWhere({
                content: ILike(`%${body.search}%`)
            })
        }

        if (body.status) {
            query.andWhere({
                status: body.status
            })
        }

        return {
            isSuccess: true,
            entity: {
                count: await query.getCount(),
                entity: await query.getMany()
            }
        }
    }

    async getTree(body: PagesCommentsQuery, req: any): Promise<PagesCommentsListDto> {
        try {
            const user = (await this.userSerivce.getCurrentInfo(req)).entity;
            const take = Number(body.limit);
            const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
            const {level} = await this.pagesCommentsRepository.createQueryBuilder('comments')
                .select('MAX(comments.level)', 'level').getRawOne();

            const query = this.pagesCommentsRepository.createQueryBuilder('comments')
            .take(take)
            .skip(skip)
            .orderBy('comments.id', 'ASC')
            .leftJoin('comments.records', 'records')
            .leftJoin('records.pages', 'pages')
            .loadRelationCountAndMap('comments.countLikes', 'comments.userLikes')
            .leftJoinAndSelect("comments.children", "children", "children.status = :status", {
                children: CommentStatus.SUCCESS,
            })
            // .leftJoinAndMapOne('comments.isLike', 'comments.userLikes', 'isLikes', `isLikes.id = ${user.id}`)
            .leftJoin('comments.userLikes', 'isLikes', `isLikes.id = ${user.id}`)
            // .leftJoin('comments.userLikes', 'userLikes')
            // .leftJoin('comments.userLikes', 'comments.userLikes', 'userLikes')
            .addSelect('"isLikes".id is not null', 'isLiked')

            // .leftJoinAndSelect('comments.userLikes', 'userLikes')

            // .leftJoinAndMapMany('comments.userLikes', (qb) => {
            //     return qb.select().from(UserEntity, 'user')
            // }, 'userLikes', '"user"."id" = "comments_userLikes"."userId"' )

            .leftJoinAndSelect((qb) => {
                const subQuery = qb
                .subQuery()
                .select()
                .from(UserEntity, 'user')
                .limit(5)
                return subQuery
            }, 'users', `"users"."id" = comments_isLikes.userId`)
            // .addSelect((qb) => {
            //     console.log(qb)
            //     return qb;
            // }, 'users')
            // .leftJoinAndMapOne("comments.userLikes",
            //     subQuery => {
            //         return subQuery
            //             .select()
            //             .from(UserEntity, 'user')
            //             .limit(1);
            //     }, 'userLikes', 'comments.userLikes in user.id')

            .andWhere('comments.parent IS NULL')
            .andWhere('comments.status = :status', {
                status: CommentStatus.SUCCESS
            })

            console.log( await query.getQuery())

            for(let i = 1; i <= level; i++) {
                query.leftJoinAndSelect(`children.children`, `children${i}`, `children${i}.status = :status`, {
                    status: CommentStatus.SUCCESS,
                })
                .loadRelationCountAndMap(`children${i}.countLikes`, `children${i}.userLikes`)
            }


            if (body.id) {
                query.andWhere({
                    records: body.id
                })
            }

            if (body.blogId) {
                query.andWhere('pages.id = :id', {
                    id: body.blogId
                })
            }
            if (body.search) {
                query.orWhere({
                    content: ILike(`%${body.search}%`)
                })
            }

            if (body.status) {
                query.andWhere({
                    status: body.status
                })
            }

            return {
                isSuccess: true,
                entity: {
                    count: await query.getCount(),
                    entity: await query.getMany()
                }
            }
        } catch (error) {
            console.log(error);
            return {isSuccess: false, entity: {count: 0, entity: null}}
        }
    }

    // Удаление записи
    async delete(id: number): Promise<ResultDto> {
        const query = await this.pagesCommentsRepository
        .createQueryBuilder('comments')
        .where('id = :id AND deletedAt is NULL', {
            id,
        })
        .softDelete()
        .execute();

        return {
        isSuccess: !!query.affected,
        message: !!query.affected
            ? 'Запись удалена'
            : 'Не удалось удалить запись',
        };
    }

    // Массовое удаление записей
    async deleteIds(ids: number[]): Promise<ResultDto> {
        const query = await this.pagesCommentsRepository
        .createQueryBuilder('comments')
        .where('id IN (:...ids) AND deletedAt is NULL', {
            ids,
        })
        .softDelete()
        .execute();

        return {
        isSuccess: !!query.affected,
        message: !!query.affected
            ? 'Записи удалены'
            : 'Не удалось удалить записи',
        };
    }
}

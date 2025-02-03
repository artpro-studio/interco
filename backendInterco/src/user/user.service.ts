import { ResultDto } from 'src/dto/reponse.dto';
import { Inject, Injectable, UnauthorizedException, forwardRef } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { BaseQuery } from 'src/dto/reponse.dto';
import { ILike, IsNull, Repository } from 'typeorm';
import { UserListDto, ResultUserDto, UserFilterDto } from './dto/response-user.dto';
import { UserDto } from './dto/user.dto';
import { UserEntity } from './entity/user.entity';
import * as bcrypt from 'bcrypt';
import { Role } from './role-interface';
import { AuthService } from 'src/auth/auth.service';
import { DropDownDto, ResultDropDownDto } from 'src/dto/response-drop-down.dto';

// Соль для кеширования пароля
const saltOrRounds = 10;

@Injectable()
export class UserService {
  constructor(
    @Inject(forwardRef(() => AuthService))
        private authService: AuthService,
    @InjectRepository(UserEntity)
    private readonly userRepository: Repository<UserEntity>,
  ) {}

    async getSelect(body: BaseQuery): Promise<ResultDropDownDto> {
        const take = Number(body.limit);
        const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
        const query = this.userRepository.createQueryBuilder('users').take(take).skip(skip).orderBy('users.id', 'ASC');
        query.select('id', 'value').addSelect(['users.lastName', 'users.firstName', 'users.middleName'])

        const result = await query.execute()

        const entity: DropDownDto[] = result.map((el) => {
            return {
                value: el.value,
                label: `${el.users_lastName} ${el.users_firstName} ${el.users_middleName}`
            }
        })

        return {
            isSuccess: true,
            entity: {
                count: await query.getCount(),
                entity
            }
        }
    }

  // Получение пользователя по email
  async findUserByEmail(email: string): Promise<UserDto> {
    const user = await this.userRepository.findOne({
      where: {
        email,
        deletedAt: null,
      },
    });

    return user;
  }

  // Получение пользователя по id
  async findUserById(id: number): Promise<UserDto> {
    const user = await this.userRepository.findOne({
      where: {
        id,
        deletedAt: null,
      },
    });

    return user;
  }

  // Получение пользователей
  async get(body: UserFilterDto): Promise<UserListDto> {
    const take = Number(body.limit);
    const skip = body.page === 1 ? 0 : (Number(body.page) - 1) * take;
    const query = this.userRepository
      .createQueryBuilder('user')
      .take(take)
      .skip(skip);

    if (body.search) {
      query.orWhere({
          firstName: ILike(`%${body.search}%`)
      }).orWhere({
          lastName: ILike(`%${body.search}%`)
      }).orWhere({
          middleName: ILike(`%${body.search}%`)
      }).orWhere({
          email: ILike(`%${body.search}%`)
      });
    }

    if (body.role) {
      if (Array.isArray(body.role)) {
        body.role.forEach((el: string) => {
          query.orWhere({
            role: el,
          })
        })
      } else {
        query.andWhere({
          role: body.role,
        })
      }

    }

    const entity: UserDto[] = await query.getMany();

    return {
      isSuccess: true,
      entity: {
        count: await query.getCount(),
        entity,
      },
    };
  }

  // Получение пользователя
  async getOne(id: number): Promise<ResultUserDto> {
    const user = await this.findUserById(id);

    return {
      isSuccess: true,
      entity: user,
    };
  }

  // Создание пользователя
  async create(body: UserDto, isAdmin: boolean = false): Promise<ResultUserDto> {
    let isSuccess = false;
    let user = await this.findUserByEmail(body.email);
    if (!user) {
      const hash = await bcrypt.hash(body.password, saltOrRounds);

      body.role = isAdmin ? Role.Admin : Role.Guest
      user = this.userRepository.create({
        ...body,
        password: hash,
      });
      await this.userRepository.save(user);

      isSuccess = true;
    }

    return {
      isSuccess: isSuccess,
      entity: isSuccess ? user : undefined,
      message: isSuccess
        ? 'Пользователь создан'
        : 'Пользователь с таким email уже существует',
    };
  }

  // Обновление пользователя
  async update(body: UserDto): Promise<ResultUserDto> {
    let isSuccess = false;
    let user = await this.findUserById(body.id);
    const { createdAt, updatedAt, ...result } = body;

    if (body.password) {
      const hash = await bcrypt.hash(body.password, saltOrRounds);
      body.password = hash;
    }

    if (user) {
      user = {
        ...user,
        ...result,
      };
      this.userRepository.update(user.id, user);
      await this.userRepository.save(user);

      isSuccess = true;
    }

    return {
      isSuccess: isSuccess,
      entity: isSuccess ? user : undefined,
      message: isSuccess ? 'Пользователь обновлен' : 'Пользователь не найден',
    };
  }

  // Удаление пользователя
  async delete(id: number): Promise<ResultDto> {
    const query = await this.userRepository
      .createQueryBuilder('user')
      .where('id = :id AND deletedAt is NULL', {
        id,
      })
      .softDelete()
      .execute();

    return {
      isSuccess: !!query.affected,
      message: !!query.affected
        ? 'Пользователь удален'
        : 'Не удалось удалить пользователя',
    };
  }

  // Удаление пользователей по ids
  async deleteIds(ids: number[]): Promise<ResultDto> {
    const query = await this.userRepository
      .createQueryBuilder('user')
      .where('id IN (:...ids) AND deletedAt is NULL', {
        ids,
      })
      .softDelete()
      .execute();

    return {
      isSuccess: !!query.affected,
      message: !!query.affected
        ? 'Пользователь удален'
        : 'Не удалось удалить пользователя',
    };
  }

  // Обновление паролья
  async updatePassword(user: UserDto, password: string): Promise<boolean> {
    const entity = await this.userRepository.findOne({
        where: {
            id: user.id
        }
    });

    const hash = await bcrypt.hash(password, saltOrRounds);

    entity.password = hash;

    await this.userRepository.save(entity);

    return true;
  }

  // Активация пользователя
  async updateStatus(user: UserDto): Promise<boolean> {
    const entity = await this.userRepository.findOne({
        where: {
            id: user.id
        }
    });
    entity.isActive = true;

    await this.userRepository.save(entity);

    return true;
  }

  // Получение информации о текущем пользователе
  async getCurrentInfo(req): Promise<ResultUserDto>  {
    const header = req.headers.authorization;
    const bearer = header.split(' ')[0];
    const token = header.split(' ')[1];

    if (bearer !== 'Bearer' && !token) {
        throw new UnauthorizedException({
            message: 'Вы не авторизованы',
            isSuccess: false,
          });
    }

    const { id } = this.authService.verifyToken(token);
    const entity = await (await this.getOne(id)).entity;

    return {
        isSuccess: true,
        entity
    };
}
}

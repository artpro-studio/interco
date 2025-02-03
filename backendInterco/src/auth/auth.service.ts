import { ResultDto } from './../dto/reponse.dto';
import { Role } from './../user/role-interface';
import { UserService } from './../user/user.service';
import { UserDto } from './../user/dto/user.dto';
import { TypeAuthConfirm } from './constants';
import { AuthConfirmDto } from './dto/create-auth-confirm.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { AuthConfirmEntity } from './entities/auth-confirm.entity';
import { NodeMailerService } from './../node-mailer/node-mailer.service';
import {GenerateUserTokenDto} from './dto/generate-user-token.dto';
import {LoginDto, RegisterDto, ResultLogin} from './dto/login.dto';
import { forwardRef, Inject, Injectable, UnauthorizedException, HttpStatus, HttpException } from '@nestjs/common';
import * as bcrypt from 'bcrypt';
import {JwtService} from '@nestjs/jwt';
import { Repository } from 'typeorm';

@Injectable()
export class AuthService {
    constructor(
        @Inject(forwardRef(() => UserService))
        private usersService: UserService,
        private nodeMailerSerivce: NodeMailerService,
        private jwtService: JwtService,
        @InjectRepository(AuthConfirmEntity) private readonly authConfirmRepository: Repository<AuthConfirmEntity>,
    ) {}

    // Валидация авторизации
    async validateUser(body: LoginDto): Promise<UserDto | null> {
        if (!body.password) {
            throw new UnauthorizedException({
                message: 'Вы ввели не верную почту или пароль',
                status: false,
                statusCode: 200,
              });
        }
        
        const user = await this.usersService.findUserByEmail(body.email);
        if (user) {
            console.log(body.password, user.password)
            const isMatch = await bcrypt.compare(body.password, user.password);
       
            if (isMatch) {
              return user;
            } 
        }
        
        return null;
        
    }
    // Создание токена
    async generateToken(user: UserDto): Promise<string> {
        const payload: GenerateUserTokenDto = {
            id: user.id.toString(),
            email: user.email,
            role: user.role,
        };

        return this.jwtService.sign(payload, {
            //secret: 'portal-jkh-pay',
            algorithm:'HS512',
            privateKey: 'dvRZbtaVDXu34h0STl9yE4HE4hA3gRPortalJkhPay',
        });
    }

    // Расшифоровка токена
    decodeToken(token: string): any {
        return this.jwtService.decode(token);
    }

    // Проверка токена
    verifyToken(token: string) {
        return this.jwtService.verify(token);
    }

    // Созданем запись на регистрацию или смену пароль для подвторждения
    async createConfirm(type: TypeAuthConfirm, user: UserDto): Promise<AuthConfirmDto> {
        const entity = this.authConfirmRepository.create({
            isActive: true,
            type,
            user,
        });

        await this.authConfirmRepository.save(entity);

        return entity;

    }

    // Подтверждение почты
    async confirmEmail(uuid: string): Promise<ResultDto> {
        const confirm = await this.authConfirmRepository.findOne({
            where: {
                uuid,
                isActive: true,
            },
            relations: ['user']
        });
    
        if (!confirm) {
            throw new HttpException('Forbidden', HttpStatus.FORBIDDEN);
            return { isSuccess: false, message:'Не найдена запись'};
        }
        confirm.isActive = false;

        await this.authConfirmRepository.save(confirm);

        await this.usersService.updateStatus(confirm.user);

        return { isSuccess: true};

    }

    async confirmReplace(email: string): Promise<ResultDto> {
        const user = await this.usersService.findUserByEmail(email);

        if (!user) {
            return {
                isSuccess: false, 
                message: 'Пользователь не найден' 
            };
        }

        const createConfirm = await this.createConfirm(TypeAuthConfirm.Replace, user);

        this.nodeMailerSerivce.setConfirmResetPassword(email, createConfirm.uuid);

        return {
            isSuccess: true
        };
    }

    async replacePassword(uuid: string, password: string): Promise<ResultDto> {
        const confirm = await this.authConfirmRepository.findOne({
            where: {
                uuid,
                isActive: true,
            },
            relations: ['user']
        });
        if (!confirm) {
            return { isSuccess: false, message:'Не найдена запись'};
        }

        confirm.isActive = false;

        await this.authConfirmRepository.save(confirm);

        await this.usersService.updatePassword(confirm.user, password);

        return {isSuccess: true};
    }

    // Есть ли активный UUID
    async isActiveUUID(uuid: string): Promise<ResultDto> {
        const entity = await this.authConfirmRepository.findOne({
            where: {
                uuid,
                isActive: true
            }
        });

        if (!entity) {
            return {isSuccess: false, message: 'Нет активной записи'};
        }

        return {isSuccess: true};
    }

    // Авторизация
    async login(body: LoginDto): Promise<ResultLogin> {
        const user = await this.validateUser(body);
        console.log('asdasd')
        if (!user) {
            return {
                isSuccess: false,
                message: 'Вы ввели не верную почту или пароль',
            };
        }
  
        const token = await this.generateToken(user);
        return {
            isSuccess: true,
            entity: {
                token, 
                entity: user
            }
        };
    }

    async register(body: RegisterDto): Promise<ResultDto> {
        const secret = 'LbwU883cfUkrApnwdYNA';
        let role = Role.Guest;
        if (body.secret === secret) {
            role = Role.Admin;
        }

        const user = await this.usersService.create({
            id: null,
            createdAt: new Date(),
            updatedAt: new Date(),
            isActive: false,
            deletedAt: null,
            email: body.email,
            password: body.password,
            firstName: body.firstName,
            lastName: body.lastName,
            middleName: body.middleName,
            role,
        });

        if (!user.isSuccess) {
            return { isSuccess: false, message:'Произошла ошибка'};
        }

        const createConfirm = await this.createConfirm(TypeAuthConfirm.Register, user.entity);

        this.nodeMailerSerivce.setRegister({
            firstName: body.firstName,
            lastName: body.lastName,
            middleName: body.middleName,
            email: body.email,
        }, createConfirm.uuid);

        return { isSuccess: true};
    }
}

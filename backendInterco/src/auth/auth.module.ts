import { UserModule } from './../user/user.module';
import { AuthConfirmEntity } from './entities/auth-confirm.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { NodeMailerModule } from './../node-mailer/node-mailer.module';
import { jwtConstants } from './constants';
// @ts-ignore
import { JwtModule } from '@nestjs/jwt';
import { forwardRef, Module } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { LocalStrategy } from './local.strategy';
import { PassportModule } from '@nestjs/passport';
import { JwtStrategy } from './jwt.strategy';

@Module({
  imports:[
    TypeOrmModule.forFeature([AuthConfirmEntity]),
    forwardRef(() => UserModule),
    PassportModule,
    NodeMailerModule,
    JwtModule.register({
      secretOrPrivateKey: jwtConstants.secret,
      signOptions: { expiresIn: '24h' },
    }),
  ],
  controllers: [AuthController],
  providers: [AuthService, LocalStrategy, JwtStrategy],
  exports: [
    JwtModule,
    JwtStrategy,
    AuthService,
  ]
})
export class AuthModule {}

import { SettingsModule } from './settings/settings.module';
import { AuthModule } from './auth/auth.module';
import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UserModule } from './user/user.module';
import { NodeMailerModule } from './node-mailer/node-mailer.module';
import { PagesModule } from './pages/pages.module';
import { LibraryFilesModule } from './library-files/library-files.module';
import { ReferenceBookModule } from './reference-book/reference-book.module';
import { CallbackModule } from './callback/callback.module';
import { APP_FILTER } from '@nestjs/core';
import { HttpExceptionFilter } from './filter/http-exception.filter';
import dataSource from './data-source';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    TypeOrmModule.forRoot({
        ...dataSource.options
    }),
    UserModule,
    AuthModule,
    NodeMailerModule,
    SettingsModule,
    PagesModule,
    LibraryFilesModule,
    ReferenceBookModule,
    CallbackModule,
  ],
  controllers: [AppController],
  providers: [AppService, {
    provide: APP_FILTER,
    useClass: HttpExceptionFilter,
  }],
})
export class AppModule {}

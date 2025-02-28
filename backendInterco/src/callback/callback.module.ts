import { Module, forwardRef } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CallbackController } from './controller/callback.controller';
import { CallbackRepository } from './repository/callback.repository'
import { CallbackEntity } from './entity/callback.entity';
import { CallbackFieldEntity } from './entity/callback-field.entity';
import { CallbackInstancesEntity } from './entity/callback-instances.entity';
import { CallbackInstancesValueEntity } from './entity/callback-instances-value.entity';
import { CallbackFieldRepository } from './repository/callback-field.repository';
import { CallbackFieldService } from './service/callback-field.service';
import { CallbackFieldController } from './controller/callback-field.controller';
import { CallbackInstancesRepository } from './repository/callback-instances.repository';
import { CallbackInstancesValueRepository } from './repository/callback-instances-value.repository';
import { CallbackInstancesService } from './service/callback-instances.service';
import { CallbackInstancesController } from './controller/callback-instanices.controller';
import { BitrixService } from './service/bitrix.service';
import { NodeMailerModule } from 'src/node-mailer/node-mailer.module';
import { HttpModule } from '@nestjs/axios';
import { SettingsModule } from 'src/settings/settings.module';
import { ConfigModule } from '@nestjs/config';
import { AmoCrmService } from './service/amo-crm.service';
import { AmoCustomRepository } from './repository/amo-custom-fields.repository';
import { AmoCustmoFieldsEntity } from './entity/amo-custom-fields.entity';
import { AmoCustomFieldsController } from './controller/amo-custom-fields.controller';
import { PublicCallbackService } from './service/public-callback.service';
import { PublicCallbackController } from './controller/public-callback.controller';

const repository = [
    CallbackRepository,
    CallbackFieldRepository,
    CallbackInstancesRepository,
    CallbackInstancesValueRepository,
    AmoCustomRepository,
]

const service = [
    CallbackFieldService,
    CallbackInstancesService,
    BitrixService,
    AmoCrmService,
    PublicCallbackService,
]

@Module({
    imports: [
        ConfigModule.forRoot({ isGlobal: true }),
        TypeOrmModule.forFeature([
            CallbackEntity,
            CallbackFieldEntity,
            CallbackInstancesEntity,
            CallbackInstancesValueEntity,
            AmoCustmoFieldsEntity
        ]),
        HttpModule.register({
            timeout: 10000,
            maxRedirects: 5,
        }),
        forwardRef(() => NodeMailerModule),
        forwardRef(() => SettingsModule)
    ],
    controllers: [CallbackController, CallbackFieldController, CallbackInstancesController, AmoCustomFieldsController, PublicCallbackController],
    providers: [...repository, ...service],
    exports: [...repository, ...service],
})
export class CallbackModule {}

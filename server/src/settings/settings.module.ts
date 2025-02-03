import { UserModule } from './../user/user.module';
import { SettingsService } from './service/settings.service';
import { SettingsController } from './controller/settings.controller';
import { SettingsContactsEntity } from './entity/settings-contacts.entity';
import { SettingsEntity } from './entity/settings.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Module, forwardRef } from '@nestjs/common';
import { SettingsContactsController } from './controller/settings-contacts.controller';
import { SettingsContactsService } from './service/settings-contacts.service';
import { SettingsMenuItemEntity } from './entity/menu/settings-menu-item.entity';
import { SettingsMenuItemController } from './controller/menu/settings-menu-item.controller';
import { SettingsMenuItemService } from './service/menu/settings-menu-item.service';
import { SettingsMenuEntity } from './entity/menu/settings-menu.entity';
import { SettingsMenuService } from './service/menu/settings-menu.service';
import { SettingsMenuController } from './controller/menu/settings-menu.controller';
import { PagesModule } from 'src/pages/pages.module';
import { SettingsPublicController } from './controller/settings-public.controller';

@Module({
    imports: [
        TypeOrmModule.forFeature([SettingsEntity, SettingsContactsEntity, SettingsMenuEntity, SettingsMenuItemEntity]),
        UserModule,
        forwardRef(() => PagesModule)
    ],
    controllers: [SettingsController, SettingsContactsController, SettingsMenuController, SettingsMenuItemController, SettingsPublicController],
    providers: [SettingsService, SettingsContactsService, SettingsMenuService, SettingsMenuItemService],
    exports: [SettingsService, SettingsContactsService, SettingsMenuService, SettingsMenuItemService]
})
export class SettingsModule {};

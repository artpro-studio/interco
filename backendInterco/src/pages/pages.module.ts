import { Module, forwardRef } from '@nestjs/common';
import { PagesService } from './service/pages.service';
import { PagesController } from './controller/pages.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PagesEntity } from './entity/pages.entity';
import { RecordsEntity } from './entity/records.entity';
import { PagesCommentsEntity } from './entity/pages-comments.entity';
import { RecordsController } from './controller/records.controller';
import { RecordsService } from './service/records.service';
import { UserModule } from 'src/user/user.module';
import { PagesCommentsController } from './controller/pages-comments.controller';
import { PagesCommentsService } from './service/pages-comments.service';
import { PagesComponentsEntity } from './entity/pages-components.entity';
import { PagesComponentsController } from './controller/pages-components.controller';
import { PagesComponentsService } from './service/pages-components.service';
import { PagesPublicController } from './controller/pages-public.controller';
import { PagesParamsEntity } from './entity/pages-params.entity';
import { PagesParamsValueEntity } from './entity/pages-params-value.entity';
import { PagesParamsService } from './service/pages-params.service';
import { PagesParamsRepository } from './repository/pages-params.repository';
import { PagesParamsController } from './controller/pages-params.controller';
import { PagesParamsValueRepository } from './repository/pages-params-value.repository';
import { RecordsRepository } from './repository/records.repository';
import { PagesRepository } from './repository/pages.repository';
import { PagesSeoEntity } from './entity/pages-seo.entity';
import { PagesSeoParamsEntity } from './entity/pages-seo-params.entity';
import { PagesSeoRepository } from './repository/pages-seo.respository';
import { PagesSeoParamsRepository } from './repository/pages-seo-params.repository';
import { PagesIblockEntity } from './entity/pages-iblock.entity';
import { PagesIBlockFieldsEntity } from './entity/pages-iblock-fields.entity';
import { PagesIblockFieldsLabelEntity } from './entity/pages-iblock-fields-label.entity';
import { PagesIblockRecordsEntity } from './entity/pages-iblock-records.entity';
import { PagesIblockRepository } from './repository/pages-iblock.repository';
import { PagesIblockFieldsRepository } from './repository/pages-iblock-fields.repository';
import { PagesIblockFieldsLabelRepository } from './repository/pages-iblock-fields-label.repository';
import { PagesIblockController } from './controller/pages-iblock.controller';
import { PagesIblockService } from './service/pages-iblock.service';
import { PagesIblockRecordsFieldEntity } from './entity/pages-iblock-records-field.entity';
import { PagesIblockRecordsFieldValueEntity } from './entity/pages-iblock-records-field-value.entity';
import { PagesIblockRecordsRepository } from './repository/pages-iblock-records.repository';
import { PagesIblockRecordsFieldRepository } from './repository/pages-iblock-records-field.repository';
import { PagesIblockRecordsFieldValueRepository } from './repository/pages-iblock-records-field-value.repository';
import { PagesIblockRecordsController } from './controller/pages-iblock-recrods.controller';
import { PagesIblockRecordsService } from './service/pages-iblock-records.service';

const services = [PagesService,  RecordsService, PagesCommentsService, PagesComponentsService, PagesParamsService, PagesIblockService, PagesIblockRecordsService];
const respositorys = [
    PagesRepository,
    RecordsRepository,
    PagesParamsRepository,
    PagesParamsValueRepository,
    PagesSeoRepository,
    PagesSeoParamsRepository,
    PagesIblockRepository,
    PagesIblockFieldsRepository,
    PagesIblockFieldsLabelRepository,
    PagesIblockRecordsRepository,
    PagesIblockRecordsFieldRepository,
    PagesIblockRecordsFieldValueRepository,
];
@Module({
  imports: [
    TypeOrmModule.forFeature([
        PagesEntity,
        RecordsEntity,
        PagesCommentsEntity,
        PagesComponentsEntity,
        PagesParamsEntity,
        PagesParamsValueEntity,
        PagesSeoEntity,
        PagesSeoParamsEntity,
        PagesIblockEntity,
        PagesIBlockFieldsEntity,
        PagesIblockFieldsLabelEntity,
        PagesIblockRecordsEntity,
        PagesIblockRecordsFieldEntity,
        PagesIblockRecordsFieldValueEntity,
    ]),
    forwardRef(() => UserModule)
  ],
  controllers: [PagesController, RecordsController, PagesCommentsController, PagesComponentsController, PagesPublicController, PagesParamsController, PagesIblockController, PagesIblockRecordsController],
  providers: [...services, ...respositorys],
  exports: [PagesService]
})
export class PagesModule {}

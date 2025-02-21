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
import { PagesParamsFieldEntity } from './entity/pages-params-field.entity';
import { PagesParamsService } from './service/pages-params.service';
import { PagesParamsRepository } from './repository/pages-params.repository';
import { PagesParamsController } from './controller/pages-params.controller';
import { PagesParamsFieldRepository } from './repository/pages-params-field.repository';
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
import { PagesSeoService } from './service/pages-seo.service';
import { PagesIblockSectionRepository } from './repository/pages-iblock-section.repository';
import { PagesIblockSectionValueRepository } from './repository/pages-iblock-section-value.repository';
import { PagesIblockSectionEntity } from './entity/pages-iblock-section.entity';
import { PagesIblockSectionValueEntity } from './entity/pages-iblock-section-value.entity';
import { PagesPublicService } from './service/page-public.service';
import { RecordsSeoRepository } from './repository/recrods-seo.repository';
import { RecordsSeoParamsRepository } from './repository/records-seo-params.repository';
import { RecordsTitleRepository } from './repository/records-title.repository';
import { RecordsTitleValueRepository } from './repository/records-title-value.repository';
import { RecordsDescriptionRepository } from './repository/records-description.repository';
import { RecordsDescriptionValueRepository } from './repository/records-description-value.repository';
import { RecordsSeoEntity } from './entity/records-seo.entity';
import { RecordsSeoParamsEntity } from './entity/records-seo-params.entity';
import { RecordsTitleEntity } from './entity/records-title.entity';
import { RecordsTitleValueEntity } from './entity/records-title-value.entity';
import { RecordsDescriptionEntity } from './entity/records-description.entity';
import { RecordsDescriptionValueEntity } from './entity/records-description-value.entity';
import { PagesParamsFieldValueEntity } from './entity/pages-params-field-value.entity';
import { PagesParamsFieldValueRepository } from './repository/pages-params-field-value.repository';

const services = [
    PagesService,
    RecordsService,
    PagesCommentsService,
    PagesComponentsService,
    PagesParamsService,
    PagesIblockService,
    PagesIblockRecordsService,
    PagesSeoService,
    PagesPublicService
];
const respositorys = [
    PagesRepository,
    RecordsRepository,
    PagesParamsRepository,
    PagesParamsFieldRepository,
    PagesParamsFieldValueRepository,
    PagesSeoRepository,
    PagesSeoParamsRepository,
    PagesIblockRepository,
    PagesIblockFieldsRepository,
    PagesIblockFieldsLabelRepository,
    PagesIblockRecordsRepository,
    PagesIblockRecordsFieldRepository,
    PagesIblockRecordsFieldValueRepository,
    PagesIblockSectionRepository,
    PagesIblockSectionValueRepository,
    RecordsSeoRepository,
    RecordsSeoParamsRepository,
    RecordsTitleRepository,
    RecordsTitleValueRepository,
    RecordsDescriptionRepository,
    RecordsDescriptionValueRepository,
];
@Module({
    imports: [
        TypeOrmModule.forFeature([
            PagesEntity,
            RecordsEntity,
            PagesCommentsEntity,
            PagesComponentsEntity,
            PagesParamsEntity,
            PagesParamsFieldEntity,
            PagesParamsFieldValueEntity,
            PagesSeoEntity,
            PagesSeoParamsEntity,
            PagesIblockEntity,
            PagesIBlockFieldsEntity,
            PagesIblockFieldsLabelEntity,
            PagesIblockRecordsEntity,
            PagesIblockRecordsFieldEntity,
            PagesIblockRecordsFieldValueEntity,
            PagesIblockSectionEntity,
            PagesIblockSectionValueEntity,
            RecordsSeoEntity,
            RecordsSeoParamsEntity,
            RecordsTitleEntity,
            RecordsTitleValueEntity,
            RecordsDescriptionEntity,
            RecordsDescriptionValueEntity,
        ]),
        forwardRef(() => UserModule)
    ],
    controllers: [
        PagesController,
        RecordsController,
        PagesCommentsController,
        PagesComponentsController,
        PagesPublicController,
        PagesParamsController,
        PagesIblockController,
        PagesIblockRecordsController
    ],
    providers: [...services, ...respositorys],
    exports: [PagesService]
})
export class PagesModule {}

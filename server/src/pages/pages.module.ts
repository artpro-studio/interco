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

@Module({
  imports: [
    TypeOrmModule.forFeature([
        PagesEntity,
        RecordsEntity,
        PagesCommentsEntity,
        PagesComponentsEntity,
        PagesParamsEntity,
        PagesParamsValueEntity
    ]),
    forwardRef(() => UserModule)
  ],
  controllers: [PagesController, RecordsController, PagesCommentsController, PagesComponentsController, PagesPublicController, PagesParamsController],
  providers: [PagesService, PagesRepository, RecordsService, RecordsRepository, PagesCommentsService, PagesComponentsService, PagesParamsService, PagesParamsRepository, PagesParamsValueRepository],
  exports: [PagesService]
})
export class PagesModule {}

import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ReferenceBookController } from './controller/reference-book.controller';
import { ReferenceBookEntity } from './entity/reference-book.entity';
import { ReferenceBookAttributesEntity } from './entity/reference-book-attributes.entity';
import { ReferenceBookInstancesEntity } from './entity/reference-book-instances.entity';
import { ReferenceBookInstancesValueEntity } from './entity/reference-book-instances-value.entity';
import { ReferenceBookRepository } from './repository/reference-book-repository';
import { ReferenceBookAttributeController } from './controller/reference-book-attributes.controller';
import { ReferenceBookAttributesRepository } from './repository/reference-book-attributes.repository';
import { ReferenceBookAttributesService } from './service/reference-book-attributes.service';
import { ReferenceBookInstancesService } from './service/reference-book-instances.service';
import { ReferenceBookInstancesRepository } from './repository/reference-book-instances.repository';
import { ReferenceBookInstancesValueRepository } from './repository/reference-book-instances-value.repository';
import { ReferenceBookInstancesController } from './controller/reference-book-instances.controller';
import { PublicReferenceBookInstancesController } from './controller/public-reference-book-instances.controller';


@Module({
    imports: [
        TypeOrmModule.forFeature([ReferenceBookEntity, ReferenceBookAttributesEntity, ReferenceBookInstancesEntity, ReferenceBookInstancesValueEntity]),
    ],
    controllers: [ReferenceBookController, ReferenceBookAttributeController, ReferenceBookInstancesController, PublicReferenceBookInstancesController],
    providers: [
        ReferenceBookRepository,
        ReferenceBookAttributesRepository,
        ReferenceBookInstancesRepository,
        ReferenceBookInstancesValueRepository,
        ReferenceBookAttributesService,
        ReferenceBookInstancesService
    ],
    exports: [
        ReferenceBookRepository,
        ReferenceBookAttributesRepository,
        ReferenceBookInstancesRepository,
        ReferenceBookInstancesValueRepository,
        ReferenceBookAttributesService,
        ReferenceBookInstancesService
    ]
})
export class ReferenceBookModule {}

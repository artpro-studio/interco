import { InjectRepository } from "@nestjs/typeorm";
import { PagesEntity } from "../entity/pages.entity";
import { Repository } from "typeorm";
import { FullPagesDto, PagesDto } from "../dto/pages/create-pages.dto";
import { Injectable } from "@nestjs/common";
import { getFieldsIblock, getFieldsIblockFields, getFieldsIblockFieldsLabel, getFieldsIblockSectionValue, getFieldsPagesIblockRecordsFieldValue, getFieldsSeoParams } from "../helpers";

@Injectable()
export class PagesRepository {
    constructor(
        @InjectRepository(PagesEntity) private readonly pagesRepository: Repository<PagesEntity>,
    ) {}

    async getForSlugPublic(slug: string): Promise<FullPagesDto> {
        const fieldIblocks = getFieldsIblock('iblocks');
        const fieldIblockRecordsSection = getFieldsIblockSectionValue('sectionsValue')
        const fieldIblockSectionsValue = getFieldsIblockSectionValue('iblocksSectionsValue')
        const fieldIblockRecordsField = getFieldsIblockFields('recordsField');
        const fieldIblockRecordsFieldValue = getFieldsPagesIblockRecordsFieldValue('recordsValue')

        const query = this.pagesRepository.createQueryBuilder('pages')
            .leftJoin('pages.iblocks', 'iblocks')
            .leftJoin('iblocks.records', 'records')
            .leftJoin('iblocks.sections', 'iblocksSections')
            .leftJoin('iblocksSections.value', 'iblocksSectionsValue')
            .leftJoin('records.sections', 'sections')
            .leftJoin('sections.value', 'sectionsValue')
            .leftJoin('records.fields', 'recordsFields')
            .leftJoin('recordsFields.field', 'recordsField')
            .leftJoin('recordsFields.value', 'recordsValue')
            .addSelect(fieldIblocks)
            .addSelect(['records.id'])
            .addSelect(['sections.id'])
            .addSelect(['iblocksSections.id'])
            .addSelect(fieldIblockRecordsSection)
            .addSelect(fieldIblockSectionsValue)
            .addSelect(['recordsFields.id'])
            .addSelect(fieldIblockRecordsField)
            .addSelect(fieldIblockRecordsFieldValue)
            .where('pages.slug = :slug' , {slug})

        return await query.getOne();
    }

    async getForSlug(slug: string): Promise<PagesDto> {
        const fieldsSeoParams = getFieldsSeoParams('params')
        const query = this.pagesRepository.createQueryBuilder('pages')
        .leftJoin('pages.seo', 'seo')
        .leftJoin('seo.params', 'params')
        .addSelect(['seo.id'])
        .addSelect(fieldsSeoParams)
        .where('pages.slug = :slug' , {slug})

        return await query.getOne();
    }

    // Получение одной страницы
    async getOne(id: number): Promise<FullPagesDto> {
        const fieldsSeoParams = getFieldsSeoParams('params')
        const query = this.pagesRepository.createQueryBuilder('pages')
        .leftJoin('pages.seo', 'seo')
        .leftJoin('seo.params', 'params')
        .addSelect(['seo.id'])
        .addSelect(fieldsSeoParams)
        .where('pages.id = :id' , {id})

        return await query.getOne();
    }

    async update(body: PagesDto): Promise<PagesDto> {
        const entity = await this.pagesRepository.save(body);
        return entity;
    }
}

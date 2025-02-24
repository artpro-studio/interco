
import { PagesIblockRecordsDto } from '../dto/iblock/records/pages-iblock-records.dto';
import { PagesSectionsDto } from '../dto/pages-sections/pages-sections.dto';
import { CreateRecordsDto, FullRecordsDto, RecordsDto } from '../dto/records/create-records.dto';
import { IIblockField, ILangPages, ITypePagesParams } from '../interface';

const sortLang = [ILangPages.RU, ILangPages.EN, ILangPages.CH];

export function publicFormatterOne(data: PagesIblockRecordsDto): Record<string, any> {
    const {fields, sections, ...itemEl} = data;
    const resultFields = {};
    fields.forEach((field) => {
        resultFields[field.field.slug] = {}
        field.value.forEach((valItem) => {
            if (field.field.type === IIblockField.IMAGE) {
                const value = valItem;
                value.value = valItem.value.length ? JSON.parse(valItem.value) : null;
                resultFields[field.field.slug][valItem.lang] = value;
            } else if (field.field.type === IIblockField.ARRAY) {
                const value = valItem;
                value.value = valItem.value.split(';') as any;
                resultFields[field.field.slug][valItem.lang] = value;
            } else {
                resultFields[field.field.slug][valItem.lang] = valItem;
            }
        })
        const sortMap = new Map(sortLang.map(key => [key, resultFields[field.field.slug][key]]));
        resultFields[field.field.slug] = Object.fromEntries(sortMap);
    })

    let resultSections = [];
    if (sections?.length) {
        resultSections = publicFormatterSections(sections);
    }

    return {
        ...itemEl,
        fields: resultFields,
        sections: resultSections.length ? resultSections : null,
    }
}

export function publicFormatterList(data: PagesIblockRecordsDto[]): Record<string, any>[] {
    const result = [];

    data.forEach((el) => {
        result.push(publicFormatterOne(el))
    })

    return result;
}

export function publicFormatterAttribute(data: any): Record<string, any> {
    const result: Record<string, any> = {};
    data.forEach((el) => {
        result[el.name] = el.fields;
    });

    return result;
}

export function publicFormatterSections(data: any): any {
    if (data) {
        const entity = [];
        for (let item of data) {
            const result: Record<string, any> = {};
            item.value.forEach((el) => {
                result[el.lang] = el.value;
            });
            entity.push({
                id: item.id,
                value: result
            })
        }
        return entity;
    }
    return null;
}

export function SortLangCreateOrUpdateRecord(data: FullRecordsDto | CreateRecordsDto): FullRecordsDto | CreateRecordsDto {
    const sortMapTitleValue = new Map(sortLang.map(key => [key, data.title.value.find((el) => el.lang === key)]));
    const sortMapDescriptionValue = new Map(sortLang.map(key => [key, data.description.value.find((el) => el.lang === key)]));

    const paramsField = [];
    data.paramsField.forEach((el) => {
        const sortMapParasFieldValue = new Map(sortLang.map(key => [key, el.value.find((el) => el.lang === key)]));
        paramsField.push({
            ...el,
            value: Array.from(sortMapParasFieldValue.values()).filter((item) => item !== undefined)
        })
    })
    return {
        ...data,
        title: {
            ...data.title,
            value: Array.from(sortMapTitleValue.values()),
        },
        description: {
            ...data.description,
            value: Array.from(sortMapDescriptionValue.values()),
        },
        paramsField,
    }
}

export function parseForPublicRecords(body: FullRecordsDto[]) {
    return body.map((item) => {
        const title: Record<string, any> = {};
        item.title?.value?.forEach((el) => {
            title[el.lang] = el.value;
        })

        const description: Record<string, any> = {};
        item.description?.value?.forEach((el) => {
            description[el.lang] = el.value;
        })

        const seo = {}
        item.seo?.params?.forEach((el) => {
            if (!seo[el.fieldType]) {
                seo[el.fieldType] = {}
            }

            seo[el.fieldType][el.lang] = el.content;
        });
        const paramsField = {};
        item.paramsField?.forEach((el) => {
            if (el.params) {
                paramsField[el.params.slug] = {}
                el.value?.forEach((elValue) => {
                    if (el.params.type === ITypePagesParams.IMAGE || el.params.type === ITypePagesParams.GALLARY || el.params.type === ITypePagesParams.FILE) {
                        paramsField[el.params.slug][elValue.lang] = JSON.parse(elValue.value)
                    } else {
                        paramsField[el.params.slug][elValue.lang] = elValue.value
                    }
                })
            }
        });

        const sections = publicFormatterPagesSections(item.sections);

        return {
            ...item,
            title,
            description,
            seo,
            sections,
            paramsField
        }
    })
}

export function sortPagesSectionValue(data: PagesSectionsDto): PagesSectionsDto {
    const sortMapTitle = new Map(sortLang.map(key => [key, data.title.find((el) => el.lang === key)]));
    const sortMapDescription = new Map(sortLang.map(key => [key, data.description.find((el) => el.lang === key)]));
    data.title = Array.from(sortMapTitle.values());
    data.description = Array.from(sortMapDescription.values());
    return data;
}

export function publicFormatterPagesSections(body: PagesSectionsDto[]): any {
    const sections: any[] = [];
    body.forEach((el: PagesSectionsDto) => {
        const title = {};
        el.title.forEach((item) => {
            title[item.lang] = item.value;
        })

        const description = {};
        el.description.forEach((item) => {
            description[item.lang] = item.value;
        })
        sections.push({
            ...el,
            title,
            description
        })
    })
}

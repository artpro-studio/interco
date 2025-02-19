
import { PagesIblockRecordsDto } from '../dto/iblock/records/pages-iblock-records.dto';
import { IIblockField, ILangPages } from '../interface';

export function publicFormatterOne(data: PagesIblockRecordsDto): Record<string, any> {
    const sortLang = [ILangPages.RU, ILangPages.EN, ILangPages.CH];
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

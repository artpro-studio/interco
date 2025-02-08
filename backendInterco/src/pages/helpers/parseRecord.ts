
import { PagesIblockRecordsDto } from '../dto/iblock/records/pages-iblock-records.dto';
import { IIblockField } from '../interface';

export function publicFormatterOne(data: PagesIblockRecordsDto): Record<string, any> {
    const {fields, ...itemEl} = data;
    const resultFields = {};
    fields.forEach((field) => {
        resultFields[field.field.slug] = {}
        field.value.forEach((valItem) => {
            if (field.field.type === IIblockField.IMAGE) {
                const value = valItem;
                value.value = valItem.value.length ? JSON.parse(valItem.value) : null;
                resultFields[field.field.slug][valItem.lang] = value;
            } else {
                resultFields[field.field.slug][valItem.lang] = valItem;
            }

        })
    })
    return {
        ...itemEl,
        fields: resultFields
    }
}

export function publicFormatterList(data: PagesIblockRecordsDto[]): Record<string, any>[] {
    const result = [];

    data.forEach((el) => {
        result.push(publicFormatterOne(el))
    })

    return result;
}

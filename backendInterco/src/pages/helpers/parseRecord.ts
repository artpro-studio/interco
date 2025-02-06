
import { PagesIblockRecordsDto } from '../dto/iblock/records/pages-iblock-records.dto';

export function publicFormatterOne(data: PagesIblockRecordsDto): Record<string, any> {
    const {fields, ...itemEl} = data;
    const resultFields = {};
    fields.forEach((field) => {
        resultFields[field.field.slug] = {}
        field.value.forEach((valItem) => {
            resultFields[field.field.slug][valItem.lang] = valItem;
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

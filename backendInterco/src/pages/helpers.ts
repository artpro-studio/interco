export const getFieldsPages = (nameField: string): any => {
    const fields = ['id', 'name', 'description', 'slug', 'type', 'pagePath'];

    return fields.map((el) => `${nameField}.${el}`);
}

export const getFieldsSeoParams = (nameField: string): any => {
    const fields = ['id', 'content', 'lang', 'fieldType'];

    return fields.map((el) => `${nameField}.${el}`);
}

export const getFieldsIblock = (nameField: string): any => {
    const fields = ['id', 'name', 'attributes', 'slug'];

    return fields.map((el) => `${nameField}.${el}`);
}

export const getFieldsIblockFields = (nameField: string): any => {
    const fields = ['id', 'name', 'slug', 'type'];

    return fields.map((el) => `${nameField}.${el}`);
}

export const getFieldsIblockFieldsLabel = (nameField: string): any => {
    const fields = ['id', 'value', 'lang'];

    return fields.map((el) => `${nameField}.${el}`);
}

export const getFieldsIblockSectionValue = (nameField: string): any => {
    const fields = ['id', 'value', 'lang'];

    return fields.map((el) => `${nameField}.${el}`);
}

export const getFieldsPagesIblockRecordsFieldValue = (nameField: string): any => {
    const fields = ['id', 'value', 'lang'];

    return fields.map((el) => `${nameField}.${el}`);
}

export const getFieldsRecordsTitleValue = (nameField: string) => {
    const fields = ['id', 'value', 'lang'];

    return fields.map((el) => `${nameField}.${el}`);
}

export const getFieldsRecordsDescriptionValue = (nameField: string) => {
    const fields = ['id', 'value', 'lang'];

    return fields.map((el) => `${nameField}.${el}`);
}

export const getFieldsSectionsValue = (nameField: string): any => {
    const fields = ['id', 'value', 'lang'];

    return fields.map((el) => `${nameField}.${el}`);
}

// Сравнение обьектов
export function compareValuesByCommonKeys(obj1, obj2) {
    const commonKeys = Object.keys(obj1).filter(key => key in obj2);

    return commonKeys.every(key => obj1[key] === obj2[key]);
}

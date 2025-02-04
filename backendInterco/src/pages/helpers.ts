export const getFieldsSeoParams = (nameField: string): any => {
    const fields = ['id', 'content', 'lang', 'fieldType'];

    return fields.map((el) => `${nameField}.${el}`);
}

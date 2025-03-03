export const getFieldsTask = (nameField: string): any => {
    const fields = ['id', 'idTask', 'name', 'progress', 'status', 'type'];

    return fields.map((el) => `${nameField}.${el}`);
};

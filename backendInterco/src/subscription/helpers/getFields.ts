export const getFieldsSendsSubscriptionTitle = (nameField: string): any => {
    const fields = ['id', 'value', 'lang'];

    return fields.map((el) => `${nameField}.${el}`);
};

export const getFieldsSendsSubscriptionDescription = (
    nameField: string
): any => {
    const fields = ['id', 'value', 'lang'];

    return fields.map((el) => `${nameField}.${el}`);
};

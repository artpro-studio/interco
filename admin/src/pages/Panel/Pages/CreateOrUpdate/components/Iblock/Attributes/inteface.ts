
export enum IAttributeType {
    TEXT = 'text',
    TEXTAREA = 'textarea',
    IMAGES = 'images',
}

export const optionsAttributeType = [
    {
        value: IAttributeType.TEXT,
        label: 'Строка'
    },
    {
        value: IAttributeType.TEXTAREA,
        label: 'Текст'
    },
    {
        value: IAttributeType.IMAGES,
        label: 'Изоображение'
    },
];

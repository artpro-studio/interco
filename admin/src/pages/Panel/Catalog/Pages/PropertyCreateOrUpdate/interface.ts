import {CreateProductPropertyesDtoType} from 'src/ApiClient/ApiClient';

export interface ITypeSelect {
    text: string,
    value: CreateProductPropertyesDtoType
}

export const ITypeSelectData: ITypeSelect[] = [
    {
        text: 'Строка',
        value: CreateProductPropertyesDtoType.Text
    },
    {
        text: 'Строка с значением',
        value: CreateProductPropertyesDtoType.TextKey
    },
    {
        text: 'Текстовое поле',
        value: CreateProductPropertyesDtoType.Textarea
    },
    {
        text: 'Текстовый редактор',
        value: CreateProductPropertyesDtoType.Editor
    },
    {
        text: 'Список',
        value: CreateProductPropertyesDtoType.List
    },
    {
        text: 'Список со занчением',
        value: CreateProductPropertyesDtoType.ListKey
    },
    {
        text: 'Файл',
        value: CreateProductPropertyesDtoType.File
    },
    {
        text: 'Цвет',
        value: CreateProductPropertyesDtoType.Color
    },
];

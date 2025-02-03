import { CreateReferenceBookAttributesDtoType, FullReferenceBookAttributesDto } from '@/ApiClient/ApiClient';

export interface IReferenceBookAttributeFilter {
    search: string;
    page: number;
    limit: number;
}

export interface IReferenceBookAttribute extends FullReferenceBookAttributesDto {
    isChecked: boolean;
}

export const ReferenceBookAttributeColumnsTable = [
    {
        name: 'actions',
        label: '',
    },
    {
        name: 'id',
        label: 'ID',
        align: 'left',
    },
    {
        name: 'name',
        label: 'Название',
        align: 'left',
    },
    {
        name: 'createAt',
        label: 'Дата создания',
        align: 'left',
    },
];

export const ReferenceBookAttributeOptions = [
    {
        name: 'Строка',
        value: CreateReferenceBookAttributesDtoType.Text,
    },
    {
        name: 'Текст',
        value: CreateReferenceBookAttributesDtoType.Textarea,
    },
    {
        name: 'Число',
        value: CreateReferenceBookAttributesDtoType.Number,
    },
    {
        name: 'Дата',
        value: CreateReferenceBookAttributesDtoType.Date,
    },
    {
        name: 'Дата и время',
        value: CreateReferenceBookAttributesDtoType.Datetime,
    },
    {
        name: 'Текстовый редактор',
        value: CreateReferenceBookAttributesDtoType.Editor,
    },
    {
        name: 'Изоображение',
        value: CreateReferenceBookAttributesDtoType.Image,
    },
    {
        name: 'Галлерея',
        value: CreateReferenceBookAttributesDtoType.Gallary,
    },
    {
        name: 'Файл',
        value: CreateReferenceBookAttributesDtoType.File,
    },
];

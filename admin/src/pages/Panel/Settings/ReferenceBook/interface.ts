import { FullReferenceBookDto } from '@/ApiClient/ApiClient';

export interface IReferenceBookFilter {
    search: string;
    page: number;
    limit: number;
}

export interface IReferenceBook extends FullReferenceBookDto {
    isChecked: boolean;
}

export interface IReferenceBookInstances {
    isChecked: boolean;
    [key: string]: any;
}

export const ReferenceBookColumnsTable = [
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
        name: 'slug',
        label: 'Символьный код',
        align: 'left',
    },
    {
        name: 'createAt',
        label: 'Дата создания',
        align: 'left',
    },
];

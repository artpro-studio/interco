import {FullProductsDto} from 'src/ApiClient/ApiClient';

export interface IProductsFilter {
    page: number,
    search: string,
    isLead: boolean | undefined,
    isNew: boolean | undefined,
    created: string | undefined,
    updated: string | undefined,
}

export interface IProducts extends FullProductsDto {
    isChecked: boolean,
}

export const dataColumnsTable = [
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
        name: 'code',
        label: 'Символьный код',
        align: 'left',
    },
    {
        name: 'created_at',
        label: 'Дата создания',
        align: 'left',
    },
    {
        name: 'updated_at',
        label: 'Дата обновления',
        align: 'left',
    },
    {
        name: 'isNew',
        label: 'Новинка',
        align: 'left',
    },
    {
        name: 'isLeader',
        label: 'Лидер продаж',
        align: 'left',
    },
];

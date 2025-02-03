import { CallbackDto } from '@/ApiClient/ApiClient';

export interface ICallbackFilter {
    search: string;
    page: number;
    limit: number;
}

export interface ICallback extends CallbackDto {
    isChecked: boolean;
}

export interface ICallbackInstances {
    isChecked: boolean;
    [key: string]: any;
}

export const CallbackColumnsTable = [
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
        name: 'email',
        label: 'E-mail',
        align: 'left',
    },
    {
        name: 'syncBitrix',
        label: 'Синх. c Битрикс',
        align: 'left',
    },
    {
        name: 'syncAmo',
        label: 'Синх. c AmoCRM',
        align: 'left',
    },
    {
        name: 'createAt',
        label: 'Дата создания',
        align: 'left',
    },
];

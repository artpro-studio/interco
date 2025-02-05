import { PagesIblockDto } from '@/ApiClient/ApiClient';

export interface IPagesIblockDto extends PagesIblockDto {
    isChecked: boolean;
}

export const PagesIblockColumnsTable = [
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

import { PagesIblockRecordsDto } from '@/ApiClient/ApiClient';

export interface IPagesIblockRecordsDto extends PagesIblockRecordsDto {
    isChecked: boolean;
}

export const PagesIblockRecordsColumnsTable = [
    {
        name: 'actions',
        label: '',
    },
    {
        name: 'id',
        label: 'ID',
        align: 'left',
        field: 'id'
    },
    {
        name: 'sort',
        label: 'Порядок',
        align: 'left',
        field: 'sort'
    },
    {
        name: 'createAt',
        label: 'Дата создания',
        align: 'left',
        field: 'createdAt'
    },
];

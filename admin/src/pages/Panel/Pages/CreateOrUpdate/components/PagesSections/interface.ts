import { PagesSectionsDto } from '@/ApiClient/ApiClient';

export interface IPagesSectionsDto extends PagesSectionsDto {
    isChecked: boolean;
}

export const PagesSectionsColumnsTable = [
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

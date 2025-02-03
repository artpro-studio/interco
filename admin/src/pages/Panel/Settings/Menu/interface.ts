import { SettingsMenuDto } from '@/ApiClient/ApiClient';

export interface IMenuFilter {
    search: string;
    page: number;
    limit: number;
}

export interface ISettingsMenu extends SettingsMenuDto {
    isChecked: boolean;
}

export const MenuColumnsTable = [
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
        name: 'title',
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
    {
        name: 'updatedAt',
        label: 'Дата обновления',
        align: 'left',
    },
    {
        name: 'deletedAt',
        label: 'Дата удаления',
        align: 'left',
    },
];

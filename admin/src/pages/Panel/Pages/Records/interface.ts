import { DropDownDto, RecordsDto } from 'src/ApiClient/ApiClient';

export interface IRecordsFilter {
    search: string;
    page: number;
    limit: number;
    pages: DropDownDto[];
}

export interface IRecords extends RecordsDto {
    isChecked: boolean;
}

export const RecordsColumnsTable = [
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
        name: 'countView',
        label: 'Просмотров',
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

import { PagesDto, PagesType } from 'src/ApiClient/ApiClient';

export interface IPagesType {
    value: PagesType;
    label: string;
}

export const dataPagesType = [
    {
        value: PagesType.Blog,
        label: 'Блог',
    },
    {
        value: PagesType.Landing,
        label: 'Лендинг',
    },
];

export enum ParsePagesType {
    Landing = 'Лендинг',
    blog = 'Блог',
}

export interface IPagesFilter {
    search: string;
    pagesType: PagesType | null | undefined;
    page: number;
    limit: number;
}

export interface IPages extends PagesDto {
    isChecked: boolean;
}

export const PagesColumnsTable = [
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

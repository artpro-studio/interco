import { Role, UserDto } from 'src/ApiClient/ApiClient';

export interface IUserFilter {
    search: string;
    role: Role[];
    page: number;
    limit: number;
}

export interface IUsers extends UserDto {
    isChecked: boolean;
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
        name: 'firstName',
        label: 'ФИО',
        align: 'left',
    },
    {
        name: 'email',
        label: 'E-mail',
        align: 'left',
    },
    {
        name: 'role',
        label: 'Роль',
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
];

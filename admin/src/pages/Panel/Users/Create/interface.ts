import { Role } from 'src/ApiClient/ApiClient';

export interface IUserRoles {
    text: string;
    value: Role;
}

export const UserRoles: IUserRoles[] = [
    {
        text: 'Администратор',
        value: Role.Admin,
    },
    {
        text: 'Пользователь',
        value: Role.Guest,
    },
];

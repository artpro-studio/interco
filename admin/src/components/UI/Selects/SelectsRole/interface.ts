import { Role } from 'src/ApiClient/ApiClient';

export interface IRole {
    value: Role;
    text: string;
}

export const dataRoles = [
    {
        value: Role.Admin,
        text: 'Суперадминистратор',
    },
    {
        value: Role.Guest,
        text: 'Гость',
    },
];

export enum ParseRole {
    admin = 'Суперадминистратор',
    guest = 'Гость',
}

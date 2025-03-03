import { SubscriptionDto } from '@/ApiClient/ApiClient';

export interface ISubscriptionFilter {
    search: string;
    page: number;
    limit: number;
}

export interface ISubscription extends SubscriptionDto {
    isChecked: boolean;
}

export const subscriptionColumnsTable = [
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
        label: 'ФИО',
        align: 'left',
    },
    {
        name: 'email',
        label: 'E-mail',
        align: 'left',
    },
    {
        name: 'lang',
        label: 'Язык',
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

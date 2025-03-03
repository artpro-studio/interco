import { SendsSubscriptionDto } from '@/ApiClient/ApiClient';

export interface ISendsSubscriptionFilter {
    search: string;
    page: number;
    limit: number;
}

export interface ISendsSubscription extends SendsSubscriptionDto {
    isChecked: boolean;
}

export const sendsSubscriptionColumnsTable = [
    {
        name: 'id',
        label: 'ID',
        align: 'left',
    },
    {
        name: 'proccents',
        label: 'Выполнено',
        align: 'left',
    },
    {
        name: 'title',
        label: 'Заголовок',
        align: 'left',
    },
    {
        name: 'description',
        label: 'Описание',
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

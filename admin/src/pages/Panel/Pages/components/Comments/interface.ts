import { CommentStatus, PagesCommentsDto } from '@/ApiClient/ApiClient';

export interface IPagesComments extends PagesCommentsDto {
    isChecked: boolean;
}

export const optionsCommentsStatus = [
    {
        label: 'Не проверен',
        value: CommentStatus.Verify,
    },
    {
        label: 'Проверен',
        value: CommentStatus.Success,
    },
];

export const CommentsColumnsTable = [
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
        name: 'status',
        label: 'Статус',
        align: 'left',
    },
    {
        name: 'content',
        label: 'Комментарий',
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

import { FullPagesParamsDto, ITypePagesParams } from '@/ApiClient/ApiClient';

export interface IFullPagesParamsDto extends FullPagesParamsDto {
    isChecked: boolean;
}

export const optionsTypePagesParams = [
    {
        name: 'Текст',
        value: ITypePagesParams.Text,
    },
    {
        name: 'Число',
        value: ITypePagesParams.Number,
    },
    {
        name: 'Описание',
        value: ITypePagesParams.Textarea,
    },
    {
        name: 'Текстовый редактор',
        value: ITypePagesParams.Editor,
    },
    {
        name: 'Дата',
        value: ITypePagesParams.Date,
    },
    {
        name: 'Дата и время',
        value: ITypePagesParams.Datetime,
    },
    {
        name: 'Изоображение',
        value: ITypePagesParams.Image,
    },
    {
        name: 'Галерея',
        value: ITypePagesParams.Gallary,
    },
    {
        name: 'Файл',
        value: ITypePagesParams.File,
    },
];

export const PagesParamsColumnsTable = [
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
        name: 'slug',
        label: 'Символьный код',
        align: 'left',
    },
    {
        name: 'createAt',
        label: 'Дата создания',
        align: 'left',
    },
];

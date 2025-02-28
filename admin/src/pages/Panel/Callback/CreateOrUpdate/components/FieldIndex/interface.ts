import { CallbackFieldDto, ICallbackFieldType, ICallbackFiledAttribute } from '@/ApiClient/ApiClient';

export interface ICallbackFieldFilter {
    search: string;
    page: number;
    limit: number;
}

export interface ICallbackField extends CallbackFieldDto {
    isChecked: boolean;
}

export const CallbackFieldColumnsTable = [
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
        name: 'type',
        label: 'Тип',
        align: 'left',
    },
    {
        name: 'attribute',
        label: 'Атрибут',
        align: 'left',
    },
    {
        name: 'createAt',
        label: 'Дата создания',
        align: 'left',
    },
];

export const CallbackFieldData = {
    [ICallbackFiledAttribute.Title]: 'Заголовок',
    [ICallbackFiledAttribute.Description]: 'Описание',
    [ICallbackFiledAttribute.Name]: 'Имя',
    [ICallbackFiledAttribute.LastName]: 'Фамилия',
    [ICallbackFiledAttribute.SecondName]: 'Отчество',
    [ICallbackFiledAttribute.Email]: 'E-mail',
    [ICallbackFiledAttribute.EmailWork]: 'Рабочий E-mail',
    [ICallbackFiledAttribute.Phone]: 'Телефон',
    [ICallbackFiledAttribute.PhoneWork]: 'Рабочий телефон',
    [ICallbackFiledAttribute.Web]: 'Сайт',
    [ICallbackFiledAttribute.Price]: 'Цена',
    [ICallbackFiledAttribute.Comments]: 'Комментарий',
    [ICallbackFiledAttribute.Delivary]: 'Место доставки',
    [ICallbackFiledAttribute.Company]: 'Компания',
};

export const CallbackFieldOptions = [
    {
        name: CallbackFieldData[ICallbackFiledAttribute.Title],
        value: ICallbackFiledAttribute.Title,
    },
    {
        name: CallbackFieldData[ICallbackFiledAttribute.Description],
        value: ICallbackFiledAttribute.Description,
    },
    {
        name: CallbackFieldData[ICallbackFiledAttribute.Name],
        value: ICallbackFiledAttribute.Name,
    },
    {
        name: CallbackFieldData[ICallbackFiledAttribute.LastName],
        value: ICallbackFiledAttribute.LastName,
    },
    {
        name: CallbackFieldData[ICallbackFiledAttribute.SecondName],
        value: ICallbackFiledAttribute.SecondName,
    },
    {
        name: CallbackFieldData[ICallbackFiledAttribute.Email],
        value: ICallbackFiledAttribute.Email,
    },
    {
        name: CallbackFieldData[ICallbackFiledAttribute.EmailWork],
        value: ICallbackFiledAttribute.EmailWork,
    },
    {
        name: CallbackFieldData[ICallbackFiledAttribute.Phone],
        value: ICallbackFiledAttribute.Phone,
    },
    {
        name: CallbackFieldData[ICallbackFiledAttribute.PhoneWork],
        value: ICallbackFiledAttribute.PhoneWork,
    },
    {
        name: CallbackFieldData[ICallbackFiledAttribute.Web],
        value: ICallbackFiledAttribute.Web,
    },
    {
        name: CallbackFieldData[ICallbackFiledAttribute.Price],
        value: ICallbackFiledAttribute.Price,
    },
    {
        name: CallbackFieldData[ICallbackFiledAttribute.Comments],
        value: ICallbackFiledAttribute.Comments,
    },
    {
        name: CallbackFieldData[ICallbackFiledAttribute.Delivary],
        value: ICallbackFiledAttribute.Delivary,
    },
    {
        name: CallbackFieldData[ICallbackFiledAttribute.Company],
        value: ICallbackFiledAttribute.Company,
    },
];

export const CallbackFieldTypeData = {
    [ICallbackFieldType.String]: 'Строка',
    [ICallbackFieldType.Text]: 'Текст',
    [ICallbackFieldType.Number]: 'Число',
    [ICallbackFieldType.Email]: 'E-mail',
    [ICallbackFieldType.Phone]: 'Телефон',
    [ICallbackFieldType.Date]: 'Дата',
    [ICallbackFieldType.Datetime]: 'Дата и время',
};

export const CallbackFieldTypeOptions = [
    {
        name: CallbackFieldTypeData[ICallbackFieldType.String],
        value: ICallbackFieldType.String,
    },
    {
        name: CallbackFieldTypeData[ICallbackFieldType.Text],
        value: ICallbackFieldType.Text,
    },
    {
        name: CallbackFieldTypeData[ICallbackFieldType.Number],
        value: ICallbackFieldType.Number,
    },
    {
        name: CallbackFieldTypeData[ICallbackFieldType.Email],
        value: ICallbackFieldType.Email,
    },
    {
        name: CallbackFieldTypeData[ICallbackFieldType.Phone],
        value: ICallbackFieldType.Phone,
    },
    {
        name: CallbackFieldTypeData[ICallbackFieldType.Date],
        value: ICallbackFieldType.Date,
    },
    {
        name: CallbackFieldTypeData[ICallbackFieldType.Datetime],
        value: ICallbackFieldType.Datetime,
    },
];

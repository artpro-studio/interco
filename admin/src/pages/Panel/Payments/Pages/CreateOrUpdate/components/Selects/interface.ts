import {CreatePaymentsDtoType, CreatePaymentsDtoTypeCompany} from 'src/ApiClient/ApiClient';

export interface IPaymentsDtoType {
    value: CreatePaymentsDtoType,
    text: string,
}

export const dataPaymentType: IPaymentsDtoType[] = [
    {
        value: CreatePaymentsDtoType.InCash,
        text: 'Наличными'
    },
    {
        value: CreatePaymentsDtoType.Cashless,
        text: 'Безналичный'
    },
    {
        value: CreatePaymentsDtoType.Acquiring,
        text: 'Экваринг'
    },
];

export interface IPaymentsDtoTypeCompany {
    value: CreatePaymentsDtoTypeCompany,
    text: string,
}

export const dataPaymentsTypeCompany: IPaymentsDtoTypeCompany[] = [
    {
        value: CreatePaymentsDtoTypeCompany.Yookassa,
        text: 'ЮKassa'
    }
];

export enum ICallbackFieldType {
    STRING = 'string',
    TEXT  = 'text',
    NUMBER  = 'number',
    DATE = 'date',
    DATETIME = 'datetime',
    EMAIL = 'email',
    PHONE = 'phone'
}

export enum ICallbackFiledAttribute {
    TITLE = 'title',
    DESCRIPTION = 'description',
    NAME = 'name',
    LAST_NAME = 'lastName',
    SECOND_NAME = 'secondName',
    EMAIL = 'email',
    EMAIL_WORK = 'emailWork',
    PHONE = 'phone',
    PHONE_WORK = 'phoneWork',
    WEB = 'web',
    PRICE = 'price',
    COMMENTS = 'comments',
    DELIVARY = 'delivary',
    COMPANY = 'company',
}


export interface ISendData {
    name: string,
    attribute: ICallbackFiledAttribute,
    value: string
}

export enum IBitrixFieldAttribute {
    title = 'TITLE',
    name = 'NAME',
    lastName = 'LAST_NAME',
    secondName = 'SECOND_NAME',
    email = 'EMAIL',
    emailWork = 'EMAIL',
    phone = 'PHONE',
    phoneWork = 'PHONE',
    web = 'WEB',
    price = 'PRICE',
    comments = 'COMMENTS',
    delivary = 'ADDRESS',
    company = 'COMPANY_TITLE',
}

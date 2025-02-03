import { ITemplateComponents, ITemplateComponentsType } from 'src/ApiClient/ApiClient';

const data: ITemplateComponents = {
    name: 'MainCompany',
    title: 'О компании',
    icon: 'settings',
    fields: [
        {
            type: ITemplateComponentsType.TEXT,
            name: 'title',
            default: 'О компании',
            label: 'Заголовок',
        },
        {
            type: ITemplateComponentsType.EDITOR,
            name: 'desc',
            default:
                'ГАРАНТИЯ - это команда профессионалов своего дела с огромным опытом и широкой клиентской базой! Мы являемся связующим звеном между Вами и Вашими клиентами. Миссия нашей компании: "Работать, чтобы обеспечить Вас базой постоянных активных клиентов!"',
            label: 'Описание',
        },
        {
            type: ITemplateComponentsType.ARRAY,
            name: 'children',
            label: 'Преимущество',
            fields: [
                {
                    type: ITemplateComponentsType.TEXT,
                    name: 'title',
                    default: '2021',
                    label: 'Заголовок',
                },
                {
                    type: ITemplateComponentsType.TEXT,
                    name: 'desc',
                    default: 'работаем с 2012 года',
                    label: 'Описание',
                },
            ],
        },
        {
            type: ITemplateComponentsType.ARRAY,
            name: 'contacts',
            label: 'Контакт',
            fields: [
                {
                    type: ITemplateComponentsType.TEXT,
                    name: 'title',
                    default: 'Телефон',
                    label: 'Заголовок',
                },
                {
                    type: ITemplateComponentsType.TEXT,
                    name: 'icon',
                    default: 'phone',
                    label: 'Иконка',
                },
                {
                    type: ITemplateComponentsType.TEXT,
                    name: 'text',
                    default: '8 999 123 22 22',
                    label: 'Описание',
                },
                {
                    type: ITemplateComponentsType.TEXT,
                    name: 'href',
                    default: 'tel:89991232222',
                    label: 'Ссылка',
                },
            ],
        },
        {
            type: ITemplateComponentsType.ARRAY,
            name: 'social',
            label: 'Соц. сети',
            fields: [
                {
                    type: ITemplateComponentsType.TEXT,
                    name: 'icon',
                    default: 'phone',
                    label: 'Иконка',
                },
                {
                    type: ITemplateComponentsType.TEXT,
                    name: 'href',
                    default: 'tel:89991232222',
                    label: 'Ссылка',
                },
            ],
        },
    ],
};

export default data;

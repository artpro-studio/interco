import { ITemplateComponents, ITemplateComponentsType } from 'src/ApiClient/ApiClient';

const data: ITemplateComponents = {
    name: 'MainService',
    title: 'Услуги',
    icon: 'settings',
    fields: [
        {
            type: ITemplateComponentsType.TEXT,
            name: 'title',
            default: 'Заголовок',
            label: 'Заголовок',
        },
        {
            type: ITemplateComponentsType.ARRAY,
            name: 'fields',
            label: 'Список элементов',
            fields: [
                {
                    type: ITemplateComponentsType.TEXT,
                    name: 'title',
                    default: 'Заголовок',
                    label: 'Заголовок',
                },
                {
                    type: ITemplateComponentsType.EDITOR,
                    name: 'desc',
                    default: 'Описание',
                    label: 'Описание',
                },
                {
                    type: ITemplateComponentsType.IMAGE,
                    name: 'images',
                    default: '',
                    label: 'Изоображение',
                },
            ],
        },
    ],
};

export default data;

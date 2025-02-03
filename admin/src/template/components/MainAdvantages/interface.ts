import {
    ITemplateComponents,
    ITemplateComponentsType,
} from 'src/ApiClient/ApiClient';

const data: ITemplateComponents = {
    name: 'MainAdvantages',
    title: 'Преимущества',
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
                    type: ITemplateComponentsType.TEXT,
                    name: 'icon',
                    default: 'close',
                    label: 'Иконка',
                },
                {
                    type: ITemplateComponentsType.EDITOR,
                    name: 'desc',
                    default: 'Описание',
                    label: 'Описание',
                },
            ],
        },
    ],
};
export default data;

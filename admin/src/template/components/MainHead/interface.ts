import { ITemplateComponents, ITemplateComponentsType } from 'src/ApiClient/ApiClient';

const data: ITemplateComponents = {
    name: 'MainHead',
    title: 'Первый экран',
    icon: 'settings',
    fields: [
        {
            type: ITemplateComponentsType.TEXT,
            name: 'title',
            default: 'Заголовок',
            label: 'Заголовок',
        },
        {
            type: ITemplateComponentsType.EDITOR,
            name: 'description',
            default: 'Описание',
            label: 'Описание',
        },
        {
            type: ITemplateComponentsType.IMAGE,
            name: 'images',
            default: 'Изоображение',
            label: 'Изоображение',
        },
    ],
};

export default data;

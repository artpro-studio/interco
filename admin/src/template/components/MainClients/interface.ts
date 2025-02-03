import { ITemplateComponents, ITemplateComponentsType } from 'src/ApiClient/ApiClient';

const data: ITemplateComponents = {
    name: 'MainClients',
    title: 'Клиенты',
    icon: 'settings',
    fields: [
        {
            type: ITemplateComponentsType.TEXT,
            name: 'title',
            default: 'Наши клиенты',
            label: 'Заголовок',
        },
        {
            type: ITemplateComponentsType.GALLARY,
            name: 'images',
            default: '',
            label: 'Изоображение',
        },
    ],
};

export default data;

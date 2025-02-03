import { ITemplateComponents, ITemplateComponentsType } from 'src/ApiClient/ApiClient';

const data: ITemplateComponents = {
    name: 'MainMaps',
    title: 'Карта',
    icon: 'settings',
    fields: [
        {
            type: ITemplateComponentsType.TEXT,
            name: 'title',
            default: 'Наши рекламные стенды',
            label: 'Заголовок',
        },
        {
            type: ITemplateComponentsType.TEXT,
            name: 'desc',
            default: 'Выберите адрес для определение стенда',
            label: 'Заголовок',
        },
    ],
};

export default data;

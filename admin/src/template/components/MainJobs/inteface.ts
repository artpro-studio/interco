import { ITemplateComponents, ITemplateComponentsType } from 'src/ApiClient/ApiClient';

const data: ITemplateComponents = {
    name: 'MainJobs',
    title: 'Наши работы',
    icon: 'settings',
    fields: [
        {
            type: ITemplateComponentsType.TEXT,
            name: 'title',
            default: 'Наши рабаоты',
            label: 'Заголовок',
        },
        {
            type: ITemplateComponentsType.TEXT,
            name: 'desc',
            default: 'Посмотрите наши работы по размещению рекалмы на наших точках',
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

import { ITemplateComponents, ITemplateComponentsType } from 'src/ApiClient/ApiClient';

const data: ITemplateComponents = {
    name: 'MainCalculate',
    title: 'Калькулятор',
    icon: 'settings',
    fields: [
        {
            type: ITemplateComponentsType.TEXT,
            name: 'title',
            default: 'Расчитать стоимость рекламы',
            label: 'Заголовок',
        },
        {
            type: ITemplateComponentsType.TEXT,
            name: 'description',
            default: 'Расчитать стоимость рекламы',
            label: 'Описание',
        },
    ],
};

export default data;

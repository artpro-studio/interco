import { ITemplateComponents } from 'src/ApiClient/BaseApiClient';

import MainHeadData from './components/MainHead/interface';
import MainAdvantagesData from './components/MainAdvantages/interface';
import ServiceData from './components/Service/interface';
import MainClientsData from './components/MainClients/interface';
import MainCalculateDate from './components/MainCalculate/interface';
import MainJobsData from './components/MainJobs/inteface';
import MainMapsData from './components/MainMaps/interface';
import MainCompanyData from './components/MainCompany/interface';

// Описание компонентов
export const TemplateComponentsData: ITemplateComponents[] = [
    MainHeadData,
    MainAdvantagesData,
    ServiceData,
    MainClientsData,
    MainCalculateDate,
    MainJobsData,
    MainMapsData,
    MainCompanyData,
];

// Список доступных страниц
export const templatePages = [
    {
        name: 'Новости',
        path: 'pages/News/index.vue',
        children: [
            {
                name: 'Детальная новости',
                path: 'pages/News/Info/index.vue',
            },
        ],
    },
];

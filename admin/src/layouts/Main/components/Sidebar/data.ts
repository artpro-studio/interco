import { RouterName } from 'src/router/routerName';

export interface IMenu {
    name: string;
    path?: RouterName;
    icon?: string;
    children?: IMenuChildren[];
    isOpenChildren?: boolean;
}

export interface IMenuChildren {
    title: string;
    isAdd?: boolean;
    path?: RouterName;
    child?: IMenu[];
}

export interface IMenuContent {
    name: string;
    content: IMenu[];
}

export const dataMenu: IMenuContent[] = [
    {
        name: 'Dashboard',
        content: [
            {
                name: 'Dashboard',
                icon: 'grid_view',
                path: RouterName.Panel,
            },
        ],
    },
    {
        name: 'Страницы',
        content: [
            {
                name: 'Страницы',
                icon: 'layers',
                isOpenChildren: false,
                children: [
                    {
                        title: 'Динамические страницы',
                        path: RouterName.PagesBlogs,
                    },
                    {
                        title: 'Статические страницы',
                        path: RouterName.PagesLanding,
                    },
                    {
                        title: 'Статьи',
                        path: RouterName.Records,
                    },
                    {
                        title: 'Комментарии',
                        path: RouterName.Comments,
                    },
                ],
            },
        ],
    },
    {
        name: 'Рассылка',
        content: [
            {
                name: 'Рассылка',
                icon: 'subscriptions',
                isOpenChildren: false,
                children: [
                    {
                        title: 'Подписаные пользователи',
                        path: RouterName.Subscription,
                    },
                    {
                        title: 'Рассылки',
                        path: RouterName.SendsSubScription,
                    },
                ],
            },
        ],
    },
    {
        name: 'Файлы',
        content: [
            {
                name: 'Библиотека',
                icon: 'photo_library',
                path: RouterName.Library,
            },
        ],
    },
    {
        name: 'Формы обратной связи',
        content: [
            {
                name: 'Формы обратной связи',
                icon: 'phone_callback',
                path: RouterName.Callback,
            },
        ],
    },
    {
        name: 'Настройки',
        content: [
            {
                name: 'Настройки',
                icon: 'settings',
                children: [
                    {
                        title: 'Основные настройки',
                        path: RouterName.Settings,
                    },
                    {
                        title: 'Настройки меню',
                        path: RouterName.SettingsMenu,
                    },
                    {
                        title: 'Пользователи',
                        path: RouterName.Users,
                    },
                    {
                        title: 'Справочники',
                        path: RouterName.ReferenceBook,
                    },
                ],
            },
        ],
    },
];

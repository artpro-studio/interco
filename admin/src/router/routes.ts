import { RouteRecordRaw } from 'vue-router';
import { RouterName } from 'src/router/routerName';

const routes: RouteRecordRaw[] = [
    {
        path: '/',
        component: () => import('layouts/Login.vue'),
        children: [
            {
                name: RouterName.Login,
                path: '',
                component: () => import('pages/Login/Login.vue'),
                meta: { title: 'Авторизация' },
            },
        ],
    },
    {
        path: '/settings-cms',
        component: () => import('layouts/Login.vue'),
        children: [
            {
                name: RouterName.SettingsCMS,
                path: '',
                component: () => import('pages/SettingsCms/index.vue'),
                meta: { title: 'Первоначальные настройки CMS' },
            },
        ],
    },
    {
        path: '/panel/',
        component: () => import('layouts/Main/MainLayout.vue'),
        meta: {
            title: 'Dashboard',
            isNeedLogin: true,
        },
        children: [
            {
                name: RouterName.Panel,
                path: '',
                component: () => import('pages/Panel/Dashboard/index.vue'),
            },
            {
                path: 'orders/',
                meta: { title: 'Оформленые заказы' },
                children: [
                    {
                        path: '',
                        name: RouterName.Orders,
                        component: () => import('pages/Panel/Orders/Pages/Index/Index.vue'),
                        meta: { title: 'Оформленые заказы' },
                    },
                    {
                        path: 'edit/:id',
                        name: RouterName.OrdersEdit,
                        component: () => import('pages/Panel/Orders/Pages/CreateOrUpdate/index.vue'),
                        meta: { title: 'Редактирование заказа' },
                    },
                    {
                        path: 'create/',
                        name: RouterName.OrdersCreate,
                        component: () => import('pages/Panel/Orders/Pages/CreateOrUpdate/index.vue'),
                        meta: { title: 'Создание заказа' },
                    },
                ],
            },
            {
                path: 'payments/',
                meta: { title: 'Платежная система' },
                children: [
                    {
                        path: '',
                        name: RouterName.Payments,
                        component: () => import('pages/Panel/Payments/Pages/Index/Index.vue'),
                        meta: { title: 'Платежная система' },
                    },
                    {
                        path: 'edit/:id',
                        name: RouterName.PaymentsEdit,
                        component: () => import('pages/Panel/Payments/Pages/CreateOrUpdate/index.vue'),
                        meta: { title: 'Редактирование плтаежной систесы' },
                    },
                    {
                        path: 'create/',
                        name: RouterName.PaymentsCreate,
                        component: () => import('pages/Panel/Payments/Pages/CreateOrUpdate/index.vue'),
                        meta: { title: 'Создание платежной системы' },
                    },
                ],
            },
            {
                path: 'ware-house/',
                meta: { title: 'Склады' },
                children: [
                    {
                        name: RouterName.WareHouse,
                        path: '',
                        component: () => import('pages/Panel/WareHouse/Pages/Index/index.vue'),
                    },
                    {
                        name: RouterName.WareHouseCreate,
                        path: 'create/',
                        component: () => import('pages/Panel/WareHouse/Pages/CreateOrUpdate/index.vue'),
                        meta: { title: 'Создание склада' },
                    },
                    {
                        name: RouterName.WareHouseEdit,
                        path: 'edit/:id',
                        component: () => import('pages/Panel/WareHouse/Pages/CreateOrUpdate/index.vue'),
                        meta: { title: 'Редактирование склада' },
                    },
                ],
            },
            {
                name: RouterName.Catalog,
                path: 'catalog/',
                meta: { title: 'Каталог' },
                children: [
                    {
                        path: 'section',
                        meta: { title: 'Разделы' },
                        children: [
                            {
                                name: RouterName.CatalogSection,
                                path: '',
                                component: () => import('pages/Panel/Catalog/Pages/Section/index.vue'),
                            },
                            {
                                name: RouterName.CatalogSectionCreate,
                                path: 'create/',
                                component: () => import('pages/Panel/Catalog/Pages/SectionCreate/index.vue'),
                                meta: { title: 'Создание раздела' },
                            },
                            {
                                name: RouterName.CatalogSectionEdit,
                                path: 'edit/:id',
                                component: () => import('pages/Panel/Catalog/Pages/SectionCreate/index.vue'),
                                meta: { title: 'Редактирование раздела' },
                            },
                        ],
                    },
                    {
                        path: 'products',
                        meta: { title: 'Товары' },
                        children: [
                            {
                                name: RouterName.CatalogProducts,
                                path: '',
                                component: () => import('pages/Panel/Catalog/Pages/Products/index.vue'),
                            },
                            {
                                name: RouterName.CatalogProductsCreate,
                                path: 'create/',
                                component: () => import('pages/Panel/Catalog/Pages/ProductCreatOrUpdate/index.vue'),
                                meta: { title: 'Создание товара' },
                            },
                            {
                                name: RouterName.CatalogProductsEdit,
                                path: 'edit/:id',
                                component: () => import('pages/Panel/Catalog/Pages/ProductCreatOrUpdate/index.vue'),
                                meta: { title: 'Редактирование товара' },
                            },
                            {
                                name: RouterName.CatalogUTPCreate,
                                path: ':slug/utp-create',
                                component: () => import('pages/Panel/Catalog/Pages/UTPCreateOrUpdate/index.vue'),
                                meta: { title: 'Создание торгового предложения' },
                            },
                            {
                                name: RouterName.CatalogUTPEdit,
                                path: ':slug/utp-edit/:id',
                                component: () => import('pages/Panel/Catalog/Pages/UTPCreateOrUpdate/index.vue'),
                                meta: { title: 'Редактирование торгового предложения' },
                            },
                        ],
                    },
                    {
                        path: 'property',
                        meta: { title: 'Свойства' },
                        children: [
                            {
                                name: RouterName.CatalogProperty,
                                path: '',
                                component: () => import('pages/Panel/Catalog/Pages/Property/index.vue'),
                            },
                            {
                                name: RouterName.CatalogPropertyCreate,
                                path: 'create/',
                                component: () => import('pages/Panel/Catalog/Pages/PropertyCreateOrUpdate/index.vue'),
                                meta: { title: 'Создание свойства' },
                            },
                            {
                                name: RouterName.CatalogPropertyEdit,
                                path: 'edit/:id',
                                component: () => import('pages/Panel/Catalog/Pages/PropertyCreateOrUpdate/index.vue'),
                                meta: { title: 'Редактирование свойства' },
                            },
                        ],
                    },
                ],
            },
            {
                path: 'users/',
                meta: { title: 'Пользователи' },
                children: [
                    {
                        path: '',
                        name: RouterName.Users,
                        component: () => import('pages/Panel/Users/Index/index.vue'),
                        meta: { title: 'Пользователи' },
                    },
                    {
                        name: RouterName.UsersCreate,
                        path: 'create/',
                        component: () => import('pages/Panel/Users/Create/index.vue'),
                        meta: { title: 'Создание пользователя' },
                    },
                    {
                        name: RouterName.UsersEdit,
                        path: 'edit/:id',
                        component: () => import('pages/Panel/Users/Create/index.vue'),
                        meta: { title: 'Редактирование пользователя' },
                    },
                ],
            },
            {
                path: 'pages/',
                meta: { title: 'Страницы' },
                children: [
                    {
                        name: RouterName.Pages,
                        path: '',
                        component: import('../pages/Panel/Pages/Index/index.vue'),
                    },
                    {
                        name: RouterName.PagesCreate,
                        path: 'create',
                        component: import('../pages/Panel/Pages/CreateOrUpdate/index.vue'),
                        meta: { title: 'Создание страницы' },
                    },
                    {
                        name: RouterName.PagesEdit,
                        path: ':id',
                        component: import('../pages/Panel/Pages/CreateOrUpdate/index.vue'),
                        meta: { title: 'Изменение страницы' },
                    },
                    {
                        path: 'blogs/',
                        meta: { title: 'Динамические страницы' },
                        children: [
                            {
                                name: RouterName.PagesBlogs,
                                path: '',
                                component: import('../pages/Panel/Pages/Blogs/Index/index.vue'),
                            },
                        ],
                    },
                    {
                        path: 'landings/',
                        meta: { title: 'Статические страницы' },
                        children: [
                            {
                                name: RouterName.PagesLanding,
                                path: '',
                                component: import('../pages/Panel/Pages/Landings/Index/index.vue'),
                            },
                        ],
                    },
                    {
                        path: 'records/',
                        meta: { title: 'Статьи' },
                        children: [
                            {
                                name: RouterName.Records,
                                path: '',
                                component: import('../pages/Panel/Pages/Records/Index/index.vue'),
                            },
                            {
                                name: RouterName.PagesBlogsRecordsCreate,
                                path: 'create',
                                component: import('../pages/Panel/Pages/Records/CreateOrUpdate/index.vue'),
                                meta: { title: 'Создание статьи' },
                            },
                            {
                                name: RouterName.PagesBlogsRecordsEdit,
                                path: ':id',
                                component: import('../pages/Panel/Pages/Records/CreateOrUpdate/index.vue'),
                                meta: { title: 'Изменение статьи' },
                            },
                        ],
                    },
                    {
                        name: RouterName.Comments,
                        path: 'comments',
                        component: import('../pages/Panel/Pages/components/Comments/CommentsTable.vue'),
                        meta: { title: 'Комментарии' },
                    },
                ],
            },
            {
                path: 'library/',
                meta: { title: 'Библиотека' },
                children: [
                    {
                        path: '',
                        children: [
                            {
                                name: RouterName.Library,
                                path: '',
                                component: () => import('pages/Panel/Library/Pages/Index/index.vue'),
                            },
                        ],
                    },
                    {
                        path: ':id',
                        children: [
                            {
                                name: RouterName.LibraryDirectory,
                                path: '',
                                component: () => import('pages/Panel/Library/Pages/Index/index.vue'),
                            },
                        ],
                    },
                ],
            },
            {
                path: 'callback',
                meta: { title: 'Формы обратной связи' },
                children: [
                    {
                        name: RouterName.Callback,
                        path: '',
                        component: () => import('pages/Panel/Callback/Index/index.vue'),
                    },
                    {
                        name: RouterName.CallbackEdit,
                        path: ':id',
                        component: () => import('pages/Panel/Callback/CreateOrUpdate/index.vue'),
                        meta: { title: 'Редактирвоание' },
                    },
                    {
                        name: RouterName.CallbackCreate,
                        path: 'create',
                        component: () => import('pages/Panel/Callback/CreateOrUpdate/index.vue'),
                        meta: { title: 'Создание' },
                    },
                    {
                        path: ':id/instances',
                        meta: { title: 'Список заявок' },
                        children: [
                            {
                                name: RouterName.CallbackInstances,
                                path: '',
                                component: () => import('pages/Panel/Callback/Instances/Index/index.vue'),
                            },
                            {
                                name: RouterName.CallbackInstancesCreate,
                                path: 'create',
                                component: () => import('pages/Panel/Callback/Instances/CreateOrUpdate/index.vue'),
                                meta: { title: 'Создание записи' },
                            },
                            {
                                name: RouterName.CallbackInstancesEdit,
                                path: ':instancesId',
                                component: () => import('pages/Panel/Callback/Instances/CreateOrUpdate/index.vue'),
                                meta: { title: 'Редактирование записи' },
                            },
                        ],
                    },
                ],
            },
            {
                path: 'settings/',
                meta: { title: 'Настройки' },
                children: [
                    {
                        path: '',
                        children: [
                            {
                                name: RouterName.Settings,
                                path: '',
                                component: () => import('pages/Panel/Settings/Index/index.vue'),
                            },
                            {
                                path: 'menu',
                                meta: { title: 'Настройки меню' },
                                children: [
                                    {
                                        name: RouterName.SettingsMenu,
                                        path: '',
                                        component: () => import('pages/Panel/Settings/Menu/Index/index.vue'),
                                    },
                                    {
                                        name: RouterName.SettingsMenuInfo,
                                        path: 'info/:id',
                                        component: () => import('pages/Panel/Settings/Menu/Info/index.vue'),
                                        meta: { title: 'Детальная информацию о меню' },
                                    },
                                    {
                                        name: RouterName.SettingsMenuEdit,
                                        path: ':id',
                                        component: () => import('pages/Panel/Settings/Menu/CreateOrUpdate/index.vue'),
                                        meta: { title: 'Редактирвоание' },
                                    },
                                    {
                                        name: RouterName.SettingsMenuCreate,
                                        path: 'create',
                                        component: () => import('pages/Panel/Settings/Menu/CreateOrUpdate/index.vue'),
                                        meta: { title: 'Создание' },
                                    },
                                ],
                            },
                            {
                                path: 'reference-book',
                                meta: { title: 'Справочники' },
                                children: [
                                    {
                                        name: RouterName.ReferenceBook,
                                        path: '',
                                        component: () => import('pages/Panel/Settings/ReferenceBook/Index/index.vue'),
                                    },
                                    {
                                        name: RouterName.ReferenceBookEdit,
                                        path: ':id',
                                        component: () => import('pages/Panel/Settings/ReferenceBook/CreateOrUpdate/index.vue'),
                                        meta: { title: 'Редактирвоание' },
                                    },
                                    {
                                        name: RouterName.ReferenceBookCreate,
                                        path: 'create',
                                        component: () => import('pages/Panel/Settings/ReferenceBook/CreateOrUpdate/index.vue'),
                                        meta: { title: 'Создание' },
                                    },
                                    {
                                        path: ':id/instances',
                                        meta: { title: 'Записи справочника' },
                                        children: [
                                            {
                                                name: RouterName.ReferenceBookInstances,
                                                path: '',
                                                component: () => import('pages/Panel/Settings/ReferenceBook/Instances/Index/index.vue'),
                                            },
                                            {
                                                name: RouterName.ReferenceBookInstancesCreate,
                                                path: 'create',
                                                component: () => import('pages/Panel/Settings/ReferenceBook/Instances/CreateOrUpdate/index.vue'),
                                                meta: { title: 'Создание записи' },
                                            },
                                            {
                                                name: RouterName.ReferenceBookInstancesEdit,
                                                path: ':instancesId',
                                                component: () => import('pages/Panel/Settings/ReferenceBook/Instances/CreateOrUpdate/index.vue'),
                                                meta: { title: 'Редактирование записи' },
                                            },
                                        ],
                                    },
                                ],
                            },
                        ],
                    },
                ],
            },
        ],
    },

    // Always leave this as last one,
    // but you can also remove it
    {
        path: '/:catchAll(.*)*',
        component: () => import('pages/ErrorNotFound.vue'),
    },
];

export default routes;

import type { RouteRecordRaw } from 'vue-router';
import { RouterName } from './routerName';

const routes: RouteRecordRaw[] = [
	{
		path: '/',
		component: () => import('layouts/MainLayout.vue'),
		children: [
			{
				name: RouterName.Home,
				path: '',
				component: () => import('src/pages/Home/index.vue'),
			},
			{
				name: RouterName.Policy,
				path: 'policy',
				component: () => import('src/pages/Policy/index.vue')
			},
			{
				name: RouterName.Career,
				path: 'career',
				component: () => import('src/pages/Career/index.vue')
			},
			{
				name: RouterName.Clients,
				path: 'clients',
				component: () => import('src/pages/Clients/index.vue')
			},
			{
				name: RouterName.Services,
				path: 'services',
				component: () => import('src/pages/Services/index.vue'),
				meta: {
					background: 'white',
				}
			},
			{
				name: RouterName.Products,
				path: 'products',
				component: () => import('src/pages/Products/index.vue'),
				meta: {
					background: 'white',
				}
			},
			{
				name: RouterName.Partners,
				path: 'partners',
				component: () => import('src/pages/Partners/index.vue')
			},
			{
				name: RouterName.News,
				path: 'news',
				component: () => import('src/pages/News/index.vue'),
				meta: {
					background: 'white',
				}
			},
			{
				name: RouterName.About,
				path: 'about',
				component: () => import('src/pages/About/index.vue')
			},
			{
				name: RouterName.Contacts,
				path: 'contacts',
				component: () => import('src/pages/Contacts/index.vue'),
				meta: {
					background: 'white',
				}
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

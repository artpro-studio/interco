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
				component: () => import('src/pages/Home/index.vue')
			}
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

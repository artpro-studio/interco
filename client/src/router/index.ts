import { defineRouter } from '#q-app/wrappers';
import { createMemoryHistory, createRouter, createWebHashHistory, createWebHistory } from 'vue-router';
import routes from './routes';
import { nextTick } from 'vue';

/*
 * If not building with SSR mode, you can
 * directly export the Router instantiation;
 *
 * The function below can be async too; either use
 * async/await or return a Promise which resolves
 * with the Router instance.
 */

export default defineRouter(function (/* { store, ssrContext } */) {
	const createHistory = process.env.SERVER
		? createMemoryHistory
		: process.env.VUE_ROUTER_MODE === 'history'
			? createWebHistory
			: createWebHashHistory;

	const Router = createRouter({
		scrollBehavior(to, from, savedPosition) {
			if (savedPosition) {
				return savedPosition;
			} else if (to.hash) {
				return new Promise((resolve) => {
					nextTick(() => {
						setTimeout(() => {
							const element = document.querySelector(to.hash);
							if (element) {
								const headerOffset = 110;
								const elementPosition = element.getBoundingClientRect().top + window.scrollY;
								const offsetPosition = elementPosition - headerOffset;
								resolve({ left: 0, top: offsetPosition, behavior: 'smooth' });
							} else {
								resolve({ el: to.hash, behavior: 'smooth' });
							}
						}, 300); // небольшая задержка (можно поэкспериментировать)
					});
				});
			}
			return { top: 0 };
		},
		routes,

		// Leave this as is and make changes in quasar.conf.js instead!
		// quasar.conf.js -> build -> vueRouterMode
		// quasar.conf.js -> build -> publicPath
		history: createHistory(process.env.VUE_ROUTER_BASE),
	});

	return Router;
});

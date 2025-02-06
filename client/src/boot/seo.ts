import { defineBoot } from '@quasar/app-vite/wrappers';

export default defineBoot(async ({ssrContext, urlPath }: any) => {
	console.log('test');
	// SSR: получаем SEO перед рендерингом
	if (ssrContext) {
		try {
			const arrUrl = urlPath.split('/')
			const slug = arrUrl[arrUrl.length - 1] || 'home';
			const response = await fetch(`${process.env.VUE_APP_HTTP_BACKEND}/api/pages-public/get-seo-for-page?slug=${slug}`); // замените на свой API
			const data = await response.json();
			ssrContext.seoData = data.entity;

		} catch (error) {
			console.error('Ошибка загрузки SEO:', error);
		}
	}
});

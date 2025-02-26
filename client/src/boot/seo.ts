import { defineBoot } from '@quasar/app-vite/wrappers';

export default defineBoot(async ({ssrContext, urlPath }: any) => {
	// SSR: получаем SEO перед рендерингом
	if (ssrContext) {
		try {
			const arrUrl = urlPath.split('/')
			const slug = arrUrl[arrUrl.length - 1] || 'home';
			const response = await fetch(`${import.meta.env.VITE_APP_BACKEND}/api/pages-public/get-seo-for-page?slug=${slug}`)
			const data = await response.json();
			ssrContext.seoData = data.entity;

		} catch (error) {
			console.error('Ошибка загрузки SEO:', error);
		}
	}
});

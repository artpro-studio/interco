import { useMeta } from 'quasar';
import { useSSRContext } from 'vue';

export function useSeo(seoData: { title: string, description?: string, keywords?: string }) {
  const ssrContext = import.meta.env.SSR ? useSSRContext() as any : null;

  // Устанавливаем SEO параметры в контексте для SSR
  if (ssrContext) {
    ssrContext.seoData = seoData;
  }

  // Устанавливаем мета-данные
  useMeta({
    title: seoData.title || 'Default Title',
	titleTemplate: title => `${title} - SA International`,
	meta: {
		description:  { name: 'description', content: seoData.description || '' },
		keywords:  { name: 'keywords', content: seoData.keywords || '' },
		equiv: { 'http-equiv': 'Content-Type', content: 'text/html; charset=UTF-8' },
		ogTitle:  {
			property: 'og:title',
			// optional; similar to titleTemplate, but allows templating with other meta properties
			template (ogTitle) {
			  return `${ogTitle} - SA International`
			}
		  }
	}
    // meta: [
    //   { name: 'description', content: seoData.description || 'Default description' },
    //   { name: 'keywords', content: seoData.keywords || '' }
    // ]
  });
}

import { getApiClientInitialParams, PagesPublicControllerClient } from "src/ApiClient/ApiClient";
import { useSSRContext } from "vue";
import { useI18n } from "vue-i18n";
import { useSeo } from "./seo";

export async function useGetMeta(slug: string) {
	const ssrContext = useSSRContext();
	const { locale } = useI18n();
	const api = new PagesPublicControllerClient(getApiClientInitialParams());

	if (!ssrContext) {
		const result = await api.getSeoPage(slug);
		if (!result.isSuccess) {
			useSeo({
				title: '',
				description: '',
				keywords: '',
			})
		} else {
			const data = result.entity;
			useSeo({
				title: data.title![locale.value] || '',
				description: data.description![locale.value] || '',
				keywords: data.keywords![locale.value] || '',
			})
		}
	}
}

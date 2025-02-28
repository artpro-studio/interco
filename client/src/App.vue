<script lang="ts" setup>
	import { onMounted, ref, useSSRContext } from 'vue';
	import { useSeo } from './hooks/seo';
	import { getApiClientInitialParams, SettingsPublicControllerClient } from './ApiClient/ApiClient';
	import { useStore } from 'src/store';

	const ssrContext = useSSRContext();
	const store = useStore();

	const isLoading = ref(true);
	// Пример использования useSeo
	const seoData = ssrContext?.seoData;
	if (ssrContext) {
		const langs: any = {
			'ru-RU': 'ru-RU',
			'en-US': 'en-US',
			'zh-CN': 'zh-CN',
		}
		const locale = navigator.language!; // 'ru-RU', 'zh-CN', 'en-US'
		const shortLocale = langs[locale] || 'en-US';
		useSeo({
			title: seoData?.title[shortLocale] || '',
			description: seoData?.description[shortLocale] || '',
			keywords: seoData?.keywords[shortLocale] || ''
		});
	} else {
		// Извлекаем данные SEO с мета-тегов (если они были установлены на сервере)
		const title = document.querySelector('title')?.text;
		const description = document.querySelector('meta[name="description"]')?.getAttribute('content');
		const keywords = document.querySelector('meta[name="keywords"]')?.getAttribute('content');
		useSeo({
			title: title || '',
			description: description|| '',
			keywords: keywords|| ''
		});
	}

	const getSettings = () => {
		new SettingsPublicControllerClient(getApiClientInitialParams()).getSettings()
			.then((res) => {
				store.commit('settingsModule/setSettings', res.entity)
			})
	}

	onMounted(() => {
		isLoading.value = false;

		if (!ssrContext) {
			getSettings();
		}
	})

</script>
<template>
	<div v-if="isLoading" class="preloader"></div>
	<router-view v-else />
</template>

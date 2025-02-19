<script lang="ts" setup>
	import { onMounted, ref, useSSRContext } from 'vue';
	import { useSeo } from './hooks/seo';

	const isLoading = ref(true);
	// Пример использования useSeo
	const ssrContext = useSSRContext();
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

	onMounted(() => {
		isLoading.value = false;
	})

</script>
<template>
	<div v-if="isLoading" class="preloader"></div>
	<router-view v-else />
</template>

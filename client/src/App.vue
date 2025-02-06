<script lang="ts" setup>
	import { useSSRContext } from 'vue';
	import { useSeo } from './hooks/seo';

	// Пример использования useSeo
	const ssrContext = useSSRContext();
	const seoData = ssrContext?.seoData;
	if (ssrContext) {
		const availableLocales = ['en', 'ru', 'ch'];
		const locale = navigator.language!; // 'ru-RU', 'zh-CN', 'en-US'
		let shortLocale = locale.split('-')[0]!; // 'ru', 'zh', 'en'
		shortLocale = shortLocale === 'zh' ? 'ch' : shortLocale;
		shortLocale = availableLocales.includes(shortLocale) ? shortLocale : 'en'
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

</script>
<template>
  	<router-view />
</template>

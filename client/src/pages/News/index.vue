<script lang="ts" setup>
	import NewsHead from './components/NewsHead.vue';
	import NewsList from './components/NewsList.vue';
	import NewsAnalytics from './components/NewsAnalytics.vue';
	import NewsRelease from './components/NewsRelease.vue';
	import NewsForm from './components/NewsForm.vue';
	import SectionSocial from 'src/components/SectionSocial/SectionSocial.vue';
	import BannerCallback from 'src/components/BannerCallback/BannerCallback.vue';
	import NewsBanner from './components/NewsBanner.vue';
	import { useI18n } from 'vue-i18n';
	import { onMounted } from 'vue';
	import { useGetMeta } from 'src/hooks/useGetMeta';

	const { t } = useI18n();

	onMounted(() => {
		useGetMeta('news')
	})
</script>

<template>
	<news-head
		:title="t('newsHeadTitle')"
		:text="t('newsHeadDescription')"
		width-title="957px"
		width-text="653px"
		images="images/news-bg.svg"
		:dense="false"
	/>
	<news-list />
	<news-analytics />
	<news-release />
	<news-form />
	<section-social />
	<banner-callback />
	<news-banner />
</template>

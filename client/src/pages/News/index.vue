<script lang="ts" setup>
	import NewsHead from './components/NewsHead.vue';
	import NewsList from './components/NewsList.vue';
	import NewsAnalytics from './components/NewsAnalytics.vue';
	import NewsRelease from './components/NewsRelease.vue';
	import NewsForm from './components/NewsForm.vue';
	import SectionSocial from 'src/components/SectionSocial/SectionSocial.vue';
	import BannerCallback from 'src/components/BannerCallback/BannerCallback.vue';
	import NewsBanner from './components/NewsBanner.vue';
</script>

<template>
	<news-head
		title="Добро пожаловать в раздел новостей и статей компании SA International"
		text="Здесь вы найдете актуальную информацию о наших последних проектах, достижениях, мероприятиях, а также экспертные материалы по различным отраслевым темам."
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

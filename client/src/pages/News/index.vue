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
	import { computed, onMounted, ref } from 'vue';
	import { useGetMeta } from 'src/hooks/useGetMeta';
	import { getApiClientInitialParams, PagesIblockPublicDto, PagesPublicControllerClient } from 'src/ApiClient/ApiClient';

	const { t } = useI18n();

	const iblocks = ref<PagesIblockPublicDto[]>([]);

	const SLUG_HEADER_NEWS = 'header-news';
	const SLUG_HEADER_ATRICLES = 'header-articles-analytics';
	const SLUG_HEADER_PRESS = 'header-press-release';
	const SLUG_NEWS_SOCILA = 'news-socail';
	const SLUG_NEWS_CONTACTS = 'news-contacts';

	const getNewsHeader = computed(() => {
		const data = iblocks.value?.find((el) => el.slug === SLUG_HEADER_NEWS);

		return data && data.records?.length ? data.records[0] : null;
	})

	const getHeaderArticles = computed(() => {
		const data = iblocks.value?.find((el) => el.slug === SLUG_HEADER_ATRICLES);

		return data && data.records?.length ? data.records[0] : null;
	})

	const getHeaderPress = computed(() => {
		const data = iblocks.value?.find((el) => el.slug === SLUG_HEADER_PRESS);

		return data && data.records?.length ? data.records[0] : null;
	})

	const getSocial = computed(() => {
		const data = iblocks.value?.find((el) => el.slug === SLUG_NEWS_SOCILA);

		return data && data.records?.length ? data.records[0] : null;
	})

	const getContacts = computed(() => {
		const data = iblocks.value?.find((el) => el.slug === SLUG_NEWS_CONTACTS);

		return data && data.records?.length ? data.records[0] : null;
	})

	const getIblocks = () => {
		new PagesPublicControllerClient(getApiClientInitialParams()).getIblockForSlugsArray([SLUG_HEADER_NEWS, SLUG_HEADER_ATRICLES, SLUG_HEADER_PRESS, SLUG_NEWS_SOCILA, SLUG_NEWS_CONTACTS])
			.then((res) => {
				iblocks.value = res.entity || []
			})
	}

	onMounted(() => {
		useGetMeta('news')
		getIblocks();
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
	<news-list :header="getNewsHeader" />
	<news-analytics :header="getHeaderArticles" />
	<news-release :header="getHeaderPress" />
	<news-form />
	<section-social :data="getSocial" />
	<banner-callback />
	<news-banner :data="getContacts" />
</template>

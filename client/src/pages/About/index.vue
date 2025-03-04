<script lang="ts" setup>
	import HeadGlobal from 'src/components/HeadGlobal/HeadGlobal.vue';
	import AboutYears from './components/AboutYears.vue';
	import AboutMission from './components/AboutMission.vue';
	import AboutGroup from './components/AboutGroup.vue';
	import AboutMaps from './components/AboutMaps.vue';
	import AboutTeam from './components/AboutTeam.vue';
	import AboutCulture from './components/AboutCulture.vue';
	import AboutPrinciples from './components/AboutPrinciples.vue';
	import BannerCallback from 'src/components/BannerCallback/BannerCallback.vue';
	import BannerSaInternational from 'src/components/BannerSaInternational/BannerSaInternational.vue';
	import { useI18n } from 'vue-i18n';
	import { computed, onMounted, ref } from 'vue';
	import { useGetMeta } from 'src/hooks/useGetMeta';
	import { getApiClientInitialParams, PagesPublicControllerClient, PagesPublicDto } from 'src/ApiClient/ApiClient';

	const { t, locale } = useI18n();

	const SLUG_COMPANY = 'about-company';
	const SLUG_KEY_MILESTONES = 'key-milestones';
	const SLUG_COMMAND = 'command';
	const SLUG_GROUP_COMPANY = 'group-compnay';

	const pagePublic = ref<PagesPublicDto | null>(null);

	const getGroupCompnay = computed(() => {
		const data: any = pagePublic.value?.iblocks?.find((el) => el.slug === SLUG_GROUP_COMPANY)?.records;
		return data?.length ? data[0] : null;
	});

	const getCompany = computed(() => {
		const data: any = pagePublic.value?.iblocks?.find((el) => el.slug === SLUG_COMPANY)?.records;
		return data?.length ? data[0] : null;
	});

	const getKeyMilestones = computed(() => {
		const data: any = pagePublic.value?.iblocks?.find((el) => el.slug === SLUG_KEY_MILESTONES)?.records;
		return data;
	});

	const getCommand = computed(() => {
		const data: any = pagePublic.value?.iblocks?.find((el) => el.slug === SLUG_COMMAND)?.records;
		return data;
	});

	const getInfo = () => {
		new PagesPublicControllerClient(getApiClientInitialParams()).getOneForSlug('about').then((data) => {
			pagePublic.value = data.entity;
		});
	};

	onMounted(() => {
		useGetMeta('about');
		getInfo();
	});
</script>

<template>
	<head-global
		:title="t('aboutHeadTitle')"
		:sub-title="getCompany?.fields?.title[locale].value"
		:text="getCompany?.fields?.description[locale].value"
		images="images/head-about-bg.png"
		width-text="653px"
		width-title="957px"
		:dense="false"
	/>
	<about-years :data="getKeyMilestones" />
	<about-mission />
	<about-group :data="getGroupCompnay" />
	<about-maps />
	<about-team :data="getCommand" />
	<about-culture />
	<about-principles />
	<banner-callback />
	<banner-sa-international :title="t('aboutBannerTitle')" :description="t('aboutBannerDescription')" />
</template>

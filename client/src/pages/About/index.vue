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
	import { onMounted } from 'vue';
	import { useGetMeta } from 'src/hooks/useGetMeta';

	const { t } = useI18n();

	onMounted(() => {
		useGetMeta('about')
	})
</script>

<template>
	<head-global
		:title="t('aboutHeadTitle')"
		:sub-title="t('aboutHeadSubTitle')"
		:text="t('aboutHeadSubText')"
		images="images/head-about-bg.png"
		width-text="653px"
		width-title="957px"
		:dense="false"
	/>
	<about-years />
	<about-mission />
	<about-group />
	<about-maps />
	<about-team />
	<about-culture />
	<about-principles />
	<banner-callback />
	<banner-sa-international
		:title="t('aboutBannerTitle')"
		:description="t('aboutBannerDescription')"
	/>
</template>

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
</script>

<template>
	<head-global
		title="О компании"
		sub-title="История компании"
		text="Основанная в 2020 году, компания SA International (上海亚际机电有限公司) начала свой путь как часть SIBC Group, фокусируясь на предоставлении консалтинговых услуг и подборе промышленного оборудования для различных отраслей. Наша цель с самого начала заключалась в том, чтобы стать надежным партнером для предприятий по всему миру, предлагая инновационные решения и высокий уровень сервиса."
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
		title="SA International —  "
		description="ваш надежный партнер в мире промышленного оборудования и технологий"
	/>
</template>

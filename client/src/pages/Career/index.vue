<script lang="ts" setup>
	import HeadGlobal from 'src/components/HeadGlobal/HeadGlobal.vue';
	import JobOpenings from './components/JobOpenings.vue';
	import CareerAdvantages from './components/CareerAdvantages.vue';
	import CareerProcces from './components/CareerProcces.vue';
	import CareerEmployee from './components/CareerEmployee.vue';
	import CareerForm from './components/CareerForm.vue';
	import BannerContacts from 'src/components/BannerContacts/BannerContacts.vue';
	import { useI18n } from 'vue-i18n';
	import { onMounted } from 'vue';
	import { useGetMeta } from 'src/hooks/useGetMeta';

	const { t } = useI18n();

	onMounted(() => {
		useGetMeta('career')
	})
</script>

<template>
	<head-global
		:title="t('careerHeadTitle')"
		:text="t('careerHeadDescription')"
		width-text="653px"
		width-title="957px"
		images="images/career-head.svg"
		:dense="false"
	/>
	<job-openings />
	<career-advantages />
	<career-procces />
	<career-employee />
	<career-form />
	<banner-contacts
		:title="t('careerContactsTitle')"
		phone="+86-21-5432-2755 (ext. 812)"
		email="hr@inter-sa.com"
		text="Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-505"
	/>
</template>

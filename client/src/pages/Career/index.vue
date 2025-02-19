<script lang="ts" setup>
	import HeadGlobal from 'src/components/HeadGlobal/HeadGlobal.vue';
	import JobOpenings from './components/JobOpenings.vue';
	import CareerAdvantages from './components/CareerAdvantages.vue';
	import CareerProcces from './components/CareerProcces.vue';
	import CareerEmployee from './components/CareerEmployee.vue';
	import CareerForm from './components/CareerForm.vue';
	import BannerContacts from 'src/components/BannerContacts/BannerContacts.vue';
	import { useI18n } from 'vue-i18n';
	import { computed, onMounted, ref } from 'vue';
	import { useGetMeta } from 'src/hooks/useGetMeta';
	import { getApiClientInitialParams, PagesPublicControllerClient, PagesPublicDto } from 'src/ApiClient/ApiClient';

	const { t, locale } = useI18n();
	const SLUG_JOB = 'job-openings';
	const SLUG_EMPLOYEE = 'career-employee';
	const SLUG_CONTACTS = 'career-contcats';

	const pagePublic = ref<PagesPublicDto | null>(null);

	const getJobs = computed(() => {
		const data: any = pagePublic.value?.iblocks?.find((el) => el.slug === SLUG_JOB)?.records
		return data;
	})

	const getEmployee = computed(() => {
		const data: any = pagePublic.value?.iblocks?.find((el) => el.slug === SLUG_EMPLOYEE)?.records
		return data;
	})

	const getContacts = computed(() => {
		const data: any = pagePublic.value?.iblocks?.find((el) => el.slug === SLUG_CONTACTS)?.records
		return data?.length ? data[0] : null;
	})

	const getInfo = () => {
		new PagesPublicControllerClient(getApiClientInitialParams()).getOneForSlug('career')
		.then((data) => {
			pagePublic.value = data.entity;
		})
	}

	onMounted(() => {
		useGetMeta('career');
		getInfo();
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
	<job-openings :data="getJobs" />
	<career-advantages />
	<career-procces />
	<career-employee :data="getEmployee" />
	<career-form />
	<banner-contacts
		:title="getContacts?.fields.title[locale].value"
		:phone="getContacts?.fields.phone[locale].value + ' (ext. ' + getContacts?.fields['code-phone'][locale].value  + ')'"
		:email="getContacts?.fields.email[locale].value"
		:text="getContacts?.fields.description[locale].value"
	/>
</template>

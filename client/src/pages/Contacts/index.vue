<script lang="ts" setup>
	import ContactsHead from './components/ContactsHead.vue';
	import ContactsTabs from './components/ContactsTabs.vue';
	import ContactsForm from './components/ContactsForm.vue';
	import SectionSocial from 'src/components/SectionSocial/SectionSocial.vue';
	import ContactsGeneral from './components/ContactsGeneral.vue';
	import ContactsBanner from './components/ContactsBanner.vue';
	import { computed, onMounted, ref } from 'vue';
	import { useGetMeta } from 'src/hooks/useGetMeta';
	import { getApiClientInitialParams, PagesPublicControllerClient, PagesPublicDto } from 'src/ApiClient/ApiClient';

	const SLUG_MAIN = 'main-contacts';
	const SLUG_SOCIAL = 'social';
	const SLUG_COMMON = 'common-contacts';

	const pagePublic = ref<PagesPublicDto | null>(null);

	const getMain = computed(() => {
		const data: any = pagePublic.value?.iblocks?.find((el) => el.slug === SLUG_MAIN)?.records
		return data;
	})

	const getSocail = computed(() => {
		const data: any = pagePublic.value?.iblocks?.find((el) => el.slug === SLUG_SOCIAL)?.records
		return data?.length ? data[0] : null;
	})

	const getCommon = computed(() => {
		const data: any = pagePublic.value?.iblocks?.find((el) => el.slug === SLUG_COMMON)?.records
		return data?.length ? data[0] : null;
	})

	const getInfo = () => {
		new PagesPublicControllerClient(getApiClientInitialParams()).getOneForSlug('contacts')
		.then((data) => {
			pagePublic.value = data.entity;
		})
	}

	onMounted(() => {
		useGetMeta('contacts');
		getInfo();
	})
</script>
<template>
	<contacts-head />
	<contacts-tabs :data="getMain"/>
	<contacts-form />
	<section-social class="bg-white" :data="getSocail" />
	<contacts-general :data="getCommon" />
	<contacts-banner />
</template>

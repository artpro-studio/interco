<script lang="ts" setup>
	import HeadGlobal from 'src/components/HeadGlobal/HeadGlobal.vue';
	import Support from './components/Support.vue';
	import ClientsBanner from './components/ClientsBanner.vue';
	import Faq from './components/Faq.vue';
	import ClientsForm from './components/ClientsForm.vue';
	import ClientsContacts from 'src/components/ClientsContacts/ClientsContacts.vue';
	import ClientsSectionText from './components/ClientsSectionText.vue';
	import { useI18n } from 'vue-i18n';
	import { computed, onMounted, ref } from 'vue';
	import { getApiClientInitialParams, PagesIblockPublicDto, PagesPublicControllerClient } from 'src/ApiClient/ApiClient';
	import { useGetMeta } from 'src/hooks/useGetMeta';
	import Loader from 'src/components/Loader/Loader.vue';

	const { t } = useI18n();

	const SLUG_CONCTACTS = 'clients-contacts';
	const isLoader = ref(true);

	const iblocks = ref<PagesIblockPublicDto | null>(null);

	const getContacts = computed(() => {
		const data: any = iblocks.value?.records;
		return data;
	});

	const getIblocks = () => {
		new PagesPublicControllerClient(getApiClientInitialParams()).getIblockForSlug(SLUG_CONCTACTS).then((res) => {
			iblocks.value = res.entity;
			isLoader.value = false;
		});
	};

	onMounted(() => {
		useGetMeta('clients');
		getIblocks();
	});
</script>

<template>
	<loader v-if="isLoader" />
	<head-global
		width-title="957px"
		width-text="653px"
		:title="t('clientsHeadTitle')"
		:text="t('clientsHeadDescription')"
		images="images/clients-bg.png"
		:dense="false"
	/>
	<support />
	<clients-banner />
	<faq />
	<clients-form />
	<clients-contacts :data="getContacts" />
	<clients-section-text />
</template>

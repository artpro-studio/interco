<script lang="ts" setup>
	import HeadGlobal from 'src/components/HeadGlobal/HeadGlobal.vue';
	import Support from './components/Support.vue';
	import ClientsBanner from './components/ClientsBanner.vue';
	import Faq from './components/Faq.vue';
	import ClientsForm from './components/ClientsForm.vue';
	import ClientsContacts from 'src/components/ClientsContacts/ClientsContacts.vue';
	import ClientsSectionText from './components/ClientsSectionText.vue';
	import { useI18n } from 'vue-i18n';
	import { useGetMeta } from 'src/hooks/useGetMeta';
	import { computed, onMounted, ref } from 'vue';
	import { getApiClientInitialParams, PagesPublicControllerClient, PagesPublicDto } from 'src/ApiClient/ApiClient';

	const {t} = useI18n();

	const SLUG_FAQ = 'faq';
	const SLUG_CONCTACTS = 'clients-contacts';

	const pagePublic = ref<PagesPublicDto | null>(null);

	const getQuestions = computed(() => {
		const sections: any = pagePublic.value?.iblocks?.find((el) => el.slug === SLUG_FAQ)?.sections
		const records: any = pagePublic.value?.iblocks?.find((el) => el.slug === SLUG_FAQ)?.records
		return sections?.map((el: any) => {
			const data = records.filter((item: any) => {
				const ids: any[] = item.sections?.map((section: any) => section.id);
				return ids.includes(el.id)
			})
			return {
				...el,
				data
			}
		});
	});

	const getContacts = computed(() => {
		const data: any = pagePublic.value?.iblocks?.find((el) => el.slug === SLUG_CONCTACTS)?.records
		return data;
	})

	const getInfo = () => {
		new PagesPublicControllerClient(getApiClientInitialParams()).getOneForSlug('clients')
		.then((data) => {
			pagePublic.value = data.entity;
		})
	}

	onMounted(() => {
		useGetMeta('clients');
		getInfo();
	})
</script>

<template>
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
	<faq :data="getQuestions" />
	<clients-form />
	<clients-contacts :data="getContacts" />
	<clients-section-text />
</template>

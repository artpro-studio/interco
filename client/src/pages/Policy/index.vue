<script lang="ts" setup>
	import HeadGlobal from 'src/components/HeadGlobal/HeadGlobal.vue';
	import PolicySection from './components/PolicySection.vue';
	import PolicyUser from './components/PolicyUser.vue';
	import PolicyWarning from './components/PolicyWarning.vue';
	import BannerContacts from 'src/components/BannerContacts/BannerContacts.vue';

	import { useI18n } from 'vue-i18n';
	import { computed, onMounted, ref } from 'vue';
	import { useGetMeta } from 'src/hooks/useGetMeta';
	import { getApiClientInitialParams, PagesPublicControllerClient, PagesPublicDto } from 'src/ApiClient/ApiClient';

	const { t } = useI18n();

	const SLUG_DOCUMENTS = 'documents';

	const pagePublic = ref<PagesPublicDto | null>(null);

	const getDocuments = computed(() => {
		const data: any = pagePublic.value?.iblocks?.find((el) => el.slug === SLUG_DOCUMENTS)?.records
		return data;
	})

	const getInfo = () => {
		new PagesPublicControllerClient(getApiClientInitialParams()).getOneForSlug('policy')
		.then((data) => {
			pagePublic.value = data.entity;
		})
	}

	onMounted(() => {
		useGetMeta('policy')
		getInfo();
	})
</script>

<template>
	<head-global
		width-text="372px"
		width-title="957px"
		:title="t('policyHeadtitle')"
		:text="t('policyHeaddescription')"
		images="images/our-policy-documents.svg"
	/>
	<policy-section
		v-for="(item, index) in getDocuments"
		:key="index"
		:data="item.fields"
	/>
	<policy-warning />
	<banner-contacts
		title="SA International"
		:description="t('policyContactsDescription')"
		:text="t('policyContactsInfo')"
		phone="+86-21-5432-2755"
		email="info@inter-sa.com"
	/>
</template>

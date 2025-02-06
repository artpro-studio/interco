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
	import { onMounted } from 'vue';

	const {t} = useI18n();

	onMounted(() => {
		useGetMeta('client')
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
	<faq />
	<clients-form />
	<clients-contacts />
	<clients-section-text />
</template>

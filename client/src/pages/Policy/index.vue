<script lang="ts" setup>
	import HeadGlobal from './components/HeadGlobal.vue';
	import PolicySection from './components/PolicySection.vue';
	import PolicyUser from './components/PolicyUser.vue';
	import PolicyWarning from './components/PolicyWarning.vue';
	import BannerContacts from 'src/components/BannerContacts/BannerContacts.vue';

	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>

<template>
	<head-global
		width-text="372px"
		width-title="957px"
		:title="t('policyHeadtitle')"
		:text="t('policyHeaddescription')"
		images="images/our-policy-documents.svg"
	/>
	<policy-section />
	<policy-user />
	<policy-warning />
	<banner-contacts
		title="SA International"
		:description="t('policyContactsDescription')"
		:text="t('policyContactsInfo')"
		phone="+86-21-5432-2755"
		email="info@inter-sa.com"
	/>
</template>

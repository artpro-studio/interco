<script lang="ts" setup>
	import ContactsHead from './components/ContactsHead.vue';
	import ContactsTabs from './components/ContactsTabs.vue';
	import ContactsForm from './components/ContactsForm.vue';
	import SectionSocial from 'src/components/SectionSocial/SectionSocial.vue';
	import ContactsGeneral from './components/ContactsGeneral.vue';
	import ContactsBanner from './components/ContactsBanner.vue';
	import { onMounted } from 'vue';
	import { useGetMeta } from 'src/hooks/useGetMeta';

	onMounted(() => {
		useGetMeta('contacts')
	})
</script>
<template>
	<contacts-head />
	<contacts-tabs />
	<contacts-form />
	<section-social class="bg-white" />
	<contacts-general />
	<contacts-banner />
</template>

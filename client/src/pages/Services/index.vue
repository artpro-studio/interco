<script lang="ts" setup>
	import ServicesHead from './components/ServicesHead.vue';
	import ClientsContacts from 'src/components/ClientsContacts/ClientsContacts.vue';
	import ServiceFilter from './components/ServiceFilter.vue';
	import ServiceItem from './components/ServiceItem.vue';
	import { serviceData } from './data';
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();

	const ServiceData = serviceData;

</script>

<template>
	<services-head
		:title="t('servicesHeadTitle')"
		:text="t('servicesHeadDescription')"
		width-title="1000px"
		width-text="717px"
		images="images/SA.svg"
		:dense="false"
	/>
	<service-filter />
	<service-item
		v-for="(item, index) in ServiceData"
		:key="index"
		:title="item.title"
		:text="item.description"
		:image="item.image"
		:description="item.list.description"
		:specifications="item.list.specifications"
		:spheres="item.list.spheres"
		:advantages="item.list.advantages"
	/>
	<clients-contacts />
</template>

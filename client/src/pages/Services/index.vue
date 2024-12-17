<script lang="ts" setup>
	import ServicesHead from './components/ServicesHead.vue';
	import ClientsContacts from 'src/components/ClientsContacts/ClientsContacts.vue';
	import ServiceFilter from './components/ServiceFilter.vue';
	import ServiceItem from './components/ServiceItem.vue';
	import { serviceData } from './data';

	const ServiceData = serviceData;
</script>

<template>
	<services-head
		title="Продукты и услуги"
		text="Мы предлагаем широкий спектр продуктов и услуг, направленных на удовлетворение потребностей предприятий в различных отраслях промышленности. Наши решения основаны на передовых технологиях и многолетнем опыте работы в сфере поставок и производства промышленного оборудования."
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

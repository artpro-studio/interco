<script lang="ts" setup>
	import ProductsServicesHead from 'src/components/ProductsServices/ProductsServicesHead.vue';
	import ProductsServiceContacts from 'src/components/ProductsServices/ProductsServiceContacts.vue';
	import ProductsFilter from './components/ProductsFilter.vue';
	import ProductsServicesItem from 'src/components/ProductsServices/ProductsServicesItem.vue';
	import ProductsServicesAdvantages from 'src/components/ProductsServices/ProductsServicesAdvantages.vue';
	import ProductsServicesForm from 'src/components/ProductsServices/ProductsServicesForm.vue';
	import BannerSaInternational from 'src/components/BannerSaInternational/BannerSaInternational.vue';
	import { serviceData } from './data';
	import { useI18n } from 'vue-i18n';
	import { onMounted } from 'vue';
	import { useGetMeta } from 'src/hooks/useGetMeta';

	const { t } = useI18n();

	const ServiceData = serviceData;

	onMounted(() => {
		useGetMeta('service')
	})

</script>

<template>
	<products-services-head
		:title="t('productsHeadTitle')"
		:text="t('productsHeadDescription')"
		width-title="1000px"
		width-text="717px"
		images="images/SA.svg"
		:dense="false"
		minHeightText="162px"
	/>
	<products-filter />
	<products-services-item
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
	<products-services-advantages
		:title="t('advantagesProductsTitle')"
		:item-title-1="t('advantagesProductsItem1Title')"
		:item-title-2="t('advantagesProductsItem2Title')"
		:item-title-3="t('advantagesProductsItem3Title')"
		:item-title-4="t('advantagesProductsItem4Title')"
		:item-text-1="t('advantagesProductsItem1Text')"
		:item-text-2="t('advantagesProductsItem2Text')"
		:item-text-3="t('advantagesProductsItem3Text')"
		:item-text-4="t('advantagesProductsItem4Text')"
	/>
	<products-services-form />
	<banner-sa-international
		:title="t('serviceBannerTitle')"
		:description="t('serviceBannerText')"
		:is-black="true"
	/>
	<products-service-contacts />
</template>

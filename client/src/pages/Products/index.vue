<script lang="ts" setup>
	import ProductsServicesHead from 'src/components/ProductsServices/ProductsServicesHead.vue';
	import ProductsServiceContacts from 'src/components/ProductsServices/ProductsServiceContacts.vue';
	import ProductsFilter from './components/ProductsFilter.vue';
	import ProductsServicesItem from 'src/components/ProductsServices/ProductsServicesItem.vue';
	import ProductsServicesAdvantages from 'src/components/ProductsServices/ProductsServicesAdvantages.vue';
	import ProductsServicesForm from 'src/components/ProductsServices/ProductsServicesForm.vue';
	import BannerSaInternational from 'src/components/BannerSaInternational/BannerSaInternational.vue';
	import { useI18n } from 'vue-i18n';
	import { computed, onMounted, ref } from 'vue';
	import { useGetMeta } from 'src/hooks/useGetMeta';
	import { getApiClientInitialParams, PagesIblockPublicDto, PagesPublicControllerClient, RecordsPublicDto } from 'src/ApiClient/ApiClient';

	const { t, locale } = useI18n();

	const SLUG_PRODUCT = 'products'
	const SLUG_CONTACTS = 'products-contacts'

	const isLoading = ref(true);
	const rows = ref<RecordsPublicDto[]>([]);
	const iblock = ref<PagesIblockPublicDto | null>(null);

	const getContacts = computed(() => {
		const data = iblock.value;

		return data && data.records?.length ? data.records[0] : null;
	});

	const getIblock = () => {
		new PagesPublicControllerClient(getApiClientInitialParams()).getIblockForSlug(SLUG_CONTACTS)
			.then((res) => {
				iblock.value = res.entity
			})
	}

	const getInfo = () => {
		new PagesPublicControllerClient(getApiClientInitialParams()).getRecordsBlogs('', 1, 100, SLUG_PRODUCT)
			.then((res) => {
				rows.value = res.entity?.entity || [];
				isLoading.value = false;
			})
	}

	onMounted(() => {
		useGetMeta(SLUG_PRODUCT);
		getInfo();
		getIblock();
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
	<div v-if="isLoading" class="q-pa-md flex flex-center">
		<q-circular-progress
			indeterminate
			rounded
			color="primary"
			size="30px"
		/>
	</div>
	<template v-else>
		<products-filter :data="rows" />
		<products-services-item
			v-for="(item, index) in rows"
			:id="'product-' + item.id!.toString()"
			:key="index"
			:title="item.title[locale]"
			:text="item.description[locale]"
			:image="item.paramsField?.image[locale]?.path || ''"
			:description="item.paramsField?.description[locale]"
			:specifications="item.paramsField?.technical[locale]"
			:spheres="item.paramsField?.application[locale]"
			:advantages="item.paramsField?.advantages[locale]"
		/>
	</template>
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
	<products-service-contacts :data="getContacts"  />
</template>

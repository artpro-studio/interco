<script lang="ts" setup>
	import ProductsServicesHead from 'src/components/ProductsServices/ProductsServicesHead.vue';
	import ProductsServiceContacts from 'src/components/ProductsServices/ProductsServiceContacts.vue';
	import ProductsFilter from './components/ProductsFilter.vue';
	import ProductsServicesItem from 'src/components/ProductsServices/ProductsServicesItem.vue';
	import ProductsServicesAdvantages from 'src/components/ProductsServices/ProductsServicesAdvantages.vue';
	import ProductsServicesForm from 'src/components/ProductsServices/ProductsServicesForm.vue';
	import BannerSaInternational from 'src/components/BannerSaInternational/BannerSaInternational.vue';
	import Loader from 'src/components/Loader/Loader.vue';
	import { useI18n } from 'vue-i18n';
	import { computed, onMounted, ref } from 'vue';
	import { useGetMeta } from 'src/hooks/useGetMeta';
	import {
		getApiClientInitialParams,
		PagesIblockPublicDto,
		PagesPublicControllerClient,
		RecordsPublicDto,
	} from 'src/ApiClient/ApiClient';
	import { useRoute } from 'vue-router';

	const { t, locale } = useI18n();
	const route = useRoute();

	const SLUG_PRODUCT = 'products';
	const SLUG_CONTACTS = 'products-contacts';

	const isLoading = ref(true);
	const isLoader = ref(true);
	const rows = ref<RecordsPublicDto[]>([]);
	const iblock = ref<PagesIblockPublicDto | null>(null);

	const getContacts = computed(() => {
		const data = iblock.value;

		return data && data.records?.length ? data.records[0] : null;
	});

	const fetchData = async () => {
		const apiClient = new PagesPublicControllerClient(getApiClientInitialParams());

		try {
			const [iblockResponse, recordsResponse] = await Promise.all([
				apiClient.getIblockForSlug(SLUG_CONTACTS),
				apiClient.getRecordsBlogs('', 1, 100, SLUG_PRODUCT),
			]);
			iblock.value = iblockResponse.entity;
			rows.value = recordsResponse.entity?.entity || [];
		} catch (error) {
			console.error('Error fetching data:', error);
		} finally {
			isLoading.value = false;

			setTimeout(() => {
				isLoader.value = false;
				handleScroll();
			}, 700);
		}
	};

	const handleScroll = () => {
		if (route.hash) {
			const element = document.querySelector(route.hash);
			if (element) {
				const headerOffset = 110;
				const elementPosition = element.getBoundingClientRect().top + window.scrollY;
				const offsetPosition = elementPosition - headerOffset;
				window.scrollTo({ left: 0, top: offsetPosition, behavior: 'smooth' });
			}
		}
	};

	onMounted(() => {
		useGetMeta(SLUG_PRODUCT);
		fetchData();
	});
</script>

<template>
	<loader v-if="isLoader" />
	<products-services-head
		:title="t('productsHeadTitle')"
		:text="t('productsHeadDescription')"
		width-title="1000px"
		width-text="717px"
		images="images/SA.svg"
		:dense="false"
		minHeightText="162px"
	/>
	<template v-if="!isLoading">
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
	<banner-sa-international :title="t('serviceBannerTitle')" :description="t('serviceBannerText')" :is-black="true" />
	<products-service-contacts :data="getContacts" />
</template>

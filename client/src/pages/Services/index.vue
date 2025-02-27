<script lang="ts" setup>
	import ProductsServicesHead from 'src/components/ProductsServices/ProductsServicesHead.vue';
	import ProductsServiceContacts from 'src/components/ProductsServices/ProductsServiceContacts.vue';
	import ProductsServicesItem from 'src/components/ProductsServices/ProductsServicesItem.vue';
	import ProdictsServiceItemMin from 'src/components/ProductsServices/ProdictsServiceItemMin.vue';
	import ProductServiceSection from 'src/components/ProductsServices/ProductServiceSection.vue';
	import ProductsServicesAdvantages from 'src/components/ProductsServices/ProductsServicesAdvantages.vue';
	import ProductsServicesForm from 'src/components/ProductsServices/ProductsServicesForm.vue';
	import BannerSaInternational from 'src/components/BannerSaInternational/BannerSaInternational.vue';
	import ServiceFilter from './components/ServiceFilter.vue';
	import { useI18n } from 'vue-i18n';
	import { computed, onMounted, ref } from 'vue';
	import { useGetMeta } from 'src/hooks/useGetMeta';
	import { getApiClientInitialParams, PagesIblockPublicDto, PagesPublicControllerClient, PublicPagesSectionsDto, RecordsPublicDto } from 'src/ApiClient/ApiClient';

	const { t, locale } = useI18n();

	const SLUG_SERVICE = 'service'
	const SLUG_CONTACTS = 'service-contacts'

	const isLoading = ref(true);
	const rows = ref<RecordsPublicDto[]>([]);
	const iblock = ref<PagesIblockPublicDto | null>(null);
	const sections = ref<PublicPagesSectionsDto[]>([])

	const getContacts = computed(() => {
		const data = iblock.value;

		return data && data.records?.length ? data.records[0] : null;
	});

	const getSectionsData = (sectionID: number) => {
		return rows.value.filter((el) => {
			const ids: number[] = el.sections.map((item: any) => item.id);
			return ids.includes(sectionID);
		});
	}

	const getIblock = () => {
		new PagesPublicControllerClient(getApiClientInitialParams()).getIblockForSlug(SLUG_CONTACTS)
			.then((res) => {
				iblock.value = res.entity
			})
	}

	const getSection = () => {
		new PagesPublicControllerClient(getApiClientInitialParams()).getPagesSections(SLUG_SERVICE)
			.then((res) => {
				sections.value = res.entity || []
			})
	}

	const getInfo = () => {
		new PagesPublicControllerClient(getApiClientInitialParams()).getRecordsBlogs('', 1, 100, SLUG_SERVICE)
			.then((res) => {
				rows.value = res.entity?.entity || [];
				isLoading.value = false;
			})
	}

	onMounted(() => {
		useGetMeta(SLUG_SERVICE);
		getSection();
		getInfo();
		getIblock();
	})

</script>

<template>
	<products-services-head
		:title="t('servicesHeadTitle')"
		:text="t('servicesHeadDescription')"
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
		<service-filter :data="sections" />
		<div class="container pb-8">
			<div class="full">
				<div v-for="section in sections" :key="section.id!" :id="section.id!.toString()" style="width: 100%;">
					<product-service-section
						:title="section.title[locale]"
						:text="section.description[locale]"
					/>
					<div class="row q-gutter-lg">
						<template
							v-for="(item, index) in getSectionsData(section.id!)"
							:key="index"
						>
							<template v-if="item.paramsField?.image[locale]">
								<products-services-item
									:title="item.title[locale]"
									:text="item.description[locale]"
									:image="item.paramsField?.image[locale]?.path || ''"
									:description="item.paramsField?.description[locale]"
									:specifications="item.paramsField?.technical[locale]"
									:spheres="item.paramsField?.application[locale]"
									:advantages="item.paramsField?.advantages[locale]"
									:is-hidden-title="true"
								/>
							</template>
							<template v-else>
								<prodicts-service-item-min
									:title="item.title[locale]"
									:text="item.description[locale]"
									:description="item.paramsField?.description[locale]"
									:advantages="item.paramsField?.advantages[locale]"
								/>
							</template>
						</template>
					</div>

				</div>

			</div>
		</div>
	</template>
	<products-services-advantages
		:is-service="true"
		:title="t('advantagesServicesTitle')"
		:item-title-1="t('advantagesServicesItem1Title')"
		:item-title-2="t('advantagesServicesItem2Title')"
		:item-title-3="t('advantagesServicesItem3Title')"
		:item-title-4="t('advantagesServicesItem4Title')"
		:item-text-1="t('advantagesServicesItem1Text')"
		:item-text-2="t('advantagesServicesItem2Text')"
		:item-text-3="t('advantagesServicesItem3Text')"
		:item-text-4="t('advantagesServicesItem4Text')"
	/>
	<products-services-form />
	<banner-sa-international
		:title="t('serviceBannerTitle')"
		:description="t('serviceBannerText')"
		:is-black="true"
	/>
	<products-service-contacts :data="getContacts" />
</template>

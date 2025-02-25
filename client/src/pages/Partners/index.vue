<script lang="ts" setup>
	import HeadGlobal from 'src/components/HeadGlobal/HeadGlobal.vue';
	import PartnersAdvantages from './components/PartnersAdvantages.vue';
	import PartnersPrinciples from './components/PartnersPrinciples.vue';
	import PartnersHowBecome from './components/PartnersHowBecome.vue';
	import PartnersCooperation from './components/PartnersCooperation.vue';
	import PartnersStep from './components/PartnersStep.vue';
	import PartnersContacts from './components/PartnersContacts.vue';
	import PartnersProgram from './components/PartnersProgram.vue';
	import PartnersInfo from './components/PartnersInfo.vue';
	import PartnersForm from './components/PartnersForm.vue';
	import ClientsContacts from 'src/components/ClientsContacts/ClientsContacts.vue';
	import BannerSaInternational from 'src/components/BannerSaInternational/BannerSaInternational.vue';
	import { useI18n } from 'vue-i18n';
	import { computed, onMounted, ref } from 'vue';
	import { useGetMeta } from 'src/hooks/useGetMeta';
	import { getApiClientInitialParams, PagesPublicControllerClient, PagesPublicDto } from 'src/ApiClient/ApiClient';

	const { t, locale } = useI18n();

	const SLUG_CONTACTS = 'partners-contact';

	const pagePublic = ref<PagesPublicDto | null>(null);

	const getContacts = computed(() => {
		const data: any = pagePublic.value?.iblocks?.find((el) => el.slug === SLUG_CONTACTS)?.records
		return data;
	})

	const getInfo = () => {
		new PagesPublicControllerClient(getApiClientInitialParams()).getOneForSlug('partners')
		.then((data) => {
			pagePublic.value = data.entity;
		})
	}

	onMounted(() => {
		useGetMeta('partners');
		getInfo();
	})
</script>
<template>
	<head-global
		width-title="957px"
		width-text="653px"
		:title="t('partnersHeadTitle')"
		:text="t('partnersHeadDescription')"
		images="images/bg-partners.svg"
		:dense="false"
		:top="0"
	/>
	<partners-advantages />
	<partners-principles />
	<partners-how-become />
	<partners-cooperation />
	<partners-step />
	<partners-contacts :data="getContacts" />
	<partners-program />
	<partners-info />
	<partners-form />
	<clients-contacts>
		<template
			v-slot:default
		>
			<div
				v-for="(item, index) in getContacts"
				:key="index"
				class="clients-contacts__item"
			>
				<h6 class="clients-contacts__item__title text-gradient text-uppercase fonts-oswald">{{ item.fields.title[locale].value }}</h6>
				<div v-if="item.fields.phone[locale].value" class="clients-contacts__item__link">
					<a :href="'tel:' + item.fields.phone[locale].value">{{ item.fields.phone[locale].value }}</a>
				</div>
				<div v-if="item.fields.email[locale].value" class="clients-contacts__item__link">
					<a :href="'mailto:' + item.fields.email[locale].value">{{ item.fields.email[locale].value }}</a>
				</div>
				<div v-if="item.fields.address[locale].value" class="clients-contacts__item__link">
					<p>{{ item.fields.address[locale].value }}</p>
				</div>
				<div v-if="item.fields.user[locale].value" class="clients-contacts__item__link">
					<p>{{ item.fields.user[locale].value }}</p>
				</div>
			</div>
		</template>
	</clients-contacts>
	<banner-sa-international :title="t('partnersBannerTitle')" :description="t('partnersBannerDescription')" />
</template>

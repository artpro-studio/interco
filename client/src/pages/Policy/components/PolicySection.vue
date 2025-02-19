<script lang="ts" setup>
	import SectionTitle from 'src/components/SectionTitle/SectionTitle.vue';
	import PolicySectionText from './PolicySectionText.vue';
	import { useI18n } from 'vue-i18n';
	import { ref } from 'vue';

	interface IProps {
		data: any;
	}
	defineProps<IProps>();

	const { t, locale } = useI18n();
	const listData = ref([
		'policySectionListItem1',
		'policySectionListItem2',
		'policySectionListItem3',
		'policySectionListItem4',
		'policySectionListItem5',
		'policySectionListItem6',
		'policySectionListItem7',
	]);
</script>

<template>
	<div class="policy-section pb-8">
		<div class="container">
			<section-title class="policy-section__title" :title="data?.title[locale]?.value" />
			<policy-section-text :button-text="t('policySectionTextLink')" :href="data?.file[locale]?.value?.path">
				<template v-slot:text>
					<p v-html="data?.description1[locale]?.value"></p>
					<p v-html="data?.description2[locale]?.value"></p>
				</template>
				<template v-slot:list>
					<h5>{{ t('policySectionListTitle') }}</h5>
					<ul>
						<li v-for="(item, index) in data?.list[locale]?.value" :key="index">{{ t(item) }}</li>
					</ul>
				</template>
			</policy-section-text>
		</div>
	</div>
</template>

<style lang="scss">
	.policy-section {
		padding-top: 40px;

		&__title {
			margin-bottom: 64px;
		}

		@media (max-width: $breakpoint-sm-min) {
			&__title {
				margin-bottom: 32px !important;
			}
		}
	}
</style>

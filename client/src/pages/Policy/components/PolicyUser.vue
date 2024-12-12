<script lang="ts" setup>
	import SectionTitle from 'src/components/SectionTitle/SectionTitle.vue';
	import PolicySectionText from './PolicySectionText.vue';
	import { useI18n } from 'vue-i18n';
	import { ref } from 'vue';

	const { t } = useI18n();

	const listData = ref([
		'policyUserListItem1',
		'policyUserListItem2',
		'policyUserListItem3',
		'policyUserListItem4',
		'policyUserListItem5',
		'policyUserListItem6',
		'policyUserListItem7',
		'policyUserListItem8',
	])
</script>

<template>
	<div class="policy-section pb-8">
		<div class="container">
			<section-title class="policy-section__title" :title="t('policyUserTitle')" />
			<policy-section-text :button-text="t('policyUserLinkText')">
				<template v-slot:text>
					<p v-html="t('policyUserText1')"></p>
					<p v-html="t('policyUserText2')"></p>
				</template>
				<template v-slot:list>
					<h5>{{ t('policyUserListTitle') }}</h5>
					<ul>
						<li v-for="(item, index) in listData" :key="index">{{ t(item) }}</li>
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

<script lang="ts" setup>
	import SectionTitle from 'src/components/SectionTitle/SectionTitle.vue';
	import { useI18n } from 'vue-i18n';

	interface IProps {
		data?: any;
	}
	defineProps<IProps>();

	const { t, locale } = useI18n();
</script>

<template>
	<div class="about-group pt-8 pb-8 bg-white">
		<div class="container">
			<div class="about-group__header">
				<section-title :title="t('aboutGroupTitle')" color-text="black" />
			</div>
			<div class="about-group__body row no-wrap">
				<div data-aos="fade-right" class="about-group__content">
					<h5 class="fonts-oswald text-red text-uppercase">{{ data?.fields?.subtitle[locale]?.value }}</h5>
					<p v-html="data?.fields?.description[locale]?.value"></p>
				</div>
				<div data-aos="fade-left" class="about-group__info">
					<p class="fonts-oswald" v-html="data?.fields?.text[locale]?.value"></p>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.about-group {
		&__body {
			@media (max-width: 768px) {
				flex-wrap: wrap;
			}
		}
		&__content {
			width: 50%;
			min-width: 50%;
			padding-right: 20px;

			h5 {
				font-weight: 500;
				margin-bottom: 24px;
				font-size: 1.55em;
			}

			@media (max-width: 768px) {
				width: 100%;
				min-width: auto;
			}

			@media (max-width: $breakpoint-sm-min) {
				h5 {
					margin-bottom: 16px;
				}
			}
		}
		&__info {
			padding-top: 55px;
			p {
				color: var(--dark-blue);
				font-size: 1.35em;
				text-transform: uppercase;
				font-weight: 400;
			}

			@media (max-width: $breakpoint-sm-min) {
				padding-top: 0;
				margin-top: 16px;
			}
		}
	}
</style>

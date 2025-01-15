<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>

<template>
	<div class="clients-section-text pt-8 pb-12">
		<div data-aos="fade-right" class="container">
			<div class="clients-section-text__title headline-1 text-gradient fonts-oswald text-uppercase">{{ t('contactsBannerTitle') }}</div>
			<h6 class="clients-section-text__subtitle fonts-oswald text-uppercase">{{ t('contactsBannerSubTitle') }}</h6>
			<p class="clients-section-text__text fonts-oswald">{{ t('contactsBannerDescription') }}</p>
		</div>
		<div data-aos="fade-left" class="clients-section-text__arrows row no-wrap">
			<q-img class="clients-section-text__arrows__item" src="icons/arrow-red.svg" />
			<q-img class="clients-section-text__arrows__item" src="icons/arrow-red.svg" />
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.clients-section-text {
		position: relative;
		overflow: hidden;
		background-color: var(--dark-blue);

		&__title {
			margin-bottom: 24px;
			position: relative;
		}

		&__subtitle {
			font-size: 1.55em;
			margin-bottom: 40px;
			color: var(--white);
		}
		&__text {
			font-size: 1.22em;
			max-width: 487px;
			color: var(--white);
			line-height: 140%;
			position: relative;
			font-weight: normal;

			@media (max-width: $breakpoint-sm-min) {
				font-size: 1em;
			}
		}

		&__arrows {
			position: absolute;
			top: -2px;
			right: 0;

			&__item {
				width: 300px;
				opacity: .15;

				&:first-child {
					position: relative;
					right: -70px;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				right: -140px;

				&__item {
					width: 200px;

					&:first-child {
						position: relative;
						right: -40px;
					}
				}
			}
		}
	}
</style>

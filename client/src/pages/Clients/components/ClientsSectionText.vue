<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>

<template>
	<div class="clients-section-text pt-8 pb-12">
		<div class="container">
			<h5 data-aos="fade-up" class="clients-section-text__title headline-1 text-gradient fonts-oswald text-uppercase text-center">
				{{ t('clientsBannerTitle') }}
			</h5>
			<p data-aos="fade-up" class="clients-section-text__text fonts-oswald text-uppercase text-center">
				{{ t('clientsBannerText') }}
			</p>
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

		.container {
			position: relative;
			z-index: 2;
		}

		&__title {
			margin-bottom: 40px;
			position: relative;
			z-index: 2;
		}
		&__text {
			font-size: 1.22em;
			max-width: 840px;
			margin: 0 auto;
			color: var(--white);
			line-height: 140%;
			position: relative;
			z-index: 2;

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
				opacity: 0.15;

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

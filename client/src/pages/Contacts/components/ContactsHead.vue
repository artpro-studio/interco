<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>

<template>
	<div class="home-global pb-8">
		<div class="container">
			<div class="home-global__body">
				<h3 data-aos="fade-right" class="home-global__title">{{ t('contactsHeadTitle') }}</h3>
				<div data-aos="fade-up" class="home-global__text">
					<p>{{ t('contactsHeadDescription') }}</p>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.home-global {
		padding-top: 220px;

		&__body {
			position: relative;
		}

		&__title {
			font-size: 4.55em;
			font-family: 'Oswald', sans-serif;
			margin-bottom: 40px;
			line-height: 130%;
			position: relative;
			font-weight: 500;
			text-transform: uppercase;
			z-index: 2;

			@media (max-width: $breakpoint-sm-min) {
				font-size: 2.5em;
				margin-bottom: 24px;
			}
		}

		&__text {
			position: relative;
			z-index: 2;
			max-width: 653px;
			min-height: 98px;
			p {
				font-size: 1.2em;
				color: var(--dark-blue);
			}

			@media (max-width: $breakpoint-sm-min) {
				p {
					font-size: 1em;
				}
			}
		}
	}
</style>

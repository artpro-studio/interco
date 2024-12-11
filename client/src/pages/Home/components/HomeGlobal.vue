<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>
<template>
	<div class="home-global pt-12 pb-12">
		<div class="container">
			<h4 class="home-global__title headline-1 text-gradient text-uppercase">{{ t('globalTitle') }}</h4>
			<div class="home-global__body row no-wrap items-center">
				<div class="home-global__text">
					<p class="fonts-oswald">{{ t('globalText') }}.</p>
				</div>
				<div class="home-global__info">
					<p v-html="t('globalInfo')"></p>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.home-global {
		&__title {
			margin-bottom: 64px;
		}

		&__text {
			padding-right: 40px;
			border-right: 1px var(--yellow) solid;
			margin-right: 40px;
			p {
				color: var(--white);
				font-size: 2.45em;
				line-height: 135%;
			}
		}

		&__info {
			min-width: 280px;
			width: 280px;
			color: var(--gray);
			font-size: 1.35em;

			strong {
				color: var(--white);
			}
		}

		@media (max-width: $breakpoint-md-min) {
			&__text {
				p {
					font-size: 2em;
				}
			}
		}
		@media (max-width: 800px) {
			&__body {
				flex-wrap: wrap;
			}

			&__text {
				border: none;
				padding-right: 0;
				padding-bottom: 24px;
				border-bottom: 1px var(--yellow) solid;
				margin-bottom: 24px;
				margin-right: 0;
			}

			&__info {
				min-width: none;
				width: 100%;
			}
		}

		@media (max-width: $breakpoint-sm-min) {
			&__title {
				margin-bottom: 40px;
			}

			&__text {
				p {
					font-size: 1.4em;
				}
			}

			&__info {
				font-size: 1.13em;
			}
		}
	}
</style>

<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>

<template>
	<div class="policy-warning pt-8 pb-12">
		<div class="container">
			<div data-aos="fade-right" class="policy-warning__header row items-center no-wrap">
				<h4 class="policy-warning__header__title headline-1 text-uppercase text-red">{{ t('policyWarningTitle') }}</h4>
				<div class="policy-warning__header__arrows row items-center no-wrap">
					<q-img src="icons/arrow-red.svg" class="policy-warning__header__arrows__item" width="35px" />
					<q-img src="icons/arrow-red.svg" class="policy-warning__header__arrows__item" width="35px" />
				</div>
			</div>
			<div class="policy-warning__body row no-wrap items-center">
				<div data-aos="fade-right" class="policy-warning__text">
					<p class="fonts-oswald">{{ t('policyWarningDescription') }}</p>
				</div>
				<div data-aos="fade-left" class="policy-warning__info">
					<p>{{ t('policyWarningInfo') }}</p>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.policy-warning {
		background-color: #fff;

		&__header {
			margin-bottom: 64px;

			&__title {
				margin-right: 40px;

				@media (max-width: $breakpoint-md-min) {
					margin-right: 16px;
				}
			}

			&__arrows {
				&__item {
					margin-right: 10px;
					&:last-child {
						margin-right: 0;
					}

					@media (max-width: $breakpoint-md-min) {
						width: 25px !important;
					}

					@media (max-width: $breakpoint-sm-min) {
						width: 20px !important;
					}
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 24px;
			}
		}

		&__text {
			padding-right: 24px;
			border-right: 1px var(--yellow) solid;
			margin-right: 24px;
			font-family: 'Oswald', sans-serif;
			p {
				color: var(--dark-blue);
				font-size: 1.8em;
				line-height: 135%;
			}
		}

		&__info {
			min-width: 427px;
			width: 280px;
			color: var(--dark-blue);
			font-size: 1.222em;
			font-family: 'Oswald', sans-serif;

			strong {
				color: var(--white);
			}
		}


		@media (max-width: $breakpoint-md-min) {
			&__text {
				p {
					font-size: 1.5em;
				}
			}

			&__info {
				font-size: 1em;
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
	}
</style>

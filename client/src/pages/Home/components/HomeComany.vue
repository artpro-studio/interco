<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>
<template>
	<div class="home-company pt-8 pb-12">
		<div class="container">
			<div class="home-company__top row no-wrap items-center">
				<h4
					data-aos="fade-right"
					class="home-company__top__title headline-3 text-white"
				>{{ t('companyTop') }}</h4>
				<div data-aos="fade-left" class="line"></div>
			</div>
			<h2
				data-aos="fade-up"
				class="home-company__title text-gradient fonts-oswald"
				>
				{{ t('companyTitle') }}
			</h2>
			<div class="home-company__body row no-wrap">
				<div data-aos="fade-right" class="home-company__body__item">
					<p>{{ t('companyText1') }}</p>
				</div>
				<div data-aos="fade-left"  class="home-company__body__item">
					<p>{{ t('companyText2') }}</p>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.home-company {
		@media (max-width: $breakpoint-sm-min) {
			padding-top: 30px;
		}
		&__top {
			margin-bottom: 40px;
			.line {
				background-color: var(--white);
				height: 1px;
				opacity: .5;
				width: 100%;
			}
			&__title {
				white-space: nowrap;
				margin-right: 40px;
				text-transform: uppercase;

				@media (max-width: $breakpoint-sm-min) {
					margin-right: 12px;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 24px;
			}
		}

		&__title {
			font-size: 5em;
			text-transform: uppercase;
			font-weight: 500;
			line-height: 1.3;
			letter-spacing: 0.03em;

			@media (max-width: $breakpoint-md-min) {
				font-size: 3.5em
			}

			@media (max-width: $breakpoint-sm-min) {
				font-size: 2.5em
			}
		}

		&__body {
			margin-top: 65px;

			@media (max-width: $breakpoint-sm-min) {
				margin-top: 56px;
			}

			@media (max-width: 800px) {
				flex-wrap: wrap;
			}

			&__item {
				border-left: 2px rgba(255, 255, 255, .5) solid;
				padding: 5px 0;
				padding-left: 40px;

				&:last-child {
					margin-bottom: 0;
				}

				@media (max-width: 800px) {
					border-top: 2px rgba(255, 255, 255, .5) solid;
					border-left: none;
					padding-left: 0;
					padding-top: 16px;
					margin-bottom: 40px;
				}

				p {
					color: var(--gray);
					letter-spacing: 0.03em;
					line-height: 156%;
				}
			}
		}
	}
</style>

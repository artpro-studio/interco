<script lang="ts" setup>
	import Lang from 'src/components/lang/lang.vue';
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>
<template>
	<div class="head">
		<div class="container">
			<lang />
			<div class="head__top row">
				<div class="head__top__item">
					<p class="head__top__item__title fonts-oswald">{{ t('production') }}</p>
					<div class="line1"></div>
				</div>
				<div class="head__top__item">
					<p class="head__top__item__title fonts-oswald">{{ t('construction') }}</p>
					<div class="line2"></div>
				</div>
				<div class="head__top__item">
					<p class="head__top__item__title fonts-oswald">{{ t('technologies') }}</p>
				</div>
			</div>
			<div class="head__body row items-end no-wrap">
				<h1 class="head__body__title fonts-oswald fonts-humane ">SA<br>International</h1>
				<q-img class="head__body__text" src="images/text-SA-International.svg" title="SAInternational " fit="contain" />
				<q-img class="head__body__img" src="icons/arrow-head.svg" fit="contain" alt="Стрелки" />
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.head {
		background-image: url('/images/head.png');
		background-position: right;
		background-size: cover;
		width: 100%;
		padding-top: 200px;
		padding-bottom: 119px;
		position: relative;
		overflow: hidden;

		&::before {
			content: '';
			width: 100%;
			height: 100%;
			background-image: url('/images/head-line.svg');
			background-repeat: no-repeat;
			background-size: contain;
			position: absolute;
			top: 0;
			left: 8%;
		}
		&::after {
			content: '';
			width: 100%;
			height: 100%;
			border-radius: 50%;
			background: linear-gradient(180deg, #021729 0%, #06213A 100%);
			position: absolute;
			opacity: .1;
			filter: blur(40px);
			top: 0;
			left: 0;
			z-index: 2;
		}

		@media (max-width: 1500px) {
			&::before {
				left: 0;
			}
		}

		@media (max-width: $breakpoint-sm-min) {
			padding-top: 112px;
			padding-bottom: 70px;

			&::before {
				display: none;
			}
		}

		.line1, .line2 {
			height: 1px;
			background-color: var(--white);
			opacity: .5;
			margin: 0 23px;

			@media (max-width: 996px) {
				width: 24px !important;
			}

			@media (max-width: $breakpoint-sm-min) {
				margin: 0 6px;
			}
		}

		.line1 {
			width: 281px;

			@media (max-width: 1120px) {
				width: 92px;
			}
		}

		.line2 {
			width: 92px;
		}

		&__top {
			margin-top: 23px;
			position: relative;
			z-index: 3;

			@media (max-width: $breakpoint-sm-min) {
				margin-top: 235px;
			}
			&__item {
				display: flex;
				align-items: center;
				&__title {
					font-size: 2em;
					font-weight: 300;
					color: var(--white);
					text-transform: uppercase;

					@media (max-width: 996px) {
						font-size: 1.5em;
					}

					@media (max-width: $breakpoint-sm-min) {
						font-size: .95em;
					}
				}
			}
		}

		&__body {
			margin-top: 87px;
			position: relative;

			@media (max-width: $breakpoint-sm-min) {
				margin-top: 34px;
			}

			&__title {
				font-size: 21em;
				line-height: .85;
				letter-spacing: 10px;
				color: var(--white);
				font-weight: bold;
				text-transform: uppercase;
				display: none;
			}

			&__text {
				min-width: calc(100% - 6.7% - 28px);

				@media (max-width: $breakpoint-sm-min) {
					min-width: calc(100% - 6.7% - 16px);
				}
			}

			&__img {
				margin-left: 28px;
				min-width: calc(6.7% - 28px);
				position: relative;

				@media (max-width: $breakpoint-sm-min) {
					margin-left: 16px;
					min-width: calc(6.7% - 16px);
				}
			}
		}
	}
</style>

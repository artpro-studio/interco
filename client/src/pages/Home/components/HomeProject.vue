<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>

<template>
	<div class="home-project pt-12 pb-12">
		<div class="container">
			<div class="home-project__header row no-wrap items-center">
				<h4 class="home-project__header__title headline-1 text-uppercase text-gradient">{{ t('projectTitle') }}</h4>
				<div class="home-project__header__right row items-center no-wrap">
					<div class="line"></div>
					<q-btn color="black" class="home-project__header__btn text-bold" flat>
						<div class="row no-wrap">
							<div class="text-no-wrap">{{ t('moreDetailed') }}</div>
							<q-img src="icons/arrow-yellow.svg" class="q-ml-md" width="16px" :alt="t('moreDetailed')" />
						</div>
					</q-btn>
				</div>
			</div>
			<div class="home-project__body row no-wrap">
				<q-img src="images/home-project.png" class="home-project__img" height="278px" width="422px" />
				<div class="home-project__content">
					<div class="home-project__content__item">
						<h4 class="home-project__content__item__title">{{ t('projectItem1Title') }}</h4>
						<p>{{ t('projectItem1Text') }}</p>
					</div>
					<div class="home-project__content__item">
						<h4 class="home-project__content__item__title">{{ t('projectItem2Title') }}</h4>
						<p>{{ t('projectItem2Text') }}</p>
					</div>
				</div>
			</div>
			<div class="home-project__contacts pt-8">
				<div class="home-project__contacts__top row no-wrap items-center">
					<q-img src="icons/arrow-red.svg" width="26px" fit="contain" class="home-project__contacts__top__img" />
					<h3 class="home-project__contacts__top__title headline-1 text-dark">{{ t('projectContactTitle') }}</h3>
				</div>
				<div class="home-project__contacts__body row no-wrap items-center">
					<div class="home-project__contacts__text">
						<p class="fonts-oswald text-dark">{{ t('projectContactText') }}</p>
					</div>
					<div class="home-project__contacts__info">
						<p class="text-dark">{{ t('projectContactInfo') }}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.home-project {
		background-color: var(--white);

		.text-no-wrap {
			white-space: nowrap;
		}

		&__header {
			margin-bottom: 40px;

			&__title {
				white-space: nowrap;
				line-height: 156%;
			}

			&__right {
				width: 100%;
			}

			.line {
				background-color: rgba(105, 109, 125, 0.5);
				height: 1px;
				width: 100%;
				margin: 0 40px;
			}

			@media (max-width: $breakpoint-sm-min) {
				flex-wrap: wrap;

				&__title {
					margin-bottom: 10px;
					white-space: wrap;
				}

				.line {
					margin: 0;
				}
			}
		}

		&__img {
			min-width: 422px;
			margin-right: 48px;

			@media (max-width: 800px) {
				margin-right: 0;
				width: 100%;
				min-width: 100%;
			}
			@media (max-width: $breakpoint-sm-min) {
				height: 216px !important;
			}
		}

		&__body {
			padding-bottom: 80px;
			@media (max-width: 800px) {
				flex-wrap: wrap;
				padding-bottom: 40px;
			}
		}

		&__content {
			padding-top: 107px;

			&__item {
				padding-bottom: 32px;
				margin-bottom: 20px;
				border-bottom: 1px rgba(105, 109, 125, .5) solid;
				&__title {
					text-transform: uppercase;
					font-weight: bold;
					margin-bottom: 16px;
					font-size: 1.33em;
					color: var(--dark-blue);
				}
				p {
					color: var(--dark-blue);
				}

				&:last-child {
					padding-bottom: 0;
					border: none;
				}
			}

			@media (max-width: 800px) {
				padding-top: 40px;
			}

			@media (max-width: $breakpoint-sm-min) {
				&__item {
					padding-bottom: 16px;
					margin-bottom: 16px;
					&__title {
						font-size: 1.3em;
						margin-bottom: 10px;
					}
				}
			}
		}

		&__contacts {
			&__top {
				padding-left: 18px;
				margin-bottom: 40px;

				&__img {
					margin-right: 52px;
				}

				&__title {
					text-transform: uppercase;
				}

				@media (max-width: $breakpoint-sm-min) {
					padding-left: 0px;
					margin-bottom: 32px;
					&__img {
						margin-right: 18px;
						width: 40px !important;
					}

				}
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
				min-width: 310px;
				width: 310px;
				color: #333333;
				font-size: 1.35em;
				line-height: 135%;

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

				&__text {
					p {
						font-size: 1.5em;
					}
				}

				&__info {
					font-size: 1em;
				}
			}
		}
	}
</style>

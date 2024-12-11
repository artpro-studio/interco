<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>
<template>
	<div class="home-direction-info pb-12">
		<div class="container">
			<div class="home-direction-info__header row no-wrap items-center">
				<h4 class="home-direction-info__header__title headline-3 text-uppercase text-red">{{ t('directionSubTitle2') }}</h4>
				<div class="line"></div>
				<q-btn color="black" class="home-direction-info__header__btn text-bold" flat>
					<div class="row no-wrap">
						<div class="text-no-wrap">{{ t('moreDetailed') }}</div>
						<q-img src="icons/arrow-yellow.svg" class="q-ml-md" width="16px" :alt="t('moreDetailed')" />
					</div>
				</q-btn>
			</div>
			<div class="home-direction-info__icons row no-wrap justify-between">
				<div class="home-direction-info__icons__item row no-wrap items-center justify-between">
					<div class="home-drection-info__icons__item__images">
						<q-img src="images/icon-car.png" class="home-direction-info__icons__item__img" width="89px" />
					</div>
					<p class="home-direction-info__icons__item__text text-uppercase text-black fonts-oswald">{{ t('directionIconText1') }}</p>
				</div>
				<div class="home-direction-info__icons__item row no-wrap items-center">
					<div class="home-direction-info__icons__item__images">
						<q-img src="images/icon-product.png" class="home-direction-info__icons__item__img" width="64px" />
					</div>
					<p class="home-direction-info__icons__item__text text-uppercase text-black fonts-oswald">{{ t('directionIconText2') }}</p>
				</div>
				<div class="home-direction-info__icons__item row no-wrap items-center">
					<div class="home-direction-info__icons__item__images">
						<q-img src="images/icon-prodcut2.png" class="home-direction-info__icons__item__img" width="64px" />
					</div>
					<p class="home-direction-info__icons__item__text text-uppercase text-black fonts-oswald">{{ t('directionIconText3') }}</p>
				</div>
			</div>
			<div class="home-direction-info__lists row no-wrap justify-between items-start">
				<div class="home-direction-info__lists__item">
					<h5 class="home-direction-info__lists__item__title headline-3 text-uppercase text-red">{{ t('directionSubTitle3') }}</h5>
					<div class="home-direction-info__lists__item__content row no-wrap items-center">
						<q-img src="icons/arrow-black.svg" class="home-direction-info__lists__item__img" width="16px" />
						<p>{{ t('directionText1') }}</p>
					</div>
				</div>
				<div class="home-direction-info__lists__item">
					<h5 class="home-direction-info__lists__item__title headline-3 text-uppercase text-red">{{ t('directionSubTitle4') }}</h5>
					<div class="home-direction-info__lists__item__content row no-wrap items-center">
						<q-img src="icons/arrow-black.svg" class="home-direction-info__lists__item__img" width="16px" />
						<p>{{ t('directionText2') }}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.home-direction-info {
		background-color: var(--white);
		padding-top: 120px;

		.text-no-wrap {
			white-space: nowrap;
		}

		@media (max-width: $breakpoint-sm-min) {
			padding-top: 80px;
		}

		&__header {
			margin-bottom: 40px;

			&__title {
				white-space: nowrap;
			}

			.line {
				background-color: rgba(105, 109, 125, 0.5);
				height: 1px;
				width: 100%;
				margin: 0 40px;
			}

			@media (max-width: $breakpoint-sm-min) {
				.line {
					display: none;
				}

				&__btn {
					display: none;
				}
			}
		}

		&__icons {
			margin-bottom: 120px;
			&__item {
				&__img {
					margin-right: 32px;
				}
				&__text {
					font-size: 1.55em;
					max-width: 180px;
				}
			}
			@media (max-width: $breakpoint-md-min) {
				flex-wrap: wrap;
			}

			@media (max-width: 900px) {
				justify-content: flex-start;

				&__item {
					margin-bottom: 30px;

					&:last-child {
						margin-bottom: 0;
					}

					&__text {
						font-size: 1.5em;
					}

					&__img {
						margin-right: 20px;
					}
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				justify-content: center;
				margin-bottom: 40px;
				&__item {
					&__images {
						width: 120px;
						display: flex;
						justify-content: flex-start;
						align-items: center;
					}
					&__img {
						width: 64px;
					}
					&__text {
						font-size: 1.55em;
					}
				}
			}
		}

		&__lists {
			padding: 0 63px;

			&__item {
				margin-right: 24px;

				&:last-child {
					margin-right: 0;
				}

				&__img {
					min-width: 27px;
					height: 40px;
					margin-right: 35px;
					margin-left: 18px;
				}

				&__title {
					line-height: 1.5;
					margin-bottom: 64px;
					height: 108px;
				}

				p {
					line-height: 156%;
					max-width: 468px;
				}
			}

			@media (max-width: $breakpoint-md-min) {
				padding: 0;

				&__item {
					&__title {
						height: 76px;
					}
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				flex-wrap: wrap;

				&__item {
					margin-bottom: 40px;

					&:last-child {
						margin-bottom: 0;
					}

					&__title {
						margin-bottom: 16px;
						height: auto;
					}

					&__img {
						width: 16px;
						min-width: 16px;
						height: auto;
						margin-left: 12px;
						margin-right: 20px;
					}
				}
			}
		}
	}
</style>

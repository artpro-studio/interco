<script lang="ts" setup>
	import { RouterName } from 'src/router/routerName';
	import { computed } from 'vue';
	import { useI18n } from 'vue-i18n';
	import { useRouter } from 'vue-router';

	const { t } = useI18n();
	const router = useRouter();

	const path = computed(() => {
		const thisRoute = router.resolve({ name: RouterName.Services });

		return thisRoute.fullPath;
	});
</script>
<template>
	<div class="home-direction-info pb-12">
		<div class="container">
			<div data-aos="zoom-in" class="home-direction-info__header row no-wrap items-center">
				<h4 class="home-direction-info__header__title headline-3 text-uppercase text-red">{{ t('directionSubTitle2') }}</h4>
				<div class="line"></div>
				<q-btn :to="path" color="black" class="home-direction-info__header__btn text-bold" flat>
					<div class="row no-wrap items-center">
						<span class="text-no-wrap">{{ t('moreDetailed') }}</span>
						<svg
							class="q-ml-md"
							width="20"
							height="26"
							color="var(--yellow)"
							viewBox="0 0 20 29"
							fill="none"
							xmlns="http://www.w3.org/2000/svg"
						>
							<path
								d="M14.0571 2.0063L13.7697 1.5L13.1875 1.5L4 1.5L2.28238 1.5L3.13037 2.9937L9.66258 14.5L3.13037 26.0063L2.28238 27.5L4 27.5L13.1875 27.5L13.7697 27.5L14.0571 26.9937L20.8696 14.9937L21.1499 14.5L20.8696 14.0063L14.0571 2.0063Z"
								stroke="#D4AF37"
								stroke-width="2"
							/>
						</svg>
					</div>
				</q-btn>
			</div>
			<div data-aos="fade-up" class="home-direction-info__icons row no-wrap justify-between">
				<div class="home-direction-info__icons__item row no-wrap items-center justify-between">
					<div class="home-drection-info__icons__item__images">
						<q-img src="images/icon-car.png" loading="lazy" class="home-direction-info__icons__item__img" width="89px" />
					</div>
					<p class="home-direction-info__icons__item__text text-uppercase text-black fonts-oswald">
						{{ t('directionIconText1') }}
					</p>
				</div>
				<div class="home-direction-info__icons__item row no-wrap items-center">
					<div class="home-direction-info__icons__item__images">
						<q-img src="images/icon-product.png" loading="lazy" class="home-direction-info__icons__item__img" width="64px" />
					</div>
					<p class="home-direction-info__icons__item__text text-uppercase text-black fonts-oswald">
						{{ t('directionIconText2') }}
					</p>
				</div>
				<div class="home-direction-info__icons__item row no-wrap items-center">
					<div class="home-direction-info__icons__item__images">
						<q-img src="images/icon-prodcut2.png" loading="lazy" class="home-direction-info__icons__item__img" width="64px" />
					</div>
					<p class="home-direction-info__icons__item__text text-uppercase text-black fonts-oswald">
						{{ t('directionIconText3') }}
					</p>
				</div>
			</div>
			<div class="home-direction-info__lists row no-wrap justify-between items-start">
				<div data-aos="fade-right" class="home-direction-info__lists__item">
					<h5 class="home-direction-info__lists__item__title headline-3 text-uppercase text-red">
						{{ t('directionSubTitle3') }}
					</h5>
					<div class="home-direction-info__lists__item__content row no-wrap items-center">
						<q-img src="icons/arrow-black.svg" loading="lazy" class="home-direction-info__lists__item__img" width="16px" />
						<p>{{ t('directionText1') }}</p>
					</div>
				</div>
				<div data-aos="fade-left" class="home-direction-info__lists__item">
					<h5 class="home-direction-info__lists__item__title headline-3 text-uppercase text-red">
						{{ t('directionSubTitle4') }}
					</h5>
					<div class="home-direction-info__lists__item__content row no-wrap items-center">
						<q-img src="icons/arrow-black.svg" loading="lazy" class="home-direction-info__lists__item__img" width="16px" />
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
				justify-content: space-between;

				&__item {
					margin-bottom: 20px;
					padding-right: 10px;

					&__images {
						width: 90px;
					}

					&__text {
						font-size: 1.5em;
						max-width: none;
					}

					&__img {
						margin-right: 20px;
					}
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				justify-content: left;
				margin-bottom: 40px;
				&__item {
					margin-bottom: 30px;
					&__images {
						width: 110px;
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

<script lang="ts" setup>
	import { RouterName } from 'src/router/routerName';
	import { computed } from 'vue';
	import { useI18n } from 'vue-i18n';
	import { useRouter } from 'vue-router';

	const { t } = useI18n();
	const router = useRouter();

	const path = computed(() => {
		const thisRoute = router.resolve({name: RouterName.News});

		return thisRoute.fullPath;
	})
</script>

<template>
	<div class="home-project pt-12 pb-12">
		<div class="container">
			<div data-aos="zoom-in" class="home-project__header row no-wrap items-center">
				<h4 class="home-project__header__title headline-1 text-uppercase text-gradient">{{ t('projectTitle') }}</h4>
				<div class="home-project__header__right row items-center no-wrap">
					<div class="line"></div>
					<q-btn :to="path" color="black" class="home-project__header__btn text-bold" flat>
						<div class="row no-wrap items-center">
							<span class="text-no-wrap">{{ t('moreDetailed') }}</span>
							<svg class="q-ml-md" width="20" height="26" color="var(--yellow)" viewBox="0 0 20 29" fill="none" xmlns="http://www.w3.org/2000/svg">
								<path d="M14.0571 2.0063L13.7697 1.5L13.1875 1.5L4 1.5L2.28238 1.5L3.13037 2.9937L9.66258 14.5L3.13037 26.0063L2.28238 27.5L4 27.5L13.1875 27.5L13.7697 27.5L14.0571 26.9937L20.8696 14.9937L21.1499 14.5L20.8696 14.0063L14.0571 2.0063Z" stroke="#D4AF37" stroke-width="2"/>
							</svg>
						</div>
					</q-btn>
				</div>
			</div>
			<div class="home-project__body row no-wrap">
				<q-img data-aos="fade-right" src="images/home-project.png" loading="lazy" class="home-project__img" height="278px" width="422px" />
				<div data-aos="fade-left" class="home-project__content">
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
				<div data-aos="fade-right" class="home-project__contacts__top row no-wrap items-center">
					<q-img src="icons/arrow-red.svg" loading="lazy" width="26px" fit="contain" class="home-project__contacts__top__img" />
					<h3 class="home-project__contacts__top__title headline-1 text-dark">{{ t('projectContactTitle') }}</h3>
				</div>
				<div class="home-project__contacts__body row no-wrap items-center">
					<div data-aos="fade-right" class="home-project__contacts__text">
						<p class="fonts-oswald text-dark">{{ t('projectContactText') }}</p>
					</div>
					<div  data-aos="fade-left" class="home-project__contacts__info">
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

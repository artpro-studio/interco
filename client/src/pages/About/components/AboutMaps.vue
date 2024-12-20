<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>

<template>
	<div class="about-maps pt-8 pb-12">
		<div class="container">
			<div class="about-maps__top row no-wrap items-center">
				<q-img src="icons/arrow-red.svg" width="26px" fit="contain" class="about-maps__top__img" />
				<h3 class="about-maps__top__title headline-1 text-white">{{ t('aboutMapTitle') }}</h3>
			</div>
			<div class="about-maps__body">
				<q-img src="images/maps.png" class="about-maps__img" />
			</div>
			<div class="about-maps__columns row no-wrap">
				<div class="about-maps__column">
					<h4 class="about-maps__column__title headline-2 text-gradient">{{ t('aboutMapSubTitle1') }}</h4>
					<div class="about-maps__list">
						<div class="about-maps__list__item">
							<h5 class="about-maps__list__item__title fonts-oswald">{{ t('aboutMapList1Title') }}</h5>
							<p class="about-maps__list__item__text">{{ t('aboutMapList1Text') }}</p>
						</div>
						<div class="about-maps__list__item">
							<h5 class="about-maps__list__item__title fonts-oswald">{{ t('aboutMapList2Title') }}</h5>
							<p class="about-maps__list__item__text">{{ t('aboutMapList2Text') }}</p>
						</div>
					</div>
				</div>
				<div class="about-maps__column">
					<h4 class="about-maps__column__title headline-2 text-gradient">{{ t('aboutMapSubTitle2') }}</h4>
					<div class="about-maps__list">
						<div class="about-maps__list__item">
							<h5 class="about-maps__list__item__title fonts-oswald">{{ t('aboutMapList3Title') }}</h5>
							<p class="about-maps__list__item__text">{{ t('aboutMapList3Text') }}</p>
						</div>
						<div class="about-maps__list__item">
							<h5 class="about-maps__list__item__title fonts-oswald">{{ t('aboutMapList4Title') }}</h5>
							<p class="about-maps__list__item__text">{{ t('aboutMapList4Text') }}</p>
						</div>
					</div>
				</div>
			</div>
			<div class="about-maps__info">
				<p>{{ t('aboutMapText') }}</p>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.about-maps {
		&__info {
			text-align: center;
			margin-top: 64px;
			p {
				color: #888891;
				max-width: 840px;
				margin: 0 auto;
				font-size: 1.22em;
				font-weight: bold;
			}
			@media (max-width: $breakpoint-sm-min) {
				margin-top: 0px;

				p {
					font-size: 1.13em;
				}
			}
		}
		&__top {
			padding-left: 18px;
			margin-bottom: 64px;

			&__img {
				margin-right: 52px;
			}

			&__title {
				text-transform: uppercase;
			}

			@media (max-width: $breakpoint-sm-min) {
				padding-left: 0px;
				margin-bottom: 40px;
				&__img {
					margin-right: 18px;
					width: 40px !important;
				}

			}
		}

		&__columns {
			@media (max-width: $breakpoint-sm-min) {
				flex-wrap: wrap;
			}
		}

		&__column {
			width: 50%;
			padding-right: 20px;

			&__title {
				margin-bottom: 32px;
			}

			@media (max-width: 1110px) {
				&__title {
					height: 90px;
				}
			}

			@media (max-width: $breakpoint-md-min) {
				&__title {
					height: auto;
				}
			}

			@media (max-width: 819px) {
				&__title {
					height: 70px;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				width: 100%;
				padding-right: 0;
				margin-bottom: 24px;

				&__title {
					height: auto;
					margin-bottom: 24px;
				}
			}
		}

		&__body {
			margin-bottom: 24px;
		}
		&__img {
			width: 100%;
		}

		&__list {
			color: var(--white);

			&__item {
				margin-bottom: 24px;
				&__title {
					font-size: 1.55em;
					font-weight: 500;
					margin-bottom: 16px;
				}

				&__text {
					font-size: 1.22em;
					color: var(--gray);
				}
			}

			@media (max-width: 900px) {
				&__item {

					&__title {
						font-size: 1.5em;
					}

					&__text {
						font-size: 1.13em;
					}

				}
			}

			@media (max-width: $breakpoint-sm-min) {
				flex-wrap: wrap;

				&__item {
					width: 100%;
					&__title {
						margin-bottom: 8px;
					}
				}
			}
		}
	}
</style>

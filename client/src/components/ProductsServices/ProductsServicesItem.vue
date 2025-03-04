<script lang="ts" setup>
	import VBtn from 'src/components/UI/VBtn/VBtn.vue';
	import ModalApplication from 'src/components/Modal/ModalApplication.vue';
	import { ref } from 'vue';
	import { useI18n } from 'vue-i18n';

	interface IProps {
		id?: string;
		title: string;
		text: string;
		image: string;
		description: string;
		specifications: string;
		spheres: string;
		advantages: any;
		isHiddenTitle?: boolean;
	}
	defineProps<IProps>();

	const { t } = useI18n();

	const isOpenDialog = ref(false);
</script>

<template>
	<div class="service-product full pb-8" :id="id ? id : ''">
		<div data-aos="fade-up" class="container" v-if="!isHiddenTitle">
			<div class="service-product__header row no-wrap items-center justify-between">
				<div class="service-product__header__title row no-wrap items-center">
					<q-img src="icons/arrow-red.svg" width="40px" class="service-product__header__title__arrow" />
					<h4 class="service-product__header__title__text headline-2 text-uppercase">{{ title }}</h4>
				</div>
				<div class="service-product__header__text">
					<p v-html="text"></p>
				</div>
			</div>
		</div>
		<div data-aos="fade-up" class="service-product__body">
			<div class="service-product__item">
				<div class="container">
					<div class="service-product__item__body row no-wrap items-start">
						<div class="service-product__item__content">
							<div class="service-product__item__row row no-wrap">
								<div class="service-product__item__info">
									<h4>{{ t('productServiceItemDescription') }}</h4>
									<p>{{ description }}</p>
								</div>
								<div class="service-product__item__info">
									<h4>{{ t('productServiceItemSpecifications') }}</h4>
									<p>{{ specifications }}</p>
								</div>
							</div>
							<div class="service-product__item__info">
								<h4>{{ t('productServiceItemSpheres') }}</h4>
								<p>{{ spheres }}</p>
							</div>
							<div class="service-product__item__info">
								<h4>{{ t('productServiceItemAdvantages') }}</h4>
								<div v-html="advantages"></div>
							</div>
							<div class="service-product__item__buttons row no-wrap items-center justify-between">
								<p>{{ t('productServiceItemTextLong') }}</p>
								<v-btn color="primary" class="service-product__item__buttons__btn" @on-click="isOpenDialog = true">
									<span>{{ t('productServiceItemBtn') }}</span>
									<q-img src="icons/arrow-red.svg" width="16px" class="q-ml-md" />
								</v-btn>
							</div>
							<div class="service-product__item__bg-mobile" :style="{ backgroundImage: `url(${image})` }"></div>
						</div>
						<div class="service-product__item__bg">
							<q-img :src="image" fit="contain" style="width: 100%" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<q-dialog v-model="isOpenDialog">
		<modal-application @on-close="isOpenDialog = false" />
	</q-dialog>
</template>

<style lang="scss">
	.service-product {
		&__header {
			&__text {
				p {
					color: #888891;
					font-size: 1em;
					font-family: 'Oswald', sans-serif;
				}
			}
		}
		&__item {
			&__info {
				p {
					color: #888891;
				}

				ul {
					list-style-type: none;
					margin: 0;
					padding: 0;
					margin-top: 24px;
					li {
						color: #888891;
						position: relative;
						margin-bottom: 16px;
						padding-left: 33px;

						&:last-child {
							margin-bottom: 0;
						}

						&::before {
							content: '';
							width: 25px;
							height: 25px;
							background-image: url('/icons/arrow-yellow.svg');
							background-repeat: no-repeat;
							background-position: center;
							background-size: contain;
							position: absolute;
							top: 50%;
							left: 0;
							margin-top: -12.5px;
						}
					}
				}
			}
		}
	}
</style>
<style lang="scss" scoped>
	.service-product {
		width: 100%;

		&__header {
			margin-bottom: 64px;
			&__title {
				&__arrow {
					margin-right: 40px;
				}

				&__text {
					line-height: 140%;
				}
			}
			&__text {
				max-width: 520px;
				text-align: right;

				p {
					color: #888891;
					font-size: 1em;
					font-family: 'Oswald', sans-serif;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				flex-wrap: wrap;
				margin-bottom: 24px;

				&__title {
					&__arrow {
						width: 30px !important;
						margin-right: 16px;
					}
				}

				&__text {
					text-align: left;
					margin-top: 16px;
				}
			}
		}

		&__item {
			position: relative;
			&__content {
				max-width: 760px;
				min-width: 760px;
				border-radius: 10px;
				background-color: #fff;
				padding: 40px;
				position: relative;
				z-index: 2;

				@media (max-width: $breakpoint-md-min) {
					max-width: none;
					min-width: 100%;
					width: 100%;
					padding-bottom: 0;
				}

				@media (max-width: $breakpoint-sm-min) {
					padding: 20px;
				}
			}

			&__row {
				.service-product__item__info {
					width: 50%;
					margin-right: 24px;

					&:last-child {
						margin-right: 0;
					}
				}
				@media (max-width: $breakpoint-sm-min) {
					flex-wrap: wrap;

					.service-product__item__info {
						width: 100%;
						margin-right: 0;
					}
				}
			}

			&__info {
				margin-bottom: 32px;
				h4 {
					font-size: 1.22em;
					font-weight: bold;
					margin-bottom: 24px;
				}

				@media (max-width: $breakpoint-sm-min) {
					margin-bottom: 16px;
					h4 {
						margin-bottom: 8px;
						line-height: 140%;
					}
				}
			}

			&__buttons {
				padding-top: 8px;

				p {
					font-weight: bold;
					font-size: 1.22em;
					max-width: 330px;
				}

				&__btn {
					min-width: 300px;
				}

				@media (max-width: $breakpoint-sm-min) {
					flex-wrap: wrap;

					&__btn {
						margin-top: 16px;
					}
				}
			}

			&__bg {
				margin-left: 20px;
				width: 100%;
				@media (max-width: $breakpoint-md-min) {
					display: none;
				}
			}

			&__bg-mobile {
				display: none;
				width: 100%;
				height: 300px;
				background-repeat: no-repeat;
				background-position: bottom center;
				background-size: contain;
				margin-top: 16px;

				@media (max-width: $breakpoint-md-min) {
					display: block;
				}
			}
		}
	}
</style>


<script lang="ts" setup>
	import { ref } from 'vue';
	import { useI18n } from 'vue-i18n';
	import VBtnRed from 'src/components/UI/VBtnRed/VBtnRed.vue';

	const { t } = useI18n();

	const sliderRef = ref<any>();
	const slide = ref('slide1');

	const sliderData = ref(
		[
			{
				title: t('directionSlide1Title'),
				list: [t('directionSlide1Text1'), t('directionSlide1Text2'), t('directionSlide1Text3')],
				images: 'images/direction-sllide1.png',
			},
			{
				title: t('directionSlide2Title'),
				list: [t('directionSlide2Text1'), t('directionSlide2Text2'), t('directionSlide2Text3')],
				images: 'images/direction-sllide2.png',
			},
			{
				title: t('directionSlide3Title'),
				list: [t('directionSlide3Text1'), t('directionSlide3Text2'), t('directionSlide3Text3')],
				images: 'images/direction-sllide3.png',
			},
			{
				title: t('directionSlide4Title'),
				list: [t('directionSlide4Text1'), t('directionSlide4Text2'), t('directionSlide4Text3')],
				images: 'images/direction-sllide4.png',
			},
			{
				title: t('directionSlide5Title'),
				list: [t('directionSlide5Text1'), t('directionSlide5Text2')],
				images: 'images/direction-sllide5.png',
			},
		]
	)

	const onPrev = () => {
		sliderRef.value?.previous();
	}

	const onNext = () => {
		sliderRef.value?.next();
	}
</script>
<template>
	<div class="home-direction pt-8">
		<div class="container">
			<div data-aos="fade-right" class="home-direction__top row no-wrap items-center">
				<q-img src="icons/arrow-red.svg" width="26px" fit="contain" class="home-direction__top__img" />
				<h3 class="home-direction__top__title headline-1 text-white">{{ t('directionTitle') }}</h3>
			</div>
			<h4 data-aos="fade-up" class="headline-3 text-white text-uppercase">{{ t('directionSubTitle') }}</h4>
		</div>
		<div class="home-direction__slider">
			<div class="container">
				<div class="home-direction__slider__wrap">
					<div class="home-direction__slider__arrows row no-wrap">
						<div class="home-direction__slider__arrow prev" @click="onPrev">
							<q-img src="icons/arrow-white-outline.svg" width="26px" />
						</div>
						<div class="home-direction__slider__arrow next" @click="onNext">
							<q-img src="icons/arrow-white-outline.svg" width="26px" />
						</div>
					</div>
					<q-carousel
						ref="sliderRef"
						v-model="slide"
						class="home-direction__q-slider"
						transition-prev="slide-right"
						transition-next="slide-left"
						animated
						swipeable
						infinite
						control-color="primary"
					>
						<q-carousel-slide
							v-for="(item, index) in sliderData"
							:key="index"
							:name="'slide' + index"
							class="column no-wrap q-pa-none"
						>
							<div class="home-direction__slide row no-wrap">
								<div class="home-direction__slide__info">
									<h5 class="home-direction__slide__info__title headline-4 text-white text-uppercase">{{ item.title }}</h5>
									<ul>
										<li v-for="(el, indx) in item.list" :key="indx">{{ el }}</li>
									</ul>

									<v-btn-red color="white" class="home-direction__slide__btn text-bold" :text="t('moreDetailed')" flat></v-btn-red>
								</div>
								<div class="home-direction__slide__images">
									<q-img :src="item.images" width="516px" height="516px" fit="cover" class="home-direction__slide__img" />
								</div>
							</div>
      					</q-carousel-slide>
	  				</q-carousel>

				</div>
			</div>

		</div>
	</div>
</template>
<style lang="scss" scoped>
	.home-direction {
		@media (max-width: 850px) {
			padding-bottom: 40px;
		}
		@media (max-width: $breakpoint-sm-min) {
			padding-top: 40px;
		}
		&__top {
			padding-left: 18px;
			margin-bottom: 80px;

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
		&__slider {
			margin-top: 40px;
			position: relative;

			@media (max-width: $breakpoint-sm-min) {
				padding-top: 32px;
			}

			&::before {
				content: '';
				height: 100%;
				width: 50%;
				background-color: var(--red);
				position: absolute;
				top: 0;
				left: 0;
			}

			&::after {
				content: '';
				height: 100%;
				width: 50%;
				background-color: var(--dark-blue);
				background-image: url('/images/bg.png');
				position: absolute;
				top: 0;
				right: 0;
			}

			&__wrap {
				position: relative;
				z-index: 2;
				@media (max-width: 850px) {
					z-index: 3;
				}
			}
			&__arrows {
				position: absolute;
				top: 52px;
				left: 0;
				z-index: 2;

				@media (max-width: $breakpoint-sm-min) {
					top: 0;
				}
			}

			&__arrow {
				cursor: pointer;
				padding: 12px 18px;
				transition: .4s all;

				&.next {
					transform: rotate(180deg);
					margin-left: 24px;

					&:hover {
						transform: scale(1.2) rotate(180deg);
					}
				}

				&:hover {
					transform: scale(1.2);
				}
			}

			@media (max-width: 850px) {
				&::before {
					width: 100%;
					height: 100%;
					top: 0;
					z-index: 1;
				}
				&::after {
					width: 100%;
					top: auto;
					bottom: 0;
					height: 450px;
					z-index: 2;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				&::after {
					height: 375px;
				}
			}
		}

		&__slide {

			&__info {
				width: 100%;
				padding-top: 168px;
				background-color: var(--red);

				&__title {
					margin-bottom: 40px;

					@media (max-width: $breakpoint-sm-min) {
						margin-bottom: 24px;
					}
				}

				ul {
					list-style-type: none;
					margin: 0;
					padding: 0;

					li {
						font-size: 1.35em;
						color: var(--white);
						margin-bottom: 16px;
						position: relative;
						padding-left: 32px;
						line-height: 1;

						&::before {
							content: '';
							width: 16px;
							height: 16px;
							border: 3px var(--white) solid;
							border-radius: 50%;
							position: absolute;
							top: 5px;
							left: 0;
						}

						@media (max-width: $breakpoint-sm-min) {
							font-size: 1.25em;
							margin-bottom: 8px;

							&::before {
								top: 2px;
							}
						}
					}
				}

				@media (max-width: 850px) {
					padding-bottom: 36px;
				}

				@media (max-width: $breakpoint-sm-min) {
					padding-top: 90px;
					padding-bottom: 56px;
				}
			}

			&__img {
				min-width: 516px;

				@media (max-width: $breakpoint-md-min) {
					min-width: 450px;
					height: 450px !important;
				}

				@media (max-width: $breakpoint-sm-min) {
					min-width: 375px;
					height: 375px !important;
				}
			}

			&__btn {
				margin-top: 32px;
				max-width: 140px;
				@media (max-width: $breakpoint-sm-min) {
					margin-top: 24px;
				}
			}

			@media (max-width: 850px) {
				flex-wrap: wrap;

				&__images {
					position: relative;
					margin-left: -16px;
					min-width: calc(100% + 32px) !important;
				}

				&__img {
					min-width: 100% !important;
					width: 100% !important;
				}
			}

		}
		&__q-slider {
			height: auto !important;
			background-color: var(--red);
			overflow: initial !important;
		}
	}
</style>
<style lang="scss">
	.home-direction__q-slider {
		.q-panel {
			overflow: initial !important;
		}
	}
</style>

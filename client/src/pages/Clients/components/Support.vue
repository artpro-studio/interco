<script lang="ts" setup>
	import { Swiper, SwiperSlide } from 'swiper/vue';
	import 'swiper/css';
	import SectionTitle from 'src/components/SectionTitle/SectionTitle.vue';
	import { ref } from 'vue';
	import { useI18n } from 'vue-i18n';

	const {t} = useI18n();

	const swiperRef = ref();
	const breakpoints: any = {
		'901': {
			slidesPerView: 2
		},
		'300': {
            slidesPerView: 'auto',
			spaceBetween: 20
        },
	}

	const setEqualHeight = () => {
		const slides = document.querySelectorAll('.swiper-slide');
		let maxHeight = 0;
		 // Сброс высоты
		 slides.forEach((slide: any) => {
          slide.style.height = 'auto';
        });

        // Нахождение максимальной высоты
        slides.forEach((slide: any) => {
          maxHeight = Math.max(maxHeight, slide.offsetHeight);
        });

        // Установка одинаковой высоты
        slides.forEach((slide: any) => {
          slide.style.height = maxHeight + 'px';
        });
	}
</script>

<template>
	<div class="support pt-8">
		<div class="container">
			<section-title :title="t('clientsSupportTitle')" />
			<p data-aos="fade-up" class="support__description headline-2">{{ t('clientsSupportDescription') }}</p>

			<div data-aos="fade-up" class="support__body">
				<swiper
					ref="swiperRef"
					class="swiper-container"
					:slidesPerView="3"
					:space-between="40"
					:centeredSlides="false"
					:breakpoints="breakpoints"
					@init="setEqualHeight"
      				@resize="setEqualHeight"
				>
					<swiper-slide>
						<div class="support__section">
							<h5 class="support__section__title text-gradient">{{ t('clientsSupportGarantiaTitle') }}</h5>
							<div class="support__section__body">
								<div class="support__section__body__item">
									<h6>{{ t('clientsSupportGarantiaItem1Title') }}</h6>
									<p>{{ t('clientsSupportGarantiaItem1Text') }}</p>
								</div>
								<div class="support__section__body__item">
									<h6>{{ t('clientsSupportGarantiaItem2Title') }}</h6>
									<p>{{ t('clientsSupportGarantiaItem2Text') }}</p>
								</div>
								<div class="support__section__body__item">
									<h6>{{ t('clientsSupportGarantiaItem3Title') }}</h6>
									<ul class="support__section__body__item__normal">
										<li>{{ t('clientsSupportGarantiaItem3List1') }}</li>
										<li>{{ t('clientsSupportGarantiaItem3List2') }}</li>
										<li>{{ t('clientsSupportGarantiaItem3List3') }}</li>
									</ul>
								</div>
							</div>
						</div>
					</swiper-slide>
					<swiper-slide>
						<div class="support__section">
							<h5 class="support__section__title text-gradient">{{ t('clientsSupportTechTitle') }}</h5>
							<div class="support__section__body">
								<div class="support__section__body__item">
									<h6>{{ t('clientsSupportTechItem1Title') }}</h6>
									<p>{{ t('clientsSupportTechItem1Text') }}</p>
								</div>
								<div class="support__section__body__item">
									<h6>{{ t('clientsSupportTechItem2Title') }}</h6>
									<ul class="support__section__body__item__list__number">
										<li>
											<p class="support__section__body__item__list__number__title">{{ t('clientsSupportTechItem2List1Title') }}</p>
											<p class="support__section__body__item__list__number__text">{{ t('clientsSupportTechItem2List1Text') }}</p>
										</li>
										<li>
											<p class="support__section__body__item__list__number__title">{{ t('clientsSupportTechItem2List2Title') }}</p>
											<p class="support__section__body__item__list__number__text">{{ t('clientsSupportTechItem2List2Text') }}</p>
										</li>
										<li>
											<p class="support__section__body__item__list__number__title">{{ t('clientsSupportTechItem2List3Title') }}</p>
											<p class="support__section__body__item__list__number__text">{{ t('clientsSupportTechItem2List3Text') }}</p>
										</li>
										<li>
											<p class="support__section__body__item__list__number__title">{{ t('clientsSupportTechItem2List4Title') }}</p>
											<p class="support__section__body__item__list__number__text">{{ t('clientsSupportTechItem2List4Text') }}</p>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</swiper-slide>
				</swiper>
			</div>
		</div>
	</div>
</template>
<style lang="scss">
	.support {
		color: var(--white);
		margin-bottom: 40px;
		&__description {
			max-width: 1200px;
			line-height: 135%;
			margin-bottom: 64px;
		}

		.swiper-slide {
			border-radius: 10px;
			background-color: rgba(35, 36, 57, 0.6);

			@media (max-width: 900px) {
				width: 85%;
			}
		}

		&__section {
			position: relative;
			height: 100%;
			padding: 40px;

			@media (max-width: $breakpoint-sm-min) {
				padding: 24px 16px;
			}

			&::before {
				content: '';
				width: 324px;
				height: 316px;
				background-image: url('/icons/arrow-big-blue.svg');
				background-repeat: no-repeat;
				background-size: contain;
				background-position: right;
				position: absolute;
				top: 0;
				right: 0;
			}

			&__title {
				font-size: 1.55em;
				font-weight: bold;
				position: relative;

				@media (max-width: $breakpoint-sm-min) {
					font-size: 1.3em;
				}
			}

			&__body {
				margin-top: 8px;
				position: relative;

				&__item {
					margin-top: 32px;

					h6 {
						font-size: 1.222em;
						font-weight: bold;
						margin-bottom: 24px;
					}

					&__normal {
						margin: 0;
						padding: 0;
						list-style-type: none;
						li {
							margin: 0;
							padding: 0;
							font-size: 1em;
							line-height: 140%;
							margin-bottom: 24px;
							position: relative;
							padding-left: 48px;

							&::before {
								content: '';
								background-image: url('/icons/arrow-yellow.svg');
								width: 30px;
								height: 30px;
								background-size: contain;
								background-position: center;
								background-repeat: no-repeat;
								position: absolute;
								top: 50%;
								margin-top: -16px;
								left: 0;
							}

							&:last-child {
								margin-bottom: 0;
							}
						}
					}

					&__list__number {
						margin: 0;
						padding: 0;
						list-style-type: none;

						&__title {
							font-size: 1.12em;
							font-weight: bold;
							margin-bottom: 8px;
							position: relative;
							padding-left: 32px;

							&::before {
								content: '';
								width: 18px;
								height: 19px;
								background-image: url('/icons/check-white.svg');
								background-repeat: no-repeat;
								background-position: center;
								background-size: contain;
								position: absolute;
								top: 50%;
								left: 0;
								margin-top: -10px;
							}
						}

						li {
							margin: 0;
							padding: 0;
							margin-bottom: 16px;

							&:last-child {
								margin-bottom: 0;
							}
						}
					}

					@media (max-width: $breakpoint-sm-min) {
						margin-top: 16px;

						h6 {
							margin-bottom: 8px;
						}

					}
				}
			}
		}
	}
</style>

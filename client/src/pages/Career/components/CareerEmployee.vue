<script lang="ts" setup>
	import { Swiper, SwiperSlide } from 'swiper/vue';
	import 'swiper/css';
	import { useI18n } from 'vue-i18n';

	interface IProps {
		data: any
	}
	defineProps<IProps>();

	const { t, locale } = useI18n();

	const breakpoints: any = {
		'901': {
			slidesPerView: 3
		},
		'300': {
            slidesPerView: 'auto',
			spaceBetween: 20
        },
	}
</script>

<template>
	<div class="career-employee pt-8 pb-8 bg-white">
		<div class="container">
			<div class="career-employee__header row no-wrap justify-between items-center">
				<div data-aos="fade-right" class="career-employee__header__body row items-center no-wrap">
					<q-img src="icons/arrow-red.svg" class="career-employee__header__arrow" width="40px" />
					<h4 class="career-employee__header__title headline-1 text-uppercase">{{ t('careerEmployeeTitle') }}</h4>
				</div>
				<div data-aos="fade-left" class="career-employee__header__info">
					<p>{{ t('careerEmployeeText') }}</p>
				</div>
			</div>
			<div data-aos="fade-up" class="career-employee__body">
				<swiper
					class="swiper-container"
					:slidesPerView="3"
					:space-between="40"
					:centeredSlides="false"
					:auto-height="true"
					:breakpoints="breakpoints"
				>
					<swiper-slide v-for="(item, index) in data" :key="index">
						<div class="career-employee__item">
							<q-img
								:src="item.fields?.image[locale]?.value?.path"
								height="510px"
								fit="cover"
								class="career-employee__item__img"
							/>
							<h5 class="career-employee__item__title text-red fonts-oswald text-uppercase">{{ item.fields?.fio[locale]?.value }}</h5>
							<p class="career-employee__item__info">{{ item.fields?.post[locale]?.value }}</p>
							<div class="career-employee__item__text">
								<p>{{ item.fields?.description[locale]?.value }}</p>
							</div>
						</div>
					</swiper-slide>
				</swiper>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.career-employee {
		&__header {
			margin-bottom: 64px;

			&__arrow {
				margin-right: 58px;
			}

			&__info {
				padding-left: 40px;
				border-left: 2px var(--yellow) solid;
				width: 500px;
				p {
					letter-spacing: 3%;
					font-size: 1em;
					font-weight: 700;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 32px;
				flex-wrap: wrap;

				&__arrow {
					margin-right: 20px;
					width: 40px;
				}

				&__body {
					margin-bottom: 32px;
				}

				&__info {
					padding-left: 0;
					border-left: none;
					border-top: 2px var(--yellow) solid;
					padding-top: 8px;

					p {
						font-size: 1.15em;
						font-weight: 40;
					}
				}
			}
		}

		&__body {
			@media (max-width: 900px) {
				width: calc(100% + 16px);
			}
		}

		&__item {
			&__img {
				margin-bottom: 40px;
			}

			&__title {
				letter-spacing: 2%;
				font-size: 1.55em;
				font-weight: 500;
				margin-bottom: 8px;
			}

			&__info {
				font-weight: 700;
				font-size: 1.222em;
			}

			&__text {
				margin-top: 32px;
				p {
					letter-spacing: 2%;
					font-size: 0.9em;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				&__title {
					font-size: 1.76em;
				}
				&__info {
					font-size: 1.12em;
				}

				&__text {
					margin-top: 32px;

					p {
						font-size: 1em;
					}
				}
			}
		}

		@media (max-width: 900px) {
			.swiper-slide {
				max-width: 50%;
			}
		}

		@media (max-width: $breakpoint-sm-min) {
			.swiper-slide {
				max-width: 80%;
			}
		}
	}
</style>

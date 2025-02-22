<script lang="ts" setup>
	import { Swiper, SwiperSlide } from 'swiper/vue';
	import 'swiper/css';
	import { computed, inject, nextTick, onMounted, ref, watch } from 'vue';
	import { getApiClientInitialParams, PagesPublicControllerClient, RecordsPublicDto } from 'src/ApiClient/ApiClient';
	import { useI18n } from 'vue-i18n';
	import { getMonthWithYear } from 'src/helpers/formaterDate';

	interface IProps {
		header: any
	}
	defineProps<IProps>();

	const { locale } = useI18n();

	const widthScreen = inject<any>('widthScreen', 0);
	const widthSlider = ref(0);
	const isLoading = ref(true);
	const news = ref<RecordsPublicDto[]>([]);

	watch(() => locale.value, () => {
		isLoading.value = true;
		nextTick(() => {
			isLoading.value = false;
		})
	})

	const breakpoints: any = {
		'901': {
			spaceBetween: 40
		},
		'300': {
			spaceBetween: 20
        },
	}

	watch(widthScreen, () => {
		getSilderWidth();
	})

	const getStyleWidth = computed(() => {
		return `calc(100% + ${widthSlider.value}px)`;
	})

	const getSilderWidth = () => {
		if (widthScreen._value > 1312) {
			widthSlider.value = (widthScreen._value - 1312) / 2 + 14;
		}
	}

	const getInfo = () => {
		new PagesPublicControllerClient(getApiClientInitialParams()).getRecordsBlogs('', 1, 20, 'news')
			.then((res) => {
				news.value = res.entity?.entity || [];
				isLoading.value = false;
				getSilderWidth();
			})
	}

	onMounted(() => {
		getInfo();
	})
</script>

<template>
	<div class="news-list pt-12 pb-8">
		<div v-if="isLoading" class="q-pa-md flex flex-center">
			<q-circular-progress
				indeterminate
				rounded
				color="orange"
				 size="30px"
			/>
		</div>
		<div v-else class="container">
			<div data-aos="fade-right" class="news-list__header row no-wrap justify-between items-center">
				<div class="news-list__header__body row items-center no-wrap">
					<q-img src="icons/arrow-red.svg" class="news-list__header__arrow" width="40px" />
					<h4 class="news-list__header__title headline-1 text-uppercase">{{ header?.fields?.title[locale]?.value }}</h4>
				</div>
				<div class="news-list__header__info">
					<p>{{ header?.fields?.description[locale]?.value }}</p>
				</div>
			</div>
			<div data-aos="fade-up" class="news-list__body" :style="{width: getStyleWidth}">
				<swiper
					class="swiper-container"
					:slidesPerView="'auto'"
					:space-between="40"
					:centeredSlides="false"
					:auto-height="true"
					:breakpoints="breakpoints"
				>
					<swiper-slide
						v-for="(item, index) in news"
						:key="index"
					>
						<div class="news-list__item">
							<q-img :src="item.paramsField?.image[locale]?.path || ''" height="400px" fit="cover" class="news-list__item__img" />
							<p class="news-list__item__date">{{ getMonthWithYear(item.createdAt!) }}</p>
							<h5 class="news-list__item__title text-red fonts-oswald text-uppercase">{{ item.title[locale] }}</h5>
							<div class="news-list__item__text">
								<p>{{ item.description[locale] }}</p>
							</div>
						</div>
					</swiper-slide>
				</swiper>
			</div>
		</div>
	</div>
</template>
<style lang="scss">
	.news-list {
		.swiper-slide {
			max-width: 400px;
			width: 400px;

			@media (max-width: $breakpoint-sm-min) {
				max-width: 310px;
				width: 310px;
			}
		}
	}
</style>
<style lang="scss" scoped>
	.news-list {
		background-color: #F5F5F5;
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
			@media (max-width: 1312px) {
				width: calc(100% + 16px) !important;
			}
		}

		&__item {
			&__date {
				font-size: 0.95em;
				font-weight: bold;
				margin-bottom: 16px;
			}
			&__img {
				margin-bottom: 40px;
				background-color: var(--white);
			}

			&__title {
				letter-spacing: 2%;
				font-size: 1.35em;
				font-weight: 500;
				margin-bottom: 8px;
				line-height: 156%;
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
				&__img {
					margin-bottom: 20px;
				}
				&__date {
					font-size: 1em;
					margin-bottom: 8px;
				}
				&__title {
					font-size: 1.36em;
					margin-bottom: 0px;
				}
				&__info {
					font-size: 1.12em;
				}

				&__text {
					margin-top: 16px;

					p {
						font-size: 1em;
					}
				}
			}
		}
	}
</style>

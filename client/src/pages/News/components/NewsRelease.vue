<script lang="ts" setup>
	import { Swiper, SwiperSlide } from 'swiper/vue';
	import 'swiper/css';
	import { useI18n } from 'vue-i18n';
	import { getMonthWithYear } from 'src/helpers/formaterDate';
	import { nextTick, onMounted, ref, watch } from 'vue';
	import { getApiClientInitialParams, PagesPublicControllerClient, RecordsPublicDto } from 'src/ApiClient/ApiClient';

	interface IProps {
		header: any
	}
	defineProps<IProps>();

	const { locale } = useI18n();

	const isLoading = ref(true);
	const rows = ref<RecordsPublicDto[]>([]);

	watch(() => locale.value, () => {
		isLoading.value = true;
		nextTick(() => {
			isLoading.value = false;
		})
	})

	const breakpoints: any = {
		'901': {
			slidesPerView: 3
		},
		'300': {
            slidesPerView: 'auto',
			spaceBetween: 20
        },
	}

	const getInfo = () => {
		new PagesPublicControllerClient(getApiClientInitialParams()).getRecordsBlogs('', 1, 20, 'press-release')
			.then((res) => {
				rows.value = res.entity?.entity || [];
				isLoading.value = false;
			})
	}

	onMounted(() => {
		getInfo();
	})
</script>

<template>
	<div class="news-release pt-8 pb-8">
		<div v-if="isLoading" class="q-pa-md flex flex-center">
			<q-circular-progress
				indeterminate
				rounded
				color="orange"
				 size="30px"
			/>
		</div>
		<div v-else class="container">
			<div class="news-release__header row no-wrap justify-between items-center">
				<div data-aos="fade-right" class="news-release__header__body row items-center no-wrap">
					<q-img src="icons/arrow-red.svg" class="news-release__header__arrow" width="40px" />
					<h4 class="news-release__header__title headline-1 text-uppercase">{{ header?.fields?.title[locale]?.value }}</h4>
				</div>
				<div data-aos="fade-left" class="news-release__header__info">
					<p>{{ header?.fields?.description[locale]?.value }}</p>
				</div>
			</div>
			<div data-aos="fade-up" class="news-release__body">
				<swiper
					class="swiper-container"
					:slidesPerView="3"
					:space-between="40"
					:centeredSlides="false"
					:auto-height="true"
					:breakpoints="breakpoints"
				>
					<swiper-slide
						v-for="(item, index) in rows"
						:key="index"
					>
						<div class="news-release__item">
							<q-img :src="item.paramsField?.image[locale]?.path || ''" height="400px" fit="cover" class="news-release__item__img" />
							<div class="news-release__item__date">{{ getMonthWithYear(item.createdAt!) }}</div>
							<h5 class="news-release__item__title text-red fonts-oswald text-uppercase">{{ item.title[locale] }}</h5>
							<div class="news-release__item__text">
								<p>{{ item.description[locale] }}</p>
							</div>
						</div>
					</swiper-slide>
				</swiper>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.news-release {
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
			&__date {
				font-size: 0.95em;
				margin-bottom: 16px;
				font-weight: bold;
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
				&__date {
					margin-bottom: 8px;
				}
				&__title {
					font-size: 1.25em;
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

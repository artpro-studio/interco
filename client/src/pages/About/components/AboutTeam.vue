<script lang="ts" setup>
	import { Swiper, SwiperSlide } from 'swiper/vue';
	import 'swiper/css';
	import { computed, inject, onMounted, ref, watch } from 'vue';
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();

	const widthScreen = inject<any>('widthScreen', 0);
	const widthSlider = ref(0);

	const aboutTeam = [
		{
			name: 'Куроедов Евгений',
			job: 'Генеральный директор',
			text: 'Более 10 лет опыта в управлении международными проектами и стратегическом развитии',
			image: 'images/employee1.png',
		},
		{
			name: 'Дудник Игорь',
			job: 'Операционный директор',
			text: 'Эксперт в области инновационных технологий с опытом работы в ведущих мировых компаниях',
			image: 'images/employee2.png',
		},
		{
			name: 'Гаврилов Дмитрий',
			job: 'Директор по развитию бизнеса',
			text: 'Специалист по международным рынкам и построению эффективных партнерских отношений',
			image: 'images/employee3.png',
		},
		{
			name: 'Куроедов Евгений',
			job: 'Генеральный директор',
			text: 'Более 10 лет опыта в управлении международными проектами и стратегическом развитии',
			image: 'images/employee1.png',
		},
		{
			name: 'Дудник Игорь',
			job: 'Операционный директор',
			text: 'Эксперт в области инновационных технологий с опытом работы в ведущих мировых компаниях',
			image: 'images/employee2.png',
		},
		{
			name: 'Гаврилов Дмитрий',
			job: 'Директор по развитию бизнеса',
			text: 'Специалист по международным рынкам и построению эффективных партнерских отношений',
			image: 'images/employee3.png',
		},

	]

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

	onMounted(() => {
		getSilderWidth();
	})
</script>

<template>
	<div class="about-team pt-8 pb-8">
		<div class="container">
			<div class="about-team__header row no-wrap justify-between items-center">
				<div class="about-team__header__body row items-center no-wrap">
					<q-img src="icons/arrow-red.svg" class="about-team__header__arrow" width="40px" />
					<h4 class="about-team__header__title headline-1 text-uppercase">{{ t('aboutTeamTitle') }}</h4>
				</div>
				<div class="about-team__header__info">
					<p>{{ t('aboutTeamDescription') }}</p>
				</div>
			</div>
			<div class="about-team__body" :style="{width: getStyleWidth}">
				<swiper
					class="swiper-container"
					:slidesPerView="'auto'"
					:space-between="40"
					:centeredSlides="false"
					:auto-height="true"
					:breakpoints="breakpoints"
				>
					<swiper-slide
						v-for="(item, index) in aboutTeam"
						:key="index"
					>
						<div class="about-team__item">
							<q-img :src="item.image" height="510px" fit="cover" class="about-team__item__img" />
							<h5 class="about-team__item__title text-red fonts-oswald text-uppercase">{{ item.name }}</h5>
							<p class="about-team__item__info">{{ item.job }}</p>
							<div class="about-team__item__text">
								<p>{{ item.text }}</p>
							</div>
						</div>
					</swiper-slide>
				</swiper>
			</div>
			<div class="about-team__column row no-wrap items-center">
				<div class="about-team__column__item ">
					<p>Наш коллектив насчитывает более 50 сотрудников, включая инженеров, менеджеров по продажам, специалистов по работе с клиентами, логистов и финансовых экспертов. </p>
				</div>
				<div class="about-team__column__item info fonts-oswald">
					<p>Мы верим в непрерывное обучение и развитие, поэтому активно инвестируем в профессиональный рост каждого члена команды.</p>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss">
	.about-team {
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
	.about-team {
		background-color: #F5F5F5;
		&__column {
			margin-top: 80px;
			&__item {
				padding-right: 20px;
				width: 50%;

				p {
					font-size: 1.22em;
					font-weight: bold;
				}

				&.info {
					font-size: 1.455em;

					p {
						font-weight: normal;
					}
				}
			}

			@media (max-width: 768px) {
				flex-wrap: wrap;
				margin-top: 40px;

				&__item {
					width: 100%;
					margin-bottom: 16px;
					padding-right: 0;

					&:last-child {
						margin-bottom: 0;
					}
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				&__item {
					p {
						font-size: 1em;
					}
					&.info {
						font-size: 1.5em;
					}
				}
			}
		}
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
	}
</style>

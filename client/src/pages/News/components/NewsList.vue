<script lang="ts" setup>
	import { Swiper, SwiperSlide } from 'swiper/vue';
	import 'swiper/css';
	import { computed, inject, onMounted, ref, watch } from 'vue';

	const widthScreen = inject<any>('widthScreen', 0);
	const widthSlider = ref(0);

	const aboutTeam = [
		{
			date: '09/23',
			name: 'Участие SA International на Восточном экономическом форуме (ВЭФ)',
			text: 'В рамках Восточного экономического форума, проходившего во Владивостоке, SA International подписала стратегическое соглашение с правительством Российской Федерации о строительстве завода по производству портового оборудования. Этот проект станет важным шагом в развитии инфраструктуры российских портов и укреплении экономического сотрудничества между Китаем и Россией.',
			image: 'images/employee1.png',
		},
		{
			date: '03/24',
			name: 'Проблемы с платежами из России в Китай и альтернативные подходы',
			text: 'В связи с возникающими трудностями в международных платежах между Россией и Китаем, SA International провела серию семинаров и встреч с представителями банков и финансовых организаций. Мы представили альтернативные решения и механизмы для обеспечения бесперебойных финансовых операций и поддержки наших клиентов в текущих условиях.',
			image: 'images/employee2.png',
		},
		{
			date: '06/24',
			name: 'Запуск SA Logistics — нового подразделения SIBC Group',
			text: 'SA International объявляет о создании SA Logistics, специализированного подразделения в составе SIBC Group, которое будет отвечать за все аспекты логистики. Новая компания предоставит полный спектр логистических услуг, включая транспортировку, складирование, таможенное оформление и управление цепочками поставок, что позволит нашим клиентам получить комплексное обслуживание "под ключ".',
			image: '',
		},
		{
			date: '08/24',
			name: 'Начало проекта по строительству завода роботов-манипуляторов в России',
			text: 'Мы с гордостью объявляем о запуске проекта по строительству завода по производству роботов-манипуляторов в России. Этот завод станет одним из первых в своем роде в регионе и позволит локализовать производство высокотехнологичного оборудования, способствуя развитию робототехники и автоматизации в промышленности.',
			image: 'images/employee2.png',
		},
		{
			date: '09/23',
			name: 'Участие SA International на Восточном экономическом форуме (ВЭФ)',
			text: 'В рамках Восточного экономического форума, проходившего во Владивостоке, SA International подписала стратегическое соглашение с правительством Российской Федерации о строительстве завода по производству портового оборудования. Этот проект станет важным шагом в развитии инфраструктуры российских портов и укреплении экономического сотрудничества между Китаем и Россией.',
			image: 'images/employee1.png',
		},
		{
			date: '03/24',
			name: 'Проблемы с платежами из России в Китай и альтернативные подходы',
			text: 'В связи с возникающими трудностями в международных платежах между Россией и Китаем, SA International провела серию семинаров и встреч с представителями банков и финансовых организаций. Мы представили альтернативные решения и механизмы для обеспечения бесперебойных финансовых операций и поддержки наших клиентов в текущих условиях.',
			image: 'images/employee2.png',
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
	<div class="news-list pt-12 pb-8">
		<div class="container">
			<div class="news-list__header row no-wrap justify-between items-center">
				<div class="news-list__header__body row items-center no-wrap">
					<q-img src="icons/arrow-red.svg" class="news-list__header__arrow" width="40px" />
					<h4 class="news-list__header__title headline-1 text-uppercase">Новости компании</h4>
				</div>
				<div class="news-list__header__info">
					<p>Будьте в курсе последних событий и новостей нашей компании.</p>
				</div>
			</div>
			<div class="news-list__body" :style="{width: getStyleWidth}">
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
						<div class="news-list__item">
							<q-img :src="item.image" height="400px" fit="cover" class="news-list__item__img" />
							<p class="news-list__item__date">{{ item.date }}</p>
							<h5 class="news-list__item__title text-red fonts-oswald text-uppercase">{{ item.name }}</h5>
							<div class="news-list__item__text">
								<p>{{ item.text }}</p>
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

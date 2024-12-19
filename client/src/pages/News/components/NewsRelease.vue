<script lang="ts" setup>
	import { Swiper, SwiperSlide } from 'swiper/vue';
	import 'swiper/css';

	const breakpoints: any = {
		'901': {
			slidesPerView: 3
		},
		'300': {
            slidesPerView: 'auto',
			spaceBetween: 20
        },
	}

	const release = [
		{
			date: '09/23',
			title: 'SA International подписывает соглашение с правительством РФ на ВЭФ',
			image: 'images/employee1.png',
			text: 'Официальное заявление о подписании соглашения о строительстве завода по производству портового оборудования в России.',
		},
		{
			date: '06/24',
			title: 'Официальный запуск SA Logistics',
			image: '',
			text: 'SA International объявляет о создании нового логистического подразделения, призванного улучшить качество и эффективность логистических услуг для наших клиентов.',
		},
		{
			date: '06/24',
			title: 'Старт проекта по производству роботов-манипуляторов в России',
			image: 'images/employee3.png',
			text: 'Официальный анонс начала строительства завода по производству роботизированных манипуляторов, направленного на развитие промышленной автоматизации в регионе',
		},
	];
</script>

<template>
	<div class="news-release pt-8 pb-8">
		<div class="container">
			<div class="news-release__header row no-wrap justify-between items-center">
				<div class="news-release__header__body row items-center no-wrap">
					<q-img src="icons/arrow-red.svg" class="news-release__header__arrow" width="40px" />
					<h4 class="news-release__header__title headline-1 text-uppercase">Пресс-релизы</h4>
				</div>
				<div class="news-release__header__info">
					<p>Официальные заявления и анонсы компании SA International</p>
				</div>
			</div>
			<div class="news-release__body">
				<swiper
					class="swiper-container"
					:slidesPerView="3"
					:space-between="40"
					:centeredSlides="false"
					:auto-height="true"
					:breakpoints="breakpoints"
				>
					<swiper-slide
						v-for="(item, index) in release"
						:key="index"
					>
						<div class="news-release__item">
							<q-img :src="item.image" height="400px" fit="cover" class="news-release__item__img" />
							<div class="news-release__item__date">{{ item.date }}</div>
							<h5 class="news-release__item__title text-red fonts-oswald text-uppercase">{{ item.title }}</h5>
							<div class="news-release__item__text">
								<p>{{ item.text }}</p>
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

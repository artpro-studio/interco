<script lang="ts" setup>
	import { Swiper, SwiperSlide } from 'swiper/vue';
	import 'swiper/css';
	import SectionTitle from 'src/components/SectionTitle/SectionTitle.vue';
	import { ref } from 'vue';

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
	<div class="support pb-8 pt-8">
		<div class="container">
			<section-title title="Сервис и поддержка" />
			<p class="support__description headline-2">Мы предлагаем полный спектр сервисных услуг, направленных на поддержание бесперебойной работы вашего оборудования и обеспечение максимальной эффективности</p>

			<div class="support__body">
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
							<h5 class="support__section__title text-gradient">Гарантийное обслуживание</h5>
							<div class="support__section__body">
								<div class="support__section__body__item">
									<h6>Срок гарантии</h6>
									<p>На все наше оборудование распространяется гарантия от производителя</p>
								</div>
								<div class="support__section__body__item">
									<h6>Условия гарантии</h6>
									<p>Подробная информация о гарантийных обязательствах указана в документации, прилагаемой к оборудованию</p>
								</div>
								<div class="support__section__body__item">
									<h6>Как воспользоваться гарантией</h6>
									<ul class="support__section__body__item__normal">
										<li>Свяжитесь с нашей службой поддержки по телефону +86-21-5432-2755 (ext. 804) или по электронной почте support@inter-sa.com</li>
										<li>Предоставьте информацию о продукте и описании проблемы</li>
										<li>Наши специалисты организуют ремонт или замену оборудования в кратчайшие сроки</li>
									</ul>
								</div>
							</div>
						</div>
					</swiper-slide>
					<swiper-slide>
						<div class="support__section">
							<h5 class="support__section__title text-gradient">Ремонт и техническое обслуживание</h5>
							<div class="support__section__body">
								<div class="support__section__body__item">
									<h6>Плановое обслуживание</h6>
									<p>Рекомендуем регулярное обслуживание оборудования для продления срока его службы и предотвращения возможных сбоев</p>
								</div>
								<div class="support__section__body__item">
									<h6>Ремонтные работы</h6>
									<ul class="support__section__body__item__list__number">
										<li>
											<p class="support__section__body__item__list__number__title">Срочный ремонт</p>
											<p class="support__section__body__item__list__number__text">В случае непредвиденных поломок мы готовы оперативно провести ремонтные работы</p>
										</li>
										<li>
											<p class="support__section__body__item__list__number__title">Запасные части</p>
											<p class="support__section__body__item__list__number__text">Обеспечиваем поставку оригинальных запасных частей и комплектующих</p>
										</li>
										<li>
											<p class="support__section__body__item__list__number__title">Сервисные центры</p>
											<p class="support__section__body__item__list__number__text">Наши сервисные центры расположены в Шанхае, Иу и Благовещенске</p>
										</li>
										<li>
											<p class="support__section__body__item__list__number__title">Квалифицированные специалисты</p>
											<p class="support__section__body__item__list__number__text">Наши инженеры прошли обучение и имеют необходимый опыт для обслуживания вашего оборудования</p>
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
				background-image: url('icons/arrow-big-blue.svg');
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
								background-image: url('icons/arrow-yellow.svg');
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
								background-image: url('icons/check-white.svg');
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

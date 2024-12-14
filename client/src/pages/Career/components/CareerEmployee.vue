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
</script>

<template>
	<div class="career-employee pt-8 pb-8 bg-white">
		<div class="container">
			<div class="career-employee__header row no-wrap justify-between items-center">
				<div class="career-employee__header__body row items-center no-wrap">
					<q-img src="icons/arrow-red.svg" class="career-employee__header__arrow" width="40px" />
					<h4 class="career-employee__header__title headline-1 text-uppercase">Истории сотрудников</h4>
				</div>
				<div class="career-employee__header__info">
					<p>Познакомьтесь с историями успеха наших сотрудников, которые уже стали частью команды SA International</p>
				</div>
			</div>
			<div class="career-employee__body">
				<swiper
					class="swiper-container"
					:slidesPerView="3"
					:space-between="40"
					:centeredSlides="false"
					:auto-height="true"
					:breakpoints="breakpoints"
				>
					<swiper-slide>
						<div class="career-employee__item">
							<q-img src="images/employee1.png" height="510px" fit="cover" class="career-employee__item__img" />
							<h5 class="career-employee__item__title text-red fonts-oswald text-uppercase">Марина Смирнова </h5>
							<p class="career-employee__item__info">Менеджер по работе с клиентами</p>
							<div class="career-employee__item__text">
								<p>"Когда я присоединилась к SA International два года назад, я и не предполагала, насколько быстро смогу вырасти профессионально. Компания предоставляет все возможности для обучения и развития. Я работаю с клиентами из разных стран, что позволяет постоянно расширять свой кругозор и приобретать новый опыт."</p>
							</div>
						</div>
					</swiper-slide>
					<swiper-slide>
						<div class="career-employee__item">
							<q-img src="images/employee2.png" height="510px" fit="cover" class="career-employee__item__img" />
							<h5 class="career-employee__item__title text-red fonts-oswald text-uppercase">Иван Ковалев</h5>
							<p class="career-employee__item__info">Инженер по автоматизации</p>
							<div class="career-employee__item__text">
								<p>"Работа в SA International — это постоянный вызов и возможность участвовать в передовых проектах. Особенно интересно было работать над проектом по внедрению искусственного интеллекта в производственные процессы. Команда профессионалов и поддержка руководства делают работу здесь по-настоящему увлекательной."</p>
							</div>
						</div>
					</swiper-slide>
					<swiper-slide>
						<div class="career-employee__item">
							<q-img src="images/employee3.png" height="510px" fit="cover" class="career-employee__item__img" />
							<h5 class="career-employee__item__title text-red fonts-oswald text-uppercase">Лю Чэнь</h5>
							<p class="career-employee__item__info">Специалист по логистике</p>
							<div class="career-employee__item__text">
								<p>"SA International дала мне возможность реализовать себя в международной логистике. Здесь ценят инициативу и стремление к совершенству. Я горжусь тем, что являюсь частью компании, которая активно развивается и покоряет новые рынки."</p>
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

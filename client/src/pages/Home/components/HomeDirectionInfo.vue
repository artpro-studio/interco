<template>
	<div class="home-direction-info pb-12">
		<div class="container">
			<div class="home-direction-info__header row no-wrap items-center">
				<h4 class="home-direction-info__header__title headline-3 text-uppercase text-red">2. Собственное производство</h4>
				<div class="line"></div>
				<q-btn color="black" class="home-direction-info__header__btn text-bold" flat>
					<div class="row no-wrap">
						<div>Подробнее</div>
						<q-img src="icons/arrow-yellow.svg" class="q-ml-md" width="16px" alt="Подробнее" />
					</div>
				</q-btn>
			</div>
			<div class="home-direction-info__icons row no-wrap justify-between">
				<div class="home-direction-info__icons__item row no-wrap items-center justify-between">
					<div class="home-drection-info__icons__item__images">
						<q-img src="images/icon-car.png" class="home-direction-info__icons__item__img" width="89px" />
					</div>
					<p class="home-direction-info__icons__item__text text-uppercase text-black fonts-oswald">Вилочные погрузчики</p>
				</div>
				<div class="home-direction-info__icons__item row no-wrap items-center">
					<div class="home-direction-info__icons__item__images">
						<q-img src="images/icon-product.png" class="home-direction-info__icons__item__img" width="64px" />
					</div>
					<p class="home-direction-info__icons__item__text text-uppercase text-black fonts-oswald">Бетонное оборудование</p>
				</div>
				<div class="home-direction-info__icons__item row no-wrap items-center">
					<div class="home-direction-info__icons__item__images">
						<q-img src="images/icon-prodcut2.png" class="home-direction-info__icons__item__img" width="64px" />
					</div>
					<p class="home-direction-info__icons__item__text text-uppercase text-black fonts-oswald">Конвейерные ленты</p>
				</div>
			</div>
			<div class="home-direction-info__lists row no-wrap justify-between items-center">
				<div class="home-direction-info__lists__item">
					<h5 class="home-direction-info__lists__item__title headline-3 text-uppercase text-red">3. Производственные линии под ключ</h5>
					<div class="home-direction-info__lists__item__content row no-wrap items-center">
						<q-img src="icons/arrow-black.svg" class="home-direction-info__lists__item__img" width="16px" alt="Подробнее" />
						<p>Мы предлагаем комплексные решения по разработке и внедрению производственных линий, адаптированных под индивидуальные потребности вашего бизнеса.</p>
					</div>
				</div>
				<div class="home-direction-info__lists__item">
					<h5 class="home-direction-info__lists__item__title headline-3 text-uppercase text-red">4. Консалтинг и разработка технологий</h5>
					<div class="home-direction-info__lists__item__content row no-wrap items-center">
						<q-img src="icons/arrow-black.svg" class="home-direction-info__lists__item__img" width="16px" alt="Подробнее" />
						<p>Наша команда экспертов предоставляет услуги по выбору оборудования, внедрению инновационных технологий и оптимизации производственных процессов.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.home-direction-info {
		background-color: var(--white);
		padding-top: 120px;

		@media (max-width: $breakpoint-sm-min) {
			padding-top: 80px;
		}

		&__header {
			margin-bottom: 40px;

			&__title {
				white-space: nowrap;
			}

			.line {
				background-color: rgba(105, 109, 125, 0.5);
				height: 1px;
				width: 100%;
				margin: 0 40px;
			}

			@media (max-width: $breakpoint-sm-min) {
				.line {
					display: none;
				}

				&__btn {
					display: none;
				}
			}
		}

		&__icons {
			margin-bottom: 120px;
			&__item {
				&__img {
					margin-right: 32px;
				}
				&__text {
					font-size: 1.55em;
					max-width: 180px;
				}
			}
			@media (max-width: $breakpoint-md-min) {
				flex-wrap: wrap;
			}

			@media (max-width: 900px) {
				justify-content: flex-start;

				&__item {
					margin-bottom: 30px;

					&:last-child {
						margin-bottom: 0;
					}

					&__text {
						font-size: 1.5em;
					}

					&__img {
						margin-right: 20px;
					}
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				justify-content: center;
				margin-bottom: 40px;
				&__item {
					&__images {
						width: 120px;
						display: flex;
						justify-content: flex-start;
						align-items: center;
					}
					&__img {
						width: 64px;
					}
					&__text {
						font-size: 1.55em;
					}
				}
			}
		}

		&__lists {
			padding: 0 63px;

			&__item {
				margin-right: 24px;

				&:last-child {
					margin-right: 0;
				}

				&__img {
					min-width: 27px;
					height: 40px;
					margin-right: 35px;
					margin-left: 18px;
				}

				&__title {
					line-height: 1.5;
					margin-bottom: 64px;
				}

				p {
					line-height: 156%;
					max-width: 468px;
				}
			}

			@media (max-width: $breakpoint-md-min) {
				padding: 0;
			}

			@media (max-width: $breakpoint-sm-min) {
				flex-wrap: wrap;

				&__item {
					margin-bottom: 40px;

					&:last-child {
						margin-bottom: 0;
					}

					&__title {
						margin-bottom: 16px;
					}

					&__img {
						width: 16px;
						min-width: 16px;
						height: auto;
						margin-left: 12px;
						margin-right: 20px;
					}
				}
			}
		}
	}
</style>

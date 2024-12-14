<template>
	<div class="career-advantages pt-8 pb-120">
		<div class="container">
			<div class="career-advantages__header">
				<h4 class="career-advantages__header__title headline-1 text-gradient text-uppercase">Преимущества работы у нас</h4>
			</div>
			<div class="career-advantages__body">
				<div class="career-advantages__body__section row no-wrap">
					<div class="career-advantages__body__item images">
						<q-img src="images/career-adv.png" height="230px" width="437px" fit="cover" class="career-advantages__body__item__img"/>
					</div>
					<div class="career-advantages__body__item" style="max-width: 326px;">
						<div class="career-advantages__body__item__header row no-wrap items-start">
							<span>1.</span>
							<h5>Конкурентоспособная оплата труда</h5>
						</div>
						<p>Мы ценим вклад каждого сотрудника и предлагаем достойную заработную плату, соответствующую опыту и квалификации</p>
					</div>
					<div class="career-advantages__body__item">
						<div class="career-advantages__body__item__header row no-wrap items-start">
							<span>2.</span>
							<h5>Социальный пакет и бонусы</h5>
						</div>
						<ul>
							<li>Медицинская страховка: полис, покрывающий широкий спектр медицинских услуг</li>
							<li>Оплачиваемый отпуск: ежегодный отпуск, соответствующий законодательству</li>
							<li>Бонусная система: поощрения за достижение результатов и перевыполнение планов</li>
						</ul>
					</div>
				</div>
				<div class="career-advantages__body__section row no-wrap">
					<div class="career-advantages__body__item">
						<div class="career-advantages__body__item__header row no-wrap items-start">
							<span>3.</span>
							<h5>Возможности профессионального роста</h5>
						</div>
						<ul>
							<li>Обучение и развитие: курсы, тренинги, участие в конференциях и семинарах.</li>
							<li>Карьерный рост: прозрачная система продвижения по службе.</li>
							<li>Международный опыт: работа в мультикультурной среде и проекты за рубежом.</li>
						</ul>
					</div>
					<div class="career-advantages__body__item">
						<div class="career-advantages__body__item__header row no-wrap items-start">
							<span>4.</span>
							<h5>Комфортные условия труда</h5>
						</div>
						<ul>
							<li>Современные офисы: оборудованные всем необходимым для продуктивной работы.</li>
							<li>Дружный коллектив: поддерживающая и позитивная атмосфера в команде.</li>
							<li>Корпоративные мероприятия: тимбилдинги, праздники, спортивные мероприятия.q</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.career-advantages {
		&__header {
			margin-bottom: 64px;

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 32px;
			}
		}

		&__body {
			color: var(--white);

			&__section {
				margin: 0 -20px;
				margin-bottom: 64px;

				@media (max-width: 1200px) {
					margin: 0px -16px;
				}

				@media (max-width: $breakpoint-md-min) {
					flex-wrap: wrap;
				}
				@media (max-width: $breakpoint-sm-min) {
					margin: 0;
					&:first-child {
						.career-advantages__body__item {
							&:nth-child(1) {
								order: 1;
							}
							&:nth-child(2) {
								order: 0;
							}
							&:nth-child(3) {
								order: 2;
							}
						}
					}
				}
			}

			&__item {
				margin: 0 20px;

				&.images {
					@media (max-width: $breakpoint-sm-min) {
						width: 100%;
					}
				}

				&__img {
					border-radius: 10px;
					@media (max-width: 1200px) {
						width: 300px !important;
					}
					@media (max-width: $breakpoint-sm-min) {
						width: 100% !important;
					}

				}
				&__header {
					font-size: 1.22em;
					margin-bottom: 16px;

					h5 {
						font-size: 1em;
						margin-left: 16px;
					}
				}

				ul {
					list-style-type: none;
					margin: 0;
					padding: 0;

					li {
						margin: 0;
						padding: 0;
						margin-bottom: 8px;
						position: relative;
						padding-left: 40px;

						&::before {
							content: '';
							width: 32px;
							height: 32px;
							background-image: url('icons/arrow-yellow.svg');
							background-repeat: no-repeat;
							background-position: center;
							position: absolute;
							top: 50%;
							left: 0;
							margin-top: -16px;
						}
					}
				}

				@media (max-width: $breakpoint-md-min) {
					margin-bottom: 24px;
				}
				@media (max-width: $breakpoint-sm-min) {
					margin: 0;
					margin-bottom: 24px;
				}
			}
		}
	}
</style>

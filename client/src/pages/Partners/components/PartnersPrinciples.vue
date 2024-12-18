<template>
	<div class="partners-principles pt-8 pb-8 bg-white">
		<div class="container">
			<h3 class="partners-principles__title text-gradient headline-1 text-uppercase">Принципы партнерства</h3>
			<div class="partners-principles__body row">
				<div class="partners-principles__item">
					<h5 class="text-red text-uppercase fonts-oswald text-bold">1. Взаимное доверие и уважение</h5>
					<div class="partners-principles__item__content">
						<h6>Открытая коммуникация</h6>
						<p>Честность и прозрачность во всех аспектах сотрудничества</p>
					</div>
					<div class="partners-principles__item__content">
						<h6>Уважение интересов</h6>
						<p>Учитываем цели и потребности наших партнеров при принятии решений</p>
					</div>
				</div>
				<div class="partners-principles__item">
					<h5 class="text-red text-uppercase fonts-oswald text-bold">2. Долгосрочное сотрудничество</h5>
					<div class="partners-principles__item__content">
						<h6>Стратегические отношения</h6>
						<p>Стремимся к построению устойчивых и продолжительных партнерских связей</p>
					</div>
					<div class="partners-principles__item__content">
						<h6>Совместный рост</h6>
						<p>Работая вместе, мы помогаем друг другу достигать новых высот</p>
					</div>
				</div>
				<div class="partners-principles__item">
					<h5 class="text-red text-uppercase fonts-oswald text-bold">3. Ответственность и этика</h5>
					<div class="partners-principles__item__content">
						<h6>Соблюдение обязательств</h6>
						<p>Выполняем договоренности точно и в срок</p>
					</div>
					<div class="partners-principles__item__content">
						<h6>Этические стандарты</h6>
						<p>Придерживаемся высоких этических норм в бизнесе</p>
					</div>
				</div>
				<div class="partners-principles__item">
					<h5 class="text-red text-uppercase fonts-oswald text-bold">4. Инновационность и развитие</h5>
					<div class="partners-principles__item__content">
						<h6>Поиск новых возможностей</h6>
						<p>Постоянно ищем способы улучшить наши продукты и услуги</p>
					</div>
					<div class="partners-principles__item__content">
						<h6>Обучение и обмен опытом</h6>
						<p>Поощряем совместное обучение и развитие компетенций</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.partners-principles {
		color: var(--dark-blue);

		&__title {
			margin-bottom: 64px;

			@media (max-width: 800px) {
				margin-bottom: 40px;
			}
		}
		&__body {
			margin: 0 -16px;

			@media (max-width: 800px) {
				margin: 0;
			}

		}
		&__item {
			width: calc(50% - 32px);
			margin: 0 16px;
			margin-bottom: 64px;

			h5 {
				margin-bottom: 32px;
				font-size: 1.55em;
				line-height: 140%;
			}

			h6 {
				font-size: 1.22em;
				font-weight: bold;
				margin-bottom: 6px;
				line-height: 140%;
			}

			p {
				line-height: 145%;
			}

			&__content {
				margin-bottom: 24px;

				&:last-child {
					margin-bottom: 0;
				}
			}

			@media (max-width: 800px) {
				width: 100%;
				margin: 0;
				margin-bottom: 32px;

				h5 {
					font-size: 1.38em;
					margin-bottom: 16px;
				}

				h6 {
					font-size: 1.15em;
				}

				p {
					font-size: 1em;
				}

				&__content {
					margin-bottom: 16px;
				}

				&:last-child {
					margin-bottom: 0;
				}
			}
		}
	}

</style>

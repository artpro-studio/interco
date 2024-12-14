<template>
	<div class="career-procces pt-8 pb-8 bg-white">
		<div class="container">
			<div class="career-procces__header">
				<h4 class="career-procces__title headline-1 text-gradient text-uppercase">Процесс отбора</h4>
			</div>
			<div class="career-procces__body">
				<div class="career-procces__section row justify-between no-wrap">
					<div class="career-procces__item">
						<h5 class="career-procces__item__title fonts-oswald text-uppercase">1. Подача резюме</h5>
						<p>Заполните форму на сайте или отправьте резюме на электронную почту hr@inter-sa.com, указав в теме письма название вакансии</p>
					</div>
					<q-img src="icons/arrow-red-outline.svg" class="career-procces__arrow" fit="contain" width="64px" />
					<div class="career-procces__item">
						<h5 class="career-procces__item__title fonts-oswald text-uppercase">2. Первичное интервью</h5>
						<p>Наши специалисты по подбору персонала свяжутся с вами для проведения телефонного или онлайн-интервью, чтобы обсудить ваш опыт и ожидания</p>
					</div>
					<q-img src="icons/arrow-red-outline.svg" class="career-procces__arrow" fit="contain" width="64px" />
					<div class="career-procces__item">
						<h5 class="career-procces__item__title fonts-oswald text-uppercase">3. Тестовое задание</h5>
						<p>Для некоторых позиций может потребоваться выполнение тестового задания для оценки профессиональных навыков</p>
					</div>
					<q-img src="icons/arrow-red-outline.svg" class="career-procces__arrow desktop-hide" fit="contain" width="64px" />
				</div>
				<div class="career-procces__section row justify-between no-wrap">
					<div class="career-procces__item">
						<h5 class="career-procces__item__title fonts-oswald text-uppercase">4. Личное интервью</h5>
						<p>Встреча с руководителем отдела и представителями HR для более детального знакомства и обсуждения условий работы</p>
					</div>
					<q-img src="icons/arrow-red-outline.svg" class="career-procces__arrow" fit="contain" width="64px" />
					<div class="career-procces__item">
						<h5 class="career-procces__item__title fonts-oswald text-uppercase">5. Принятие решения</h5>
						<p>В случае успешного прохождения всех этапов мы сделаем вам официальное предложение о работе с указанием всех условий</p>
					</div>
					<q-img src="icons/arrow-red-outline.svg" class="career-procces__arrow" fit="contain" width="64px" />
					<div class="career-procces__item">
						<h5 class="career-procces__item__title fonts-oswald text-uppercase">6. Выход на работу</h5>
						<p>Оформление необходимых документов и начало вашей карьеры в SA International</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.career-procces {
		&__header {
			margin-bottom: 64px;
		}

		&__section {
			margin-bottom: 64px;

			@media (max-width: 700px) {
				flex-wrap: wrap;
				margin-bottom: 0;
			}
		}

		&__item {
			width: 341px;

			&__title {
				margin-bottom: 24px;
				font-size: 1.22em;
				font-weight: 500;
				letter-spacing: 2%;
			}

			p {
				letter-spacing: 3%;
				font-size: 0.9em;
			}

			@media (max-width: 700px) {
				width: 100%;

				&__title {
					margin-bottom: 8px;
				}
			}
		}

		&__arrow {
			margin: 0 40px;
			min-width: 64px;

			@media (max-width: $breakpoint-md-min) {
				width: 40px !important;
				min-width: 40px;
				margin: 0 20px;
			}
			@media (max-width: 700px) {
				width: 20px !important;
				min-width: 20px;
				margin: 30px 0;

				&.desktop-hide {
					display: block !important;
				}
			}
		}
	}
</style>

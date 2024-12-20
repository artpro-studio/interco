<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();

	const years = [
		{
			date: '2020',
			text: 'Основание SA International в составе SIBC Group в Шанхае. Открытие первого зарубежного офиса в Благовещенске, Россия, что позволило нам укрепить позиции на рынке СНГ.',
		},
		{
			date: '2021',
			text: 'Запуск собственного производства вилочных погрузчиков и конвейерных лент, расширение продуктовой линейки.',
		},
		{
			date: '2022',
			text: 'Начало внедрения инновационных технологий с использованием искусственного интеллекта в производственные процессы.',
		},
		{
			date: '2023',
			text: 'Участие в Восточном Экономическом Форуме. Подписание договоров с правительством Российской Федерации о строительстве завода по производству портового оборудования.',
		},
		{
			date: '2024',
			text: 'Создание бартерной биржи совместно с партнерами, инвестиции в размере 5 млн юаней для развития проекта. Подготовка к строительству завода по производству роботизированных рук в России с целью полной локализации производства к 2028 году. Расширение международного присутствия, планирование открытия офисов в Москве и Крыму, увеличение штата сотрудников до 50 человек. Открытие офисов в Гонконге и Иу. ',
		},
	]
</script>

<template>
	<div class="about-years pt-8 pb-8">
		<div class="container">
			<div class="about-years__header">
				<h3 class="about-years__header__title headline-1 text-gradient text-uppercase">{{ t('aboutYearsTitle') }}</h3>
			</div>
			<div class="about-years__body">
				<div
					v-for="(item, index) in years"
					:key="index"
					class="about-years__item row no-wrap"
				>
					<div class="about-years__item__column headline-2">{{ item.date }}</div>
					<div class="about-years__item__info">
						<p>{{ item.text }}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<style lang="scss" scoped>
	.about-years {
		color: var(--white);
		font-family: 'Oswald', sans-serif;
		&__header {
			margin-bottom: 64px;

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 40px;
			}
		}

		&__item {
			border-bottom: 2px rgba(136, 136, 145, 0.55) solid;
			padding-bottom: 24px;
			margin-bottom: 24px;

			&:last-child {
				margin-bottom: 0;
				border-bottom: none;
			}

			&__column {
				min-width: 24%;
			}

			&__info {
				p {
					font-size: 1.35em;
					text-transform: uppercase;
					line-height: 145%;

					@media (max-width: $breakpoint-sm-min) {
						font-size: 1.2em;
					}
				}
			}
		}
	}
</style>

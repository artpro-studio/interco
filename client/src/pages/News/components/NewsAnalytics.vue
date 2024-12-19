<script lang="ts" setup>
	const analytics = [
		{
			date: '06/24',
			title: 'Решение проблем международных платежей: опыт SA International',
		},
		{
			date: '03/24',
			title: 'Обзор текущих вызовов в сфере международных финансовых операций между Россией и Китаем и представление эффективных альтернативных подходов',
		},
		{
			date: '09/23',
			title: 'Тенденции в логистике: создание SA Logistics',
		},
		{
			date: '09/23',
			title: 'Развитие портовой инфраструктуры в России',
		},
		{
			date: '09/23',
			title: 'Значение строительства завода портового оборудования для экономики России и укрепления международного сотрудничества',
		},
	]
</script>

<template>
	<div class="news-analytics pt-8 pb-8 bg-white">
		<div class="container">
			<div class="news-analytics__header row no-wrap justify-between items-center">
				<div class="news-analytics__header__body row items-center no-wrap">
					<h4 class="news-analytics__header__title headline-1 text-gradient text-uppercase">Статьи и аналитика</h4>
				</div>
				<div class="news-analytics__header__info">
					<p>Мы делимся своим опытом и экспертными знаниями, публикуя статьи и аналитические материалы по актуальным темам промышленности и технологий.</p>
				</div>
			</div>
			<div class="news-analytics__body">
				<div
					v-for="(item, index) in analytics"
					:key="index"
					class="news-analytics__item"
				>
					<div class="news-analytics__item__date">{{ item.date }}</div>
					<h5 class="news-analytics__item__title">{{ item.title }}</h5>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.news-analytics {
		&__header {
			margin-bottom: 64px;

			&__arrow {
				margin-right: 58px;
			}

			&__info {
				padding-left: 40px;
				border-left: 2px var(--yellow) solid;
				width: 570px;
				p {
					letter-spacing: 1px;
					line-height: 156%;
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
						font-weight: 400;
						line-height: 140%;
					}
				}
			}
		}

		&__body {
			padding-left: 220px;

			@media (max-width: 768px) {
				padding-left: 0;
			}
		}

		&__item {
			border-bottom: 2px #E3E3E3 solid;
			padding-bottom: 24px;
			margin-bottom: 24px;


			&:last-child {
				margin-bottom: 0;
				border-bottom: none
			}
			&__date {
				color: var(--gray-secondary);
				font-size: 0.95em;
				margin-bottom: 16px;
				font-weight: bold;
			}

			&__title {
				font-family: 'Oswald', sans-serif;
				font-size: 1.35em;
				text-transform: uppercase;
				font-weight: 500;
			}

			@media (max-width: $breakpoint-sm-min) {
				&__date {
					font-size: 1em;
				}

				&__title {
					font-size: 1.25em;
				}
			}
		}
	}
</style>

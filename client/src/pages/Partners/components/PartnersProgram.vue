<script lang="ts" setup>
	import SectionTitle from 'src/components/SectionTitle/SectionTitle.vue';
</script>

<template>
	<div class="partners-programs pt-8 pb-8">
		<div class="container">
			<div class="partners-programs__header row no-wrap justify-between items-center">
				<section-title title="Партнерская программа" class="partners-programs__title" style="margin-bottom: 0;" />

				<div class="partners-programs__header__info">
					<p>Мы предлагаем различные формы сотрудничества, адаптированные под ваши потребности и возможности</p>
				</div>
			</div>
			<h4 class="partners-programs__subtitle headline-2"> Возможные формы сотрудничества</h4>
			<div class="partners-programs__body row">
				<div class="partners-programs__item">
					<h5 class="text-gradient fonts-oswald text-bold">Дилерство и дистрибуция</h5>
					<ul>
						<li>Стать официальным представителем нашей продукции в вашем регионе</li>
						<li>Обучение персонала и маркетинговая поддержка</li>
					</ul>
				</div>
				<div class="partners-programs__item">
					<h5 class="text-gradient fonts-oswald text-bold">Совместные проекты</h5>
					<ul>
						<li>Реализация совместных проектов в области производства, разработки технологий и инноваций</li>
						<li>Совместные инвестиции и распределение рисков и прибыли</li>
					</ul>
				</div>
				<div class="partners-programs__item">
					<h5 class="text-gradient fonts-oswald text-bold">Технологическое партнерство</h5>
					<ul>
						<li>Обмен опытом и технологиями для создания новых продуктов и решений</li>
						<li>Совместные исследования и разработки</li>
					</ul>

				</div>
				<div class="partners-programs__item">
					<h5 class="text-gradient fonts-oswald text-bold">Логистическое сотрудничество</h5>
					<ul>
						<li>Взаимодействие в сфере логистики и цепочек поставок через наше подразделение SA Logistics</li>
						<li>Оптимизация транспортных и складских процессов</li>
					</ul>

				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.partners-programs {
		color: var(--white);

		&__title {
			width: 100%;
		}
		&__header {
			margin-bottom: 64px;

			&__info {
				max-width: 460px;
				letter-spacing: 1px;
				padding-left: 40px;
				border-left: 2px var(--yellow) solid;
			}
		}

		&__subtitle {
			margin-bottom: 64px;
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
			border-radius: 10px;
    		background-color: rgba(35, 36, 57, 0.6);
			padding: 40px;
			margin-bottom: 40px;

			h5 {
				margin-bottom: 40px;
				font-size: 1.55em;
				line-height: 140%;
			}

			h6 {
				font-size: 1.22em;
				font-weight: bold;
				margin-bottom: 16px;
				line-height: 140%;
			}

			p {
				line-height: 145%;
			}

			ul {
				list-style-type: none;
				margin: 0;
				padding: 0;

				li {
					margin-bottom: 24px;
					font-size: 1em;
					position: relative;
					padding-left: 35px;

					&::before {
						content: '';
						width: 25px;
						height: 25px;
						background-image: url('icons/arrow-yellow.svg');
						background-repeat: no-repeat;
						background-position: center;
						background-size: contain;
						position: absolute;
						top: 50%;
						left: 0;
						margin-top: -12.5px;
					}

					&:last-child {
						margin-bottom: 0;
					}
				}
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
				margin-bottom: 20px;
				padding: 20px;

				h5 {
					font-size: 1.38em;
					margin-bottom: 24px;
				}

				h6 {
					font-size: 1.15em;
					margin-bottom: 8px;
				}

				p {
					font-size: 1em;
				}

				&__content {
					margin-bottom: 16px;
				}

				:last-child {
					margin-bottom: 0;
				}
			}
		}
	}

</style>

<script lang="ts" setup>
	import VBtnGradient from 'src/components/UI/VBtnGradient/VBtnGradient.vue';
</script>
<template>
	<div class="job-openings__slide">
		<div class="job-openings__slide__header row items-center no-wrap">
			<q-img src="icons/user.svg" class="job-openings__slide__header__icon" width="64px" />
			<h4 class="job-openings__slide__header__title text-gradient">Директор по продажам</h4>
		</div>
		<div class="job-openings__slide__body">
			<h5>Местоположение</h5>
			<p>Шанхай, Китай</p>
			<h5>Требования</h5>
			<ul>
				<li> - Навыки стратегического мышления и лидерства</li>
				<li> - Опыт работы на руководящей позиции в продажах не менее 5 лет</li>
				<li> - Высшее образование в области маркетинга, экономики или управления</li>
				<li> - Знание английского и/или китайского языков на высоком уровне</li>
			</ul>
			<h5>Обязанности</h5>
			<ul>
				<li> - Разработка и реализация стратегии продаж</li>
				<li> - Управление командой менеджеров по продажам</li>
				<li> - Установление и поддержание отношений с ключевыми клиентами</li>
				<li> - Анализ рынка и поиск новых возможностей для развития бизнеса</li>
			</ul>
			<h5>Условия</h5>
			<ul>
				<li> - Конкурентоспособная заработная плата</li>
				<li> - Бонусы по результатам работы</li>
				<li> - Социальный пакет и медицинская страховка</li>
				<li> - Возможности для профессионального роста</li>
			</ul>
			<v-btn-gradient class="job-openings__slide__btn" :height="44">отправить резюме</v-btn-gradient>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.job-openings {
		&__slide {
			padding: 40px;
			max-width: 440px;
			width: 440px;
			background-color: rgba(35, 36, 57, 0.6);
			border-radius: 10px;
			position: relative;

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

			&__header {
				position: relative;
				padding-bottom: 8px;
				&__title {
					font-size: 1.55em;
					font-weight: 700;
				}
				&__icon {
					margin-right: 24px;
				}
			}

			&__body {
				color: var(--white);
				position: relative;

				h5 {
					margin-top: 32px;
					margin-bottom: 16px;
					font-weight: 700;
					font-size: 1.24em;
				}

				ul {
					list-style-type: none;
					margin: 0;
					padding: 0;

					li {
						margin: 0;
						padding: 0;
						margin-bottom: 8px;
					}
				}
			}

			&__btn {
				margin-top: 32px;
				max-width: 208px;
			}

			@media (max-width: $breakpoint-sm-min) {
				padding: 24px;
				max-width: 304px;
				width: 304px;
				&__header {
					&__title {
						font-size: 1.28em;
					}
					&__icon {
						width: 40px !important;
					}
				}

				&__body {
					h5 {
						font-size: 1.28em;
						margin-top: 16px;
					}
				}

				&__btn {
					margin-top: 16px;
				}
			}
	}
	}
</style>


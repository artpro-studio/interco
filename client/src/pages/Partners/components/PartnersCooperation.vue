<script lang="ts" setup>
	import SectionTitle from 'src/components/SectionTitle/SectionTitle.vue';
</script>

<template>
	<div class="partners-cooperation pt-8 pb-8 bg-white">
		<div class="container">
			<section-title class="partners-cooperation__title" color-text="black" title="Условия сотрудничества" />
			<div class="partners-cooperation__body row no-wrap justify-between">
				<div class="partners-cooperation__item">
					<h4 class="partners-cooperation__item__title">Взаимный интерес</h4>
					<p>Совпадение стратегических целей и интересов обеих сторон</p>
				</div>
				<div class="partners-cooperation__item">
					<h4 class="partners-cooperation__item__title">Соблюдение стандартов</h4>
					<p>Готовность придерживаться высоких стандартов качества и этики</p>
				</div>
				<div class="partners-cooperation__item">
					<h4 class="partners-cooperation__item__title">Компетентность и надежность</h4>
					<p>Наличие опыта и ресурсов для успешной реализации совместных проектов</p>
				</div>
			</div>
		</div>
	</div>
</template>

<style lang="scss" scoped>
	.partners-cooperation {
		&__body {
			@media (max-width: 800px) {
				flex-wrap: wrap;
			}
		}
		&__item {
			padding-right: 24px;
			&__title {
				font-size: 1.55em;
				line-height: 140%;
				color: var(--red);
				font-family: 'Oswald', sans-serif;
				margin-bottom: 32px;
				text-transform: uppercase;
				font-weight: 500;
				white-space: nowrap;

				@media (max-width: 1100px) {
					white-space: wrap;
					height: 80px;
					margin-bottom: 16px;
				}
			}

			p {
				font-size: 1.22em;
				font-weight: bold;
				letter-spacing: 1px;
				line-height: 140%;
			}

			@media (max-width: 800px) {
				margin-bottom: 24px;

				&__title {
					height: auto;
					font-size: 1.38em;
				}

				p{
					font-size: 1em;
				}
			}
		}
	}
</style>

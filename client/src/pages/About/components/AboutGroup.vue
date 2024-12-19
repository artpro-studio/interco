<script lang="ts" setup>
	import SectionTitle from 'src/components/SectionTitle/SectionTitle.vue';
</script>

<template>
	<div class="about-group pt-8 pb-8 bg-white">
		<div class="container">
			<div class="about-group__header">
				<section-title title="Группа компаний" color-text="black" />
			</div>
			<div class="about-group__body row no-wrap">
				<div class="about-group__content">
					<h5 class="fonts-oswald text-red text-uppercase">SIBC Group</h5>
					<p> — это динамично развивающаяся группа компаний, основанная в 2017 году, специализирующаяся на консалтинговых услугах, подборе оборудования и внедрении современных технологий в промышленность. SA International играет ключевую роль в составе группы, отвечая за международное развитие, расширение продуктовой линейки и реализацию стратегических проектов.</p>
				</div>
				<div class="about-group__info">
					<p class="fonts-oswald">Наша интеграция в SIBC Group позволяет нам использовать обширный опыт и ресурсы группы для предоставления комплексных решений и укрепления позиций на глобальном рынке.</p>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.about-group {
		&__body  {
			@media (max-width: 768px) {
				flex-wrap: wrap;
			}
		}
		&__content {
			width: 50%;
			min-width: 50%;
			padding-right: 20px;

			h5 {
				font-weight: 500;
				margin-bottom: 24px;
				font-size: 1.55em;
			}

			@media (max-width: 768px) {
				width: 100%;
				min-width: auto;
			}

			@media (max-width: $breakpoint-sm-min) {
				h5 {
					margin-bottom: 16px;
				}
			}
		}
		&__info {
			padding-top: 55px;
			p {
				color: var(--dark-blue);
				font-size: 1.35em;
				text-transform: uppercase;
				font-weight: 400;
			}

			@media (max-width: $breakpoint-sm-min) {
				padding-top: 0;
				margin-top: 16px;
			}
		}
	}
</style>

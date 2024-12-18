<script lang="ts" setup>
	import SectionTitle from 'src/components/SectionTitle/SectionTitle.vue';
</script>

<template>
	<div class="partners-advantages pt-8 pb-8">
		<div class="container">
			<section-title title=" Преимущества сотрудничества" class="partners-advantages__title" />
			<div class="partners-advantages__body row">
				<div class="partners-advantages__item">
					<h5 class="text-gradient text-uppercase fonts-oswald text-bold">1. Широкий спектр возможностей</h5>
					<div class="partners-advantages__item__content">
						<h6>Многоотраслевая экспертиза</h6>
						<p>Мы работаем в различных отраслях промышленности, включая строительство, металлургию, горнодобывающую, химическую и пищевую промышленность</p>
					</div>
					<div class="partners-advantages__item__content">
						<h6>Глобальное присутствие</h6>
						<p>Наши офисы и представительства в Китае и России, а также планируемое расширение в другие регионы, позволяют нам эффективно взаимодействовать с партнерами на международном уровне</p>
					</div>
				</div>
				<div class="partners-advantages__item">
					<h5 class="text-gradient text-uppercase fonts-oswald text-bold">2. Индивидуальный подход</h5>
					<div class="partners-advantages__item__content">
						<h6>Гибкость в сотрудничестве</h6>
						<p>Мы адаптируемся к потребностям каждого партнера, предлагая индивидуальные решения и условия</p>
					</div>
					<div class="partners-advantages__item__content">
						<h6>Совместное развитие проектов</h6>
						<p>Готовы рассматривать различные формы сотрудничества, включая совместные инвестиции, проекты "под ключ" и технологические партнерства</p>
					</div>
				</div>
				<div class="partners-advantages__item">
					<h5 class="text-gradient text-uppercase fonts-oswald text-bold">3. Надежность и качество</h5>
					<div class="partners-advantages__item__content">
						<h6>Высокие стандарты</h6>
						<p>Гарантируем качество продукции и услуг, соответствующее международным стандартам</p>
					</div>
					<div class="partners-advantages__item__content">
						<h6>Опыт и профессионализм</h6>
						<p>Наша команда состоит из экспертов с многолетним опытом в своей области</p>
					</div>
				</div>
				<div class="partners-advantages__item">
					<h5 class="text-gradient text-uppercase fonts-oswald text-bold">4. Инновации и технологии</h5>
					<div class="partners-advantages__item__content">
						<h6>Интеграция передовых технологий</h6>
						<p>Используем современные технологии, включая искусственный интеллект, для повышения эффективности и конкурентоспособности</p>
					</div>
					<div class="partners-advantages__item__content">
						<h6>Разработка новых решений</h6>
						<p>Совместная работа над инновационными проектами и внедрение новых технологий на рынке</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.partners-advantages {
		color: var(--white);
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

<script lang="ts" setup>
	const missionData = [
		{
			title: 'Инновации',
			text: 'Постоянное внедрение новых технологий и поиск лучших решений для наших клиентов',
		},
		{
			title: 'Качество',
			text: 'Высокие стандарты во всем, что мы делаем, от продукции до обслуживания',
		},
		{
			title: 'Надежность',
			text: 'Строительство долгосрочных и доверительных отношений с партнерами и клиентами',
		},
		{
			title: 'Ответственность',
			text: 'Этический подход к бизнесу, забота об обществе и окружающей среде',
		},
		{
			title: 'Командная работа',
			text: 'Создание благоприятной атмосферы для сотрудничества и профессионального роста каждого сотрудника',
		},
	]
</script>

<template>
	<div class="about-mission pt-8 pb-8 bg-white">
		<div class="container">
			<div class="about-mission__header">
				<h3 class="about-mission__header__title headline-1 text-gradient text-uppercase">Миссия и ценности</h3>
			</div>
			<div class="about-mission__body row no-wrap">
				<div class="about-mission__item info">
					<h5 class="fonts-oswald">Наша миссия</h5>
					<p>Мы стремимся быть лидером в предоставлении инновационных промышленных решений, способствуя развитию предприятий и повышению их конкурентоспособности на мировом рынке. Наша задача — обеспечить клиентов высококачественным оборудованием и передовыми технологиями, помогающими им достигать новых высот в бизнесе.</p>
				</div>
				<div class="about-mission__item">
					<h5 class="fonts-oswald">Наши ценности</h5>
					<div
						v-for="(item, index) in missionData"
						:key="index"
						class="about-mission__item__content"
					>
						<h6>{{ item.title }}</h6>
						<p>{{ item.text }}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.about-mission {
		&__header {
			margin-bottom: 64px;

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 40px;
			}
		}

		&__body {
			@media (max-width: $breakpoint-sm-min) {
				flex-wrap: wrap;
			}
		}

		&__item {
			&.info {
				min-width: 305px;
				width: 305px;
				margin-right: 24px;
			}
			&__content {
				margin-bottom: 16px;

				&:last-child {
					margin-bottom: 0;
				}
			}
			h5 {
				font-size: 1.56em;
				text-transform: uppercase;
				color: var(--red);
				margin-bottom: 32px;
				font-weight: 500;
			}
			h6 {
				font-size: 1.22em;
				font-weight: bold;
				margin-bottom: 4px;
			}

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 24px;

				&.info {
					min-width: auto;
					width: 100%;
					margin-right: 24px;
				}

				h5 {
					margin-bottom: 16px;
				}
			}
		}
	}


</style>

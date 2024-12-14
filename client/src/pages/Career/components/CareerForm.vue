<script lang="ts" setup>
	import VBtn from 'src/components/UI/VBtn/VBtn.vue';
</script>

<template>
	<div class="career-form">
		<div class="container">
			<div class="career-form__body row no-wrap">
				<div class="career-form__info pt-8 pb-8">
					<div class="career-form__info__header row items-center no-wrap">
						<h4 class="career-form__info__title headline-2 text-uppercase text-white">Как подать заявку?</h4>
						<div class="career-form__info__arrow row items-center no-wrap">
							<q-img src="icons/arrow-white.svg" width="25px" fit="contain" class="career-form__info__arrow__item" />
							<q-img src="icons/arrow-white.svg" width="25px" fit="contain" class="career-form__info__arrow__item" />
						</div>
					</div>
					<div class="career-form__info__text">
						<p class="fonts-oswald text-uppercase"> — Присоединяйтесь к команде SA International и станьте частью будущего промышленности и технологий!</p>
					</div>
				</div>
				<div class="career-form__form pb-8">
					<div class="career-form__form__header row items-center no-wrap justify-between">
						<h4 class="career-form__form__title headline-2">Онлайн форма</h4>
						<v-btn color="primary">
							<div class="row no-wrap">
								<span class="text-white">Заполнить анкету</span>
								<q-img src="icons/arrow-red.svg" fit="contain" class="q-ml-md" width="16px" />
							</div>
						</v-btn>
					</div>
					<div class="career-form__form__text">
						<p class="fonts-oswald">Или отправьте резюме и сопроводительное письмо на hr@inter-sa.com</p>
					</div>
					<p class="career-form__form__info fonts-oswald">Если у вас есть вопросы, свяжитесь с нашим отделом кадров по телефону +86-21-5432-2755 (ext. 814)</p>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.career-form {
		position: relative;

		@media (max-width: 1200px) {
			font-size: .8em;
		}

		@media (max-width: 870px) {
			font-size: 1em;
		}

		&::before {
			content: '';
			width: calc(50% - 40px);
			height: 100%;
			background-color: var(--red);
			position: absolute;
			top: 0;
			left: 0;
		}

		&::after {
			content: '';
			width: calc(50% - 40px);
			height: 100%;
			background-color: var(--white);
			position: absolute;
			top: 0;
			right: 0;
		}

		&__body {
			@media (max-width: 870px) {
				flex-wrap: wrap;
			}
		}

		&__info {
			background-color: var(--red);
			color: var(--white);
			min-width: calc(50% - 40px);
			width: calc(50% - 40px);
			padding-right: 17px;
			display: flex;
			flex-direction: column;
			justify-content: space-between;
			position: relative;

			&__title {
				margin-right: 40px;
			}

			&__arrow {
				&__item {
					margin-right: 10px;

					&:last-child {
						margin-right: 0;
					}
				}
			}

			&__text {
				max-width: 500px;
				font-size: 1.345em;

				p {
					line-height: 156%;
				}
			}

			@media (max-width: 870px) {
				width: 100%;

				&__header {
					margin-bottom: 40px;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				&__title {
					font-size: 2em;
					line-height: 140%;
				}

				&__text {
					font-size: 1.25em;
				}
			}
		}

		&__form {
			position: relative;
			background-color: var(--white);
			color: var(--dark-blue);
			z-index: 2;
			padding-left: 40px;
			padding-top: 60px;

			&__header {
				margin-bottom: 40px;
			}

			&__text {
				margin-bottom: 40px;
				font-size: 2em;
				line-height: 135%;
			}

			&__info {
				font-size: 1.22em;
				color: #616171;
			}

			@media (max-width: 870px) {
				margin: 0 -16px;
				padding: 0 16px;
				padding-top: 40px;
			}

			@media (max-width: $breakpoint-sm-min) {
				padding-bottom: 40px;

				&__header {
					flex-wrap: wrap;
					margin-bottom: 32px;
				}
				&__title {
					width: 100%;
					margin-bottom: 24px;
					font-size: 2em;
				}

				&__text {
					font-size: 2em;
					margin-bottom: 16px;
				}

				&__info {
					font-size: 1.25em;
				}
			}
		}

		@media (max-width: 870px) {
			&::after {
				display: none;
			}

			&::before {
				width: 100%;
			}
		}
	}
</style>

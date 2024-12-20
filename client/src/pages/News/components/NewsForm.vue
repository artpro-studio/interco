<script lang="ts" setup>
	import VInput from 'src/components/UI/VInput/VInput.vue';
	import VBtn from 'src/components/UI/VBtn/VBtn.vue';
	import { ref } from 'vue';
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();

	const form = ref({
		firstName: '',
		email: '',
	})
</script>

<template>
	<div class="clients-form pt-8 pb-8">
		<div class="container">
			<div class="clients-form__body row no-wrap">
				<div class="clients-form__column">
					<h4 class="clients-form__title text-uppercase fonts-oswald">{{ t('newsFormTitle') }}</h4>
					<div class="clients-form__info">
						<p>{{ t('newsFormDescription') }}</p>
					</div>
				</div>
				<div class="clients-form__content">
					<q-form class="clients-form__form">
						<div class="clients-form__form__field">
							<v-input v-model="form.firstName" color="white" :placeholder="t('newsFormFirstName')" />
						</div>
						<div class="clients-form__form__field">
							<v-input v-model="form.email" color="white" :placeholder="t('newsFormEmail')" />
						</div>
						<v-btn color="primary" class="clients-form__form__btn">
							<div class="row no-wrap items-center">
								<span>{{ t('newsFormBtnText') }}</span>
								<q-img src="icons/arrow-red.svg" width="16px" class="q-ml-md" />
							</div>
						</v-btn>
					</q-form>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.clients-form {

		@media (max-width: $breakpoint-sm-min) {
			background-size: 200px;
			padding-bottom: 0;
		}

		&__body {
			justify-content: space-between;
			@media (max-width: 850px) {
				flex-wrap: wrap;
			}
		}

		&__title {
			font-size: 2.1em;
			line-height: 140%;
			font-weight: bold;
			@media (max-width: 850px) {
				margin-bottom: 24px;
			}
			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 24px;
				font-size: 2em;
			}
		}

		&__column {
			display: flex;
			flex-direction: column;
			justify-content: space-between;
			max-width: 580px;

			@media (max-width: 850px) {
				margin-bottom: 40px;
			}
		}

		&__content {
			background-color: var(--red);
			padding: 40px;
			border-radius: 10px;
			max-width: 660px;
			color: var(--white);
			width: 100%;

			@media (max-width: $breakpoint-md-min) {
				max-width: 500px;
			}

			@media (max-width: 850px) {
				max-width: none;
				position: relative;
				min-width: calc(100% + 32px);
				border-radius: 0px;
				margin-left: -16px;
			}

			@media (max-width: $breakpoint-sm-min) {
				padding: 40px 15px;

				&__title {
					font-size: 2em;
					line-height: 140%;
				}
			}
		}

		&__form {
			&__body {
				width: 100%;
				margin-bottom: 16px !important;

				@media (max-width: $breakpoint-sm-min) {
					flex-wrap: wrap;
					margin: 0;
				}
			}

			&__field {
				width: 100%;
				margin-bottom: 24px;

				@media (max-width: $breakpoint-sm-min) {
					margin: 0;
					margin-bottom: 16px !important;
				}
			}

			&__comment {
				margin-top: 78px;
			}

			&__btn {
				margin-top: 64px;
				@media (max-width: $breakpoint-sm-min) {
					margin-top: 32px;
				}
			}
		}

		&__info {
			p {
				color: rgba(136, 136, 145, 1);
				font-weight: 500;
				font-size: 1.22em;
				font-weight: bold;
				line-height: 135%;
				letter-spacing: 1px;
			}

			&__links {
				margin-top: 40px;

				&__item {
					margin-bottom: 8px;

					&:last-child {
						margin-bottom: 0;
					}

					a {
						text-decoration: none;
						transition: .4s all;
						font-family: 'Oswald', sans-serif;
						font-size: 1.8em;

						&:hover {
							color: var(--red);
						}
					}
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				p {
					font-size: 1.15em;
				}

				&__links {
					margin-top: 32px;
				}
			}
		}
	}
</style>

<script lang="ts" setup>
	import VInput from 'src/components/UI/VInput/VInput.vue';
	import VInputText from 'src/components/UI/VInputText/VInputText.vue';
	import VBtn from 'src/components/UI/VBtn/VBtn.vue';
	import { ref } from 'vue';
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();

	const form = ref({
		firstName: '',
		email: '',
		company: '',
		phone: '',
		comment: '',
	})
</script>

<template>
	<div class="clients-form pt-8 pb-8 bg-white">
		<div class="container">
			<div class="clients-form__body row no-wrap items-center">
				<div data-aos="fade-right" class="clients-form__column">
					<h4 class="clients-form__title text-uppercase fonts-oswald">{{ t('serviceFormTitle') }}</h4>
					<div class="clients-form__info">
						<p>{{ t('serviceFormDescription') }}</p>
						<div class="clients-form__info__text">
							<p>{{ t('serviceFormInfo') }}</p>
						</div>
					</div>
				</div>
				<div data-aos="fade-left" class="clients-form__content">
					<q-form class="clients-form__form">
						<div class="clients-form__form__body row no-wrap q-gutter-md">
							<div class="clients-form__form__field">
								<v-input v-model="form.firstName" color="white" :placeholder="t('partnersFormFirstName')" />
							</div>
							<div class="clients-form__form__field">
								<v-input v-model="form.email" color="white" :placeholder="t('partnersFormEmail')" />
							</div>
						</div>
						<div class="clients-form__form__body row no-wrap q-gutter-md">
							<div class="clients-form__form__field">
								<v-input v-model="form.company" color="white" :placeholder="t('partnersFormCompany')" />
							</div>
							<div class="clients-form__form__field">
								<v-input v-model="form.phone" color="white" :placeholder="t('partnersFormPhone')" />
							</div>
						</div>
						<v-input-text v-model="form.comment" color="white" :rows="1" class="clients-form__form__comment" :placeholder="t('partnersFormComment')" />
						<v-btn color="primary" class="clients-form__form__btn">
							<div class="row no-wrap items-center">
								<span>{{t('partnersFormSubmit')}}</span>
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
		background-image: url('/icons/mail-bg.svg');
		background-position: top left;
		background-size: 300px;
		background-repeat: no-repeat;
		background-color: #fff;

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
			margin-bottom: 56px;

			@media (max-width: 850px) {
				margin-bottom: 24px;
			}
			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 24px;
				font-size: 2em;
			}
		}

		&__column {
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
			margin-top: 24px;

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

				@media (max-width: $breakpoint-sm-min) {
					margin: 0;
					margin-bottom: 16px !important;
				}
			}

			&__comment {
				margin-top: 78px;
			}

			&__btn {
				margin-top: 24px;
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

			&__text {
				margin-top: 16px;
				p {
					color: var(--red);
					font-size: .9em;
					font-weight: normal;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				p {
					font-size: 1.15em;
				}

				&__text {
					p {
						font-size: .9em;
					}
				}
			}
		}
	}
</style>

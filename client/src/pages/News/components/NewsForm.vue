<script lang="ts" setup>
	import VInput from 'src/components/UI/VInput/VInput.vue';
	import VBtn from 'src/components/UI/VBtn/VBtn.vue';
	import ModalSuccess from 'src/components/Modal/ModalSuccess.vue';
	import { ref } from 'vue';
	import { useI18n } from 'vue-i18n';
	import useValidationRules from 'src/helpers/useValidationRules';
	import { QForm, Notify } from 'quasar';
	import {
		getApiClientInitialParams,
		ILangSubscription,
		PublicSubscriptionControllerClient,
		SubscriptionDto,
	} from 'src/ApiClient/ApiClient';

	const { t, locale } = useI18n();
	const { isRequired, isRequiredEmail } = useValidationRules();

	const isSuccess = ref(false);
	const formRef = ref<QForm | null>(null);
	const form = ref<SubscriptionDto>({
		name: '',
		email: '',
		lang: locale.value as ILangSubscription,
	});

	const onCloseSuccess = () => {
		isSuccess.value = false;
		form.value.name = '';
		form.value.email = '';
	};

	const onChange = () => {
		formRef.value?.validate().then(async (success) => {
			if (success) {
				const result = await new PublicSubscriptionControllerClient(getApiClientInitialParams()).create({
					...form.value,
					lang: locale.value as ILangSubscription,
				});

				if (result.isSuccess) {
					isSuccess.value = true;
				} else {
					Notify.create({
						color: 'negative',
						textColor: 'white',
						icon: 'warning',
						message: t('modalSubscriptionError'),
					});
				}
			}
		});
	};
</script>

<template>
	<div class="clients-form pt-8 pb-8">
		<div class="container">
			<div class="clients-form__body row no-wrap">
				<div data-aos="fade-right" class="clients-form__column">
					<h4 class="clients-form__title text-uppercase fonts-oswald">{{ t('newsFormTitle') }}</h4>
					<div class="clients-form__info">
						<p>{{ t('newsFormDescription') }}</p>
					</div>
				</div>
				<div data-aos="fade-left" class="clients-form__content">
					<q-form ref="formRef" class="clients-form__form" @submit="onChange">
						<div class="clients-form__form__field">
							<v-input v-model="form.name" color="white" :placeholder="t('newsFormFirstName')" lazy-rules :rules="[isRequired]" />
						</div>
						<div class="clients-form__form__field">
							<v-input
								v-model="form.email"
								color="white"
								:placeholder="t('newsFormEmail')"
								lazy-rules
								:rules="[isRequiredEmail]"
							/>
						</div>
						<v-btn type="submit" color="primary" class="clients-form__form__btn">
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
	<q-dialog v-model="isSuccess" @hide="onCloseSuccess">
		<modal-success :title="t('modalSubscriptionTitle')" :text="t('modalSubscriptionText')" @on-close="onCloseSuccess" />
	</q-dialog>
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
				margin-bottom: 10px;

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
						transition: 0.4s all;
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

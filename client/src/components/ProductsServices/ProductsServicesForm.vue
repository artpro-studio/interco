<script lang="ts" setup>
	import VInput from 'src/components/UI/VInput/VInput.vue';
	import VInputText from 'src/components/UI/VInputText/VInputText.vue';
	import VBtn from 'src/components/UI/VBtn/VBtn.vue';
	import ModalSuccess from 'src/components/Modal/ModalSuccess.vue';
	import { ref } from 'vue';
	import { useI18n } from 'vue-i18n';
	import useValidationRules from 'src/helpers/useValidationRules';
	import { QForm } from 'quasar';
	import { PublicCallbackControllerClient, getApiClientInitialParams } from 'src/ApiClient/ApiClient';
	import useMaskPhone from 'src/helpers/useMaskPhone';

	const { t } = useI18n();
	const { isRequired, isRequiredEmail } = useValidationRules();
	const maskPhone = useMaskPhone();

	const SLUG_FORM = 'application';
	const isSuccess = ref(false);
	const formRef = ref<QForm | null>(null);
	const form = ref({
		name: '',
		email: '',
		company: '',
		phone: '',
		comments: '',
	});

	const onCloseSuccess = () => {
		isSuccess.value = false;
		form.value.phone = '';
		form.value.name = '';
		form.value.email = '';
		form.value.comments = '';
		form.value.company = '';
	};

	const onChange = () => {
		formRef.value?.validate().then(async (success) => {
			if (success) {
				const result = await new PublicCallbackControllerClient(getApiClientInitialParams()).create({
					slug: SLUG_FORM,
					data: form.value,
				});

				if (result.isSuccess) {
					isSuccess.value = true;
				}
			}
		});
	};
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
					<q-form ref="formRef" class="clients-form__form" @submit="onChange">
						<div class="clients-form__form__body row no-wrap q-gutter-md">
							<div class="clients-form__form__field">
								<v-input
									v-model="form.name"
									color="white"
									:placeholder="t('partnersFormFirstName')"
									lazy-rules
									:rules="[isRequired]"
								/>
							</div>
							<div class="clients-form__form__field">
								<v-input
									v-model="form.email"
									color="white"
									:placeholder="t('partnersFormEmail')"
									lazy-rules
									:rules="[isRequiredEmail]"
								/>
							</div>
						</div>
						<div class="clients-form__form__body row no-wrap q-gutter-md">
							<div class="clients-form__form__field">
								<v-input
									v-model="form.company"
									color="white"
									:placeholder="t('partnersFormCompany')"
									lazy-rules
									:rules="[isRequired]"
								/>
							</div>
							<div class="clients-form__form__field">
								<v-input
									v-model="form.phone"
									color="white"
									:placeholder="t('partnersFormPhone')"
									lazy-rules
									:rules="[isRequired]"
									:mask="maskPhone"
								/>
							</div>
						</div>
						<v-input-text
							v-model="form.comments"
							color="white"
							:rows="1"
							class="clients-form__form__comment"
							:placeholder="t('partnersFormComment')"
						/>
						<v-btn type="submit" color="primary" class="clients-form__form__btn">
							<div class="row no-wrap items-center">
								<span>{{ t('partnersFormSubmit') }}</span>
								<q-img src="icons/arrow-red.svg" width="16px" class="q-ml-md" />
							</div>
						</v-btn>
					</q-form>
				</div>
			</div>
		</div>
	</div>
	<q-dialog v-model="isSuccess" @hide="onCloseSuccess">
		<modal-success @on-close="onCloseSuccess" />
	</q-dialog>
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
					font-size: 0.9em;
					font-weight: normal;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				p {
					font-size: 1.15em;
				}

				&__text {
					p {
						font-size: 0.9em;
					}
				}
			}
		}
	}
</style>

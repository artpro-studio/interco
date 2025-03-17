<script lang="ts" setup>
	import { PublicCallbackControllerClient, getApiClientInitialParams } from 'src/ApiClient/ApiClient';
	import SectionTitle from 'src/components/SectionTitle/SectionTitle.vue';
	import VInput from 'src/components/UI/VInput/VInput.vue';
	import VTextArea from '../UI/VTextArea/VTextArea.vue';
	import VBtn from 'src/components/UI/VBtn/VBtn.vue';
	import ModalSuccess from './ModalSuccess.vue';
	import Captcha from 'src/components/Captcha/Captcha.vue';
	import { ref } from 'vue';
	import { useI18n } from 'vue-i18n';
	import { QForm, Notify } from 'quasar';
	import useValidationRules from 'src/helpers/useValidationRules';
	import useMaskPhone from 'src/helpers/useMaskPhone';

	const emit = defineEmits(['on-close']);
	const { t } = useI18n();
	const { isRequired, isRequiredEmail } = useValidationRules();
	const maskPhone = useMaskPhone();

	const SLUG_FORM: string = 'application';
	const isChecked = ref(true);
	const captchaRef = ref<any>(null);
	const formRef = ref<QForm | null>(null);
	const form = ref({
		title: 'Запрос в техническую поддержку',
		name: '',
		email: '',
		phone: '',
		comments: '',
		company: '',
	});
	const isSuccess = ref(false);

	const onCloseSuccess = () => {
		isSuccess.value = false;
		emit('on-close');
	};

	const onChange = async () => {
		const token = captchaRef.value?.token;
		if (!token) {
			Notify.create({
				color: 'negative',
				textColor: 'white',
				icon: 'warning',
				message: t('formCaptchaText'),
			});
			return;
		}
		formRef.value!.validate().then(async (success: boolean) => {
			if (!isChecked.value) {
				Notify.create({
					color: 'negative',
					textColor: 'white',
					icon: 'warning',
					message: t('fromValidateChecked'),
				});
				return;
			}
			if (success) {
				const result = await new PublicCallbackControllerClient(getApiClientInitialParams()).create({
					slug: SLUG_FORM,
					token: token,
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
	<div class="modal-callback">
		<q-btn class="modal-callback__close" @click="emit('on-close')" flat><q-icon name="close" /></q-btn>
		<div class="container">
			<section-title
				:title="t('formCallbackTitle')"
				color-text="black"
				class="modal-callback__title"
				style="margin-bottom: 30px"
			/>
			<div class="modal-callback__description">
				<p>{{ t('formCallbackText') }}</p>
			</div>
			<div class="modal-callback__body">
				<q-form ref="formRef" class="modal-callback__form" @submit="onChange">
					<div class="modal-callback__form__columns row no-wrap">
						<div class="modal-callback__form__column">
							<div class="modal-callback__form__field">
								<v-input v-model="form.name" color="gray" :placeholder="t('firstName')" lazy-rules :rules="[isRequired]" />
							</div>
							<div class="modal-callback__form__field">
								<v-input v-model="form.email" color="gray" :placeholder="t('formEmail')" lazy-rules :rules="[isRequiredEmail]" />
							</div>
							<div class="modal-callback__form__field">
								<v-input
									v-model="form.phone"
									color="gray"
									:placeholder="t('phone')"
									:mask="maskPhone"
									lazy-rules
									:rules="[isRequired]"
								/>
							</div>
							<div class="modal-callback__form__field">
								<v-input v-model="form.company" color="gray" :placeholder="t('formCompany')" />
							</div>
						</div>
						<div class="modal-callback__form__column">
							<v-text-area v-model="form.comments" :placeholder="t('formMessage')" color="gray" :rows="7" />
						</div>
					</div>
					<captcha ref="captchaRef" id="modal_callback_turnstile" />
					<div class="modal-callback__form__bottom row no-wrap justify-between items-center">
						<div class="modal-callback__form__bottom__left">
							<q-checkbox v-model="isChecked" class="modal-callback__form__checked" :label="t('formPolicy')" />
						</div>
						<v-btn type="submit" color="primary" class="modal-callback__form__bottom__btn">
							<div class="row no-wrap items-center">
								<span>{{ t('formBtn') }}</span>
								<q-img src="icons/arrow-red.svg" width="16px" class="q-ml-md" />
							</div>
						</v-btn>
					</div>
				</q-form>
			</div>
		</div>
	</div>
	<q-dialog v-model="isSuccess" @hide="onCloseSuccess">
		<modal-success @on-close="onCloseSuccess" />
	</q-dialog>
</template>

<style lang="scss">
	.modal-callback {
		.q-checkbox__label {
			padding-top: 15px;
			padding-left: 5px;
		}
	}
</style>
<style lang="scss" scoped>
	.modal-callback {
		padding: 80px;
		background-color: #f5f5f5;
		min-width: 1280px;
		border-radius: 10px;
		position: relative;

		@media (max-width: 1280px) {
			width: 100%;
			min-width: 100%;
		}

		@media (max-width: 900px) {
			padding: 60px 40px;
		}

		@media (max-width: 800px) {
			padding: 40px 20px;
		}

		&__close {
			position: absolute;
			top: 40px;
			right: 40px;

			@media (max-width: 900px) {
				top: 20px;
				right: 20px;
			}

			@media (max-width: 800px) {
				top: 15px;
				right: 15px;
			}
		}

		&__description {
			max-width: 750px;
			margin-bottom: 64px;

			p {
				color: var(--gray-secondary);
				font-size: 1.22em;
				letter-spacing: 1px;
				line-height: 135%;
				font-weight: bold;
			}

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 32px;
			}
		}

		&__body {
			padding-left: 0px;

			@media (max-width: $breakpoint-md-min) {
				padding-left: 0;
			}
		}

		&__form {
			&__columns {
				width: 100%;

				@media (max-width: 800px) {
					flex-wrap: wrap;
				}
			}
			&__column {
				width: 50%;
				margin-right: 64px;

				&:last-child {
					margin-right: 0;
				}

				@media (max-width: 800px) {
					width: 100%;
					margin-right: 0;
					margin-bottom: 19px;

					&:last-child {
						margin-bottom: 0;
					}
				}
			}

			&__field {
				margin-bottom: 0px;

				&.not-validate {
					margin-bottom: 24px;
				}

				&:last-child {
					margin-bottom: 0;
				}

				&__label {
					color: #888891;
					border-bottom: 1px #e3e3e3 solid;
					padding-top: 14px;
					padding-bottom: 14px;

					&__icon {
						background-color: #dadada;
						width: 24px;
						height: 24px;
						display: flex;
						align-items: center;
						justify-content: center;
						border-radius: 50%;
						margin-left: 8px;
					}
				}
			}

			&__checked {
				max-width: 480px;
				margin-top: 8px;
				font-size: 0.9em;
			}

			&__file {
				input {
					display: none;
				}
				&__content {
					cursor: pointer;
					span {
						margin-left: 8px;
						font-size: 0.9em;
						letter-spacing: 1px;
						transition: 0.4s all;
					}

					svg {
						path {
							transition: 0.4s all;
						}
					}

					&:hover {
						span {
							color: var(--red);
						}
						svg {
							path {
								fill: var(--red);
							}
						}
					}
				}
			}

			&__bottom {
				margin-top: 40px;

				&__left {
					padding-right: 10px;
				}

				&__btn {
					min-width: 216px;
				}

				@media (max-width: 800px) {
					flex-wrap: wrap;

					&__left {
						margin-bottom: 16px;
					}

					&__btn {
						min-width: 100%;
						margin-top: 20px;
					}
				}
			}
		}
	}
</style>

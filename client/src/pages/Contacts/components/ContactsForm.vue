<script lang="ts" setup>
	import SectionTitle from 'src/components/SectionTitle/SectionTitle.vue';
	import VInput from 'src/components/UI/VInput/VInput.vue';
	import VInputText from 'src/components/UI/VInputText/VInputText.vue';
	import VBtn from 'src/components/UI/VBtn/VBtn.vue';
	import { Notify, QForm } from 'quasar';
	import { ref } from 'vue';
	import { useI18n } from 'vue-i18n';
	import useValidationRules from 'src/helpers/useValidationRules';
	import useMaskPhone from 'src/helpers/useMaskPhone';
	import { PublicCallbackControllerClient } from 'src/ApiClient/ApiClient';
	import { getApiClientInitialParams } from 'src/ApiClient/BaseApiClient';

	const { t } = useI18n();
	const { isRequired, isRequiredEmail } = useValidationRules();
	const maskPhone = useMaskPhone();

	const SLUG_FORM: string = 'application';
	const isChecked = ref(false);
	const formRef = ref<QForm | null>(null);
	const form = ref({
		title: 'Запрос в техническую поддержку',
		lastName: '',
		name: '',
		secondName: '',
		email: '',
		phone: '',
		delivary: '',
		comments: '',
	});
	const isSuccess = ref(false);

	const onCloseSuccess = () => {
		isSuccess.value = false;
	};

	const onChange = async () => {
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
	<div class="contacts-form pt-8 pb-8">
		<div class="container">
			<section-title
				:title="t('contactsFormTitle')"
				color-text="black"
				class="contacts-form__title"
				style="margin-bottom: 40px"
			/>
			<div data-aos="fade-up" class="contacts-form__description">
				<p>{{ t('contactsFormDescription') }}</p>
			</div>
			<div data-aos="fade-up" class="contacts-form__body">
				<q-form ref="formRef" class="contacts-form__form" @submit="onChange">
					<div class="contacts-form__form__columns row no-wrap">
						<div class="contacts-form__form__column">
							<div class="contacts-form__form__field">
								<v-input
									v-model="form.name"
									color="gray"
									:placeholder="t('contactsFormFistName')"
									lazy-rules
									:rules="[isRequired]"
								/>
							</div>
							<div class="contacts-form__form__field">
								<v-input
									v-model="form.email"
									color="gray"
									:placeholder="t('contactsFormEmail')"
									lazy-rules
									:rules="[isRequiredEmail]"
								/>
							</div>
							<div class="contacts-form__form__field">
								<v-input
									v-model="form.phone"
									color="gray"
									:mask="maskPhone"
									:placeholder="t('contactsFormPhone')"
									lazy-rules
									:rules="[isRequired]"
								/>
							</div>
						</div>
						<div class="contacts-form__form__column">
							<v-input-text v-model="form.comments" color="gray" :placeholder="t('contactsFormMessage')" :rows="10" />
						</div>
					</div>
					<div class="contacts-form__form__bottom row no-wrap justify-between items-center">
						<div class="contacts-form__form__bottom__left">
							<q-checkbox v-model="isChecked" class="contacts-form__form__checked" :label="t('contactsFormConfirm')" />
						</div>
						<v-btn type="sumbti" color="primary" class="contacts-form__form__bottom__btn">
							<div class="row no-wrap items-center">
								<span>{{ t('contactsFormBtnText') }}</span>
								<q-img src="icons/arrow-red.svg" width="16px" class="q-ml-md" />
							</div>
						</v-btn>
					</div>
				</q-form>
			</div>
		</div>
	</div>
</template>

<style lang="scss">
	.contacts-form {
		.q-checkbox__label {
			padding-top: 15px;
			padding-left: 5px;
		}
	}
</style>
<style lang="scss" scoped>
	.contacts-form {
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
			padding-left: 40px;

			@media (max-width: $breakpoint-md-min) {
				padding-left: 0;
			}
		}

		&__form {
			&__columns {
				width: 100%;

				@media (max-width: $breakpoint-sm-min) {
					flex-wrap: wrap;
				}
			}
			&__column {
				width: 50%;
				margin-right: 64px;

				&:last-child {
					margin-right: 0;
				}

				@media (max-width: $breakpoint-sm-min) {
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
				&:last-child {
					margin-bottom: 0;
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

				&__btn {
					min-width: 322px;
				}

				@media (max-width: $breakpoint-sm-min) {
					flex-wrap: wrap;

					&__left {
						margin-bottom: 16px;
					}
				}
			}
		}
	}
</style>

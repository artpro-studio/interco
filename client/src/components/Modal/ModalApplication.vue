<script lang="ts" setup>
	import SectionTitle from 'src/components/SectionTitle/SectionTitle.vue';
	import VInput from 'src/components/UI/VInput/VInput.vue';
	import VInputText from 'src/components/UI/VInputText/VInputText.vue';
	import VBtn from 'src/components/UI/VBtn/VBtn.vue';
	import { ref } from 'vue';

	const emit = defineEmits(['on-close'])

	const isChecked = ref(false);
	const form = ref({
		firstName: '',
		email: '',
		phone: '',
		message: '',
	})
</script>

<template>
	<div class="modal-application">
		<q-btn class="modal-application__close" @click="emit('on-close')" flat><q-icon name="close" /></q-btn>
		<div class="container">
			<section-title title="Заявка" color-text="black" class="modal-application__title" style="margin-bottom: 40px;" />
			<div class="modal-application__body">
				<q-form class="modal-application__form">
					<div class="modal-application__form__columns row no-wrap">
						<div class="modal-application__form__column">
							<div class="modal-application__form__field">
								<v-input
									v-model="form.firstName"
									color="gray"
									placeholder="Ваше имя"
								/>
							</div>
							<div class="modal-application__form__field">
								<v-input
									v-model="form.email"
									color="gray"
									placeholder="Ваш e-mail"
								/>
							</div>
							<div class="modal-application__form__field">
								<v-input
									v-model="form.phone"
									color="gray"
									placeholder="Номер телефона"
								/>
							</div>
						</div>
						<div class="modal-application__form__column">
							<v-input-text
								v-model="form.message"
								color="gray"
								placeholder="Сообщение"
								:rows="10"
							/>
						</div>
					</div>
					<div class="modal-application__form__bottom row no-wrap justify-between items-center">
						<div class="modal-application__form__bottom__left">
							<div class="modal-application__form__file">
								<input type="file" id="file" class="desctop-hide">
								<label for="file" class="modal-application__form__file__content row no-wrap items-center">
									<svg width="16" height="17" viewBox="0 0 16 17" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M7.69596 1.18172C8.05779 0.810655 8.48969 0.515131 8.96662 0.312289C9.44355 0.109447 9.95601 0.00332414 10.4743 7.68507e-05C10.9925 -0.00317044 11.5063 0.0965223 11.9857 0.293372C12.4651 0.490222 12.9007 0.78031 13.2672 1.14681C13.6336 1.51331 13.9236 1.94892 14.1204 2.42838C14.3172 2.90784 14.4168 3.42161 14.4135 3.93987C14.4102 4.45813 14.304 4.97057 14.1011 5.44747C13.8982 5.92437 13.6026 6.35623 13.2315 6.71801L7.14241 12.8078C6.92498 13.0289 6.66593 13.2047 6.38021 13.3252C6.09449 13.4456 5.78775 13.5083 5.47769 13.5096C5.16762 13.5109 4.86037 13.4508 4.57365 13.3327C4.28693 13.2147 4.02642 13.041 3.80714 12.8218C3.58786 12.6026 3.41416 12.3421 3.29605 12.0554C3.17794 11.7687 3.11777 11.4615 3.11899 11.1514C3.12022 10.8414 3.18282 10.5346 3.30319 10.2489C3.42357 9.96311 3.59932 9.70402 3.82033 9.48654L9.91016 3.3967L11.0173 4.5038L4.92743 10.5936C4.85265 10.6659 4.793 10.7523 4.75196 10.8478C4.71093 10.9433 4.68933 11.046 4.68843 11.15C4.68752 11.254 4.70733 11.3571 4.7467 11.4533C4.78607 11.5495 4.84421 11.6369 4.91772 11.7104C4.99124 11.784 5.07865 11.8421 5.17488 11.8815C5.2711 11.9208 5.3742 11.9406 5.47816 11.9397C5.58212 11.9388 5.68486 11.9172 5.78038 11.8762C5.87591 11.8352 5.9623 11.7755 6.03453 11.7007L12.1251 5.6109C12.3433 5.39277 12.5163 5.13381 12.6344 4.84881C12.7524 4.56381 12.8132 4.25834 12.8132 3.94986C12.8132 3.64138 12.7524 3.33591 12.6344 3.05091C12.5163 2.76591 12.3433 2.50695 12.1251 2.28882C11.907 2.07069 11.6481 1.89766 11.3631 1.7796C11.0781 1.66155 10.7726 1.60079 10.4641 1.60079C10.1556 1.60079 9.85016 1.66155 9.56515 1.7796C9.28015 1.89766 9.02119 2.07069 8.80306 2.28882L2.71322 8.37944C2.00011 9.11778 1.60553 10.1067 1.61445 11.1331C1.62337 12.1595 2.03508 13.1414 2.76091 13.8673C3.48674 14.5931 4.46862 15.0048 5.49506 15.0137C6.52151 15.0226 7.51039 14.6281 8.24873 13.9149L14.8929 7.27156L16 8.37944L9.35661 15.0228C8.32873 16.0507 6.93462 16.6282 5.48098 16.6282C4.02733 16.6282 2.63322 16.0507 1.60534 15.0228C0.577458 13.9949 1.08305e-08 12.6008 0 11.1472C-1.08305e-08 9.69355 0.577458 8.29944 1.60534 7.27156L7.69596 1.18172Z" fill="#888891"/>
									</svg>
									<span>Прикрепить файл</span>
								</label>
							</div>
							<q-checkbox
								v-model="isChecked"
								class="modal-application__form__checked"
								label="Даю согласие на обработку персональных данных, согласно политике конфиденциальности"
							/>
						</div>
						<v-btn color="primary" class="modal-application__form__bottom__btn">
							<div class="row no-wrap items-center">
								<span>Отправить</span>
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
	.modal-application{
		.q-checkbox__label {
			padding-top: 15px;
			padding-left: 5px;
		}
	}
</style>
<style lang="scss" scoped>
	.modal-application {
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
			padding-left: 40px;

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
				margin-bottom: 19px;
				&:last-child {
					margin-bottom: 0;
				}
			}

			&__checked {
				max-width: 480px;
				margin-top: 8px;
				font-size: .9em;
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
						transition: .4s all;
					}

					svg {
						path {
							transition: .4s all;
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
					min-width: 322px;
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

<script lang="ts" setup>
	import { ref } from 'vue';
	import VTextArea from 'src/components/UI/VTextArea/VTextArea.vue';
	import VInput from 'src/components/UI/VInput/VInput.vue';
	import VBtn from 'src/components/UI/VBtn/VBtn.vue'
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();

	const form = ref({
		comments: '',
		firstName: '',
		email: '',
		phone: ''
	})
</script>

<template>
	<div class="home-form">
		<div class="container">
			<div class="home-form__body row no-wrap">
				<div class="home-form__left pt-8 pb-12">
					<div class="home-form__left__header row no-wrap items-center">
						<h4 class="home-form__left__header__title headline-1 text-white text-uppercase">{{ t('homeFormTitle') }}</h4>
						<div class="home-form__left__header__arrows row no-wrap items-center">
							<q-img src="icons/arrow-white.svg" class="home-form__left__header__arrows__item" width="26px" />
							<q-img src="icons/arrow-white.svg" class="home-form__left__header__arrows__item" width="26px" />
						</div>
					</div>
					<div class="home-form__left__fields">
						<v-text-area
							v-model="form.comments"
							:placeholder="t('homeFormComment')"
						/>
					</div>
					<div class="home-form__social">
						<h5 class="home-form__social__title fonts-oswald text-white">{{ t('homeFormSocial') }}</h5>
						<div class="home-form__social__body">
							<a href="/" class="home-form__social__item">
								<q-img src="icons/whatsapp.svg" class="home-form__social__item__img" width="40px" />
							</a>
							<a href="/" class="home-form__social__item">
								<q-img src="icons/discord.svg" class="home-form__social__item__img" width="40px" />
							</a>
							<a href="/" class="home-form__social__item">
								<q-img src="icons/telegram.svg" class="home-form__social__item__img" width="40px" />
							</a>
						</div>
					</div>
				</div>
				<div class="home-form__right pt-8 pb-12">
					<div class="home-form__right__header">
						<h4 class="home-form__right__header__title headline-2 text-dark">{{ t('homeFormSubTitle') }}</h4>
						<p class="fonts-oswald">{{ t('homeFormSubText') }}</p>
					</div>
					<q-form class="home-form__right__form">
						<div class="home-form__right__form__field">
							<v-input
								v-model="form.firstName"
								:placeholder="t('homeFormFirstName')"
							/>
						</div>
						<div class="home-form__right__form__field">
							<v-input
								v-model="form.email"
								:placeholder="t('homeFormEmail')"
							/>
						</div>
						<div class="home-form__right__form__field">
							<v-input
								v-model="form.phone"
								:placeholder="t('homeFormPhone')"
							/>
						</div>
						<v-btn color="primary" class="home-form__right__form__btn">
							<div class="row no-wrap items-center">
								<span>{{ t('submitApplication') }}</span>
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
	.home-form {
		position: relative;
		&::before {
			content: '';
			width: 50%;
			height: 100%;
			position: absolute;
			top: 0;
			left: 0;
			background-color: var(--red);
		}
		&::after {
			content: '';
			width: 50%;
			height: 100%;
			position: absolute;
			top: 0;
			right: 0;
			background-color: var(--white);
		}

		@media (max-width: 850px) {
			&::before {
				width: 100%;
			}
			&:after {
				display: none;
			}
		}

		&__body {
			@media (max-width: 850px) {
				flex-wrap: wrap;
			}
		}

		&__left {
			background-color: var(--red);
			position: relative;
			width: 50%;
			padding-right: 60px;

			&__header {
				margin-bottom: 40px;

				&__title {
					margin-right: 40px;

					@media (max-width: 1200px) {
						font-size: 2.5em;
					}

					@media (max-width: $breakpoint-md-min) {
						margin-right: 20px;
						font-size: 2em;
					}
				}

				&__arrows {
					&__item {
						margin-right: 10px;

						&:last-child {
							margin-right: 0;
						}

						@media (max-width: $breakpoint-md-min) {
							width: 20px !important;
						}
					}
				}
			}

			&__fields {
				padding-top: 136px;
				margin-bottom: 108px;
				width: 100%;

			}

			@media (max-width: 850px) {
				width: 100%;
				padding-right: 0;

				&__fields {
					padding-top: 0px;
					margin-bottom: 40px;
				}
			}
		}

		&__social {
			&__title {
				margin-bottom: 32px;
				font-size: 1.55em;

				@media (max-width: $breakpoint-md-min) {
					font-size: 1.5em;
				}
			}

			&__item {
				margin: 0 12px;

				&__img {
					transition: .4s all;

					@media (max-width: $breakpoint-sm-min) {
						width: 28px !important;
					}
				}

				&:hover {
					.home-form__social__item__img {
						transform: scale(1.2);
					}
				}
			}
		}

		&__right {
			position: relative;
			z-index: 2;
			background-color: var(--white);
			width: 50%;
			padding-left: 40px;

			&__header {
				padding-top: 10px;
				&__title {
					margin-bottom: 40px;
				}

				p {
					color: #616171;
					font-size: 1.775em;
					line-height: 135%;
				}
			}

			&__form {
				margin-top: 74px;

				&__field {
					margin-bottom: 40px;

					&:last-child {
						margin-bottom: 0;
					}
				}

				&__btn {
					margin-top: 74px;
				}
			}

			@media (max-width: 850px) {
				margin: 0 -16px;
				width: calc(100% + 32px);
				padding: 40px 16px;

				&__header {
					&__title {
						font-size: 2em;
						line-height: 140%;
						margin-bottom: 24px;
					}
					p {
						font-size: 1.5em;
					}
				}

				&__form {
					margin-top: 32px;
					text-align: center;

					&__field {
						margin-bottom: 40px;
					}

					&__btn {
						margin-top: 40px;
					}
				}
			}
		}
	}
</style>

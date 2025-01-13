<script lang="ts" setup>
	import VBtnRed from 'src/components/UI/VBtnRed/VBtnRed.vue';
	import ModalApplication from 'src/components/Modal/ModalApplication.vue';
	import { ref } from 'vue';
	import { useI18n } from 'vue-i18n';

	const {t} = useI18n();

	const isOpenDialog = ref(false);
</script>
<template>
	<div class="clients-banner pb-8">
		<div class="container">
			<div class="clients-banner__body">
				<div class="clients-banner__wrapper">
					<div class="clients-banner__header row no-wrap justify-between items-center">
						<h4 class="clients-banner__header__title text-white text-uppercase">{{ t('clientSupportBannerTitle') }}</h4>
						<v-btn-red class="clients-banner__header__btn" style="width: 250px;" :text="t('clientSupportBannerBtnText')" @on-click="isOpenDialog = true"></v-btn-red>
					</div>
					<div class="clients-banner__content">
						<h5>{{ t('clientSupportBannerItem1Title') }}</h5>
						<p>{{ t('clientSupportBannerItem1Text') }}</p>
					</div>
					<div class="clients-banner__items row no-wrap justify-between items-start">
						<div class="clients-banner__items__item">
							<h6>{{ t('clientSupportBannerItem2Title') }}</h6>
							<div class="clients-banner__items__item__link">
								<span>Телефон:</span>
								<a href="tel:+86-21-5432-2755">+86-21-5432-2755 (ext. 802)</a>
							</div>
							<div class="clients-banner__items__item__link">
								<span>Email:</span>
								<a href="mailto:support@inter-sa.com">support@inter-sa.com</a>
							</div>
						</div>
						<div class="clients-banner__items__item">
							<h6>{{ t('clientSupportBannerItem3Title') }}</h6>
							<p>{{ t('clientSupportBannerItem3Text') }}</p>
						</div>
					</div>
					<div class="clients-banner__mobile-button desktop-hide">
						<v-btn-red class="clients-banner__mobile-button__btn" text="отправить сообщение" style="width: 240px;"></v-btn-red>
					</div>

				</div>

				<div class="clients-banner__arrows row no-wrap justify-end">
					<q-img src="icons/arrow-big-blue.svg" fit="contain" class="clients-banner__arrows__item" />
					<q-img src="icons/arrow-big-blue.svg" fit="contain" class="clients-banner__arrows__item" />
				</div>
			</div>
		</div>
	</div>
	<q-dialog v-model="isOpenDialog">
		<modal-application @on-close="isOpenDialog = false" />
	</q-dialog>
</template>
<style lang="scss" scoped>
	.clients-banner {
		&__body {
			border-radius: 10px;
			background-color: var(--red);
			padding: 40px;
			position: relative;
			overflow: hidden;

			@media (max-width: $breakpoint-sm-min) {
				padding: 40px 16px;
				margin-left: -16px;
				width: calc(100% + 32px);
				border-radius: 0px;
			}
		}

		&__wrapper {
			position: relative;
			z-index: 2;
			color: var(--white);
		}

		&__arrows {
			position: absolute;
			top: 0;
			right: 0;
			height: 100%;
			width: 100%;

			&__item {
				height: 100%;
				width: 260px;

				&:first-child {
					position: relative;
					right: -80px;
				}
			}

			@media (max-width: 768px) {
				top: 100%;
				margin-top: -200px;

				&__item {
					&:first-child {
						right: 0;
					}
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				margin-top: -280px;
			}
			@media (max-width: 375px) {
				margin-top: -320px;
			}
		}

		&__header {
			margin-bottom: 40px;
			&__title {
				font-weight: bold;
				font-size: 1.55em;
			}

			@media (max-width: 768px) {
				&__btn {
					display: none;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 24px;
			}
		}

		&__content {
			margin-bottom: 32px;
			h5 {
				font-size: 1.222em;
				font-weight: bold;
				margin-bottom: 16px;
			}
			p {
				font-size: 1em;
				color: #E3E3E3;
			}

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 16px;

				h5 {
					margin-bottom: 8px;
				}
			}
		}

		&__items {
			&__item {
				width: 50%;

				h6 {
					font-size: 1.222em;
					font-weight: bold;
					margin-bottom: 16px;
				}

				&__link {
					display: flex;
					color: var(--yellow);
					font-weight: bold;

					a {
						color: var(--yellow);
						text-decoration: none;
						margin-left: 5px;
						transition: .4s all;

						&:hover {
							color: var(--white);
						}
					}
				}

				@media (max-width: 768px) {
					h6 {
						margin-bottom: 8px;
					}

					&__link {
						display: inline-block;
						margin-right: 8px;

						&:last-child {
							margin-right: 0;
						}
					}
				}
			}
		}

		&__mobile-button {
			@media (max-width: 768px) {
				margin-top: 64px;
				display: block !important;
				text-align: center;

				&__btn {
					margin: 0 auto;
				}
			}
		}
	}
</style>

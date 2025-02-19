<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	interface IProps {
		data: any
	}
	defineProps<IProps>();

	const { t, locale } = useI18n();
</script>

<template>
	<div class="contacts-general pt-8 pb-8 bg-white">
		<div class="container">
			<h4 data-aos="fade-right" class="contacts-general__title headline-1 text-gradient text-uppercase">{{ t('contactsCommonTitle') }}</h4>
			<div class="contacts-general__body row no-wrap">
				<div data-aos="fade-right" class="contacts-general__column">
					<div class="contacts-general__item">
						<p class="contacts-general__label">{{ t('contactsCommonGeneral') }}</p>
						<a href="mailto:info@inter-sa.com" class="contacts-general__content">{{ data?.fields['general-email'][locale]?.value }}</a>
					</div>
					<div class="contacts-general__item">
						<p class="contacts-general__label">{{ t('contactsCommonPartner') }}</p>
						<a href="mailto:info@inter-sa.com" class="contacts-general__content">{{ data?.fields['partners-email'][locale]?.value  }}</a>
					</div>
					<div class="contacts-general__item">
						<p class="contacts-general__label">{{ t('contactsCommonClient') }}</p>
						<a href="mailto:info@inter-sa.com" class="contacts-general__content">{{ data?.fields['clients-email'][locale]?.value  }}</a>
					</div>
					<div class="contacts-general__item">
						<p class="contacts-general__label">{{ t('contactsCommonPress') }}</p>
						<a href="mailto:info@inter-sa.com" class="contacts-general__content">{{ data?.fields['press-emal'][locale]?.value  }}</a>
					</div>
				</div>
				<div data-aos="fade-left" class="contacts-general__column info row no-wrap">
					<p class="contacts-general__label">{{ t('contactsCommonTime') }}</p>
					<div class="contacts-general__info">
						<p class="contacts-general__content" v-html="data?.fields?.workin[locale]?.value"></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.contacts-general{
		&__title {
			margin-bottom: 64px;

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 32px;
			}
		}
		&__label {
			font-size: 0.95em;
			color: var(--gray-secondary);
			font-weight: bold;
			margin-bottom: 8px;
		}
		&__content {
			font-size: 1.35em;
			line-height: 2.7;
			color: var(--dark-blue);
			text-transform: uppercase;
			text-decoration: none;
			font-family: 'Oswald', sans-serif;
			font-weight: 500;
			margin-top: -17px;

		}
		&__item {
			border-bottom: 2px #E3E3E3 solid;
			padding-bottom: 24px;
			margin-bottom: 24px;
			&:last-child {
				border-bottom: none;

				@media (max-width: 700px) {
					border-bottom: 2px #E3E3E3 solid;
				}
			}
		}

		&__body {
			@media (max-width: 850px) {
				align-items: start;
			}

			@media (max-width: 700px) {
				flex-wrap: wrap;
			}
		}

		&__info {
			@media (max-width: 700px) {
				width: 100%;
			}
		}

		&__column {
			width: calc(50% - 32px);
			margin-right: 64px;
			@media (max-width: 700px) {
				width: 100%;
				margin-right: 0;
			}

			&.info {
				min-width: 608px;

				.contacts-general__label {
					white-space: nowrap;
					margin-right: 24px;
				}

				.contacts-general__content {
					margin-bottom: 24px;
					&:last-child {
						margin-bottom: 0;
					}
				}

				@media (max-width: 996px) {
					min-width: 508px;
				}

				@media (max-width: 850px) {
					flex-wrap: wrap;
					min-width: 400px;
				}

				@media (max-width: 700px) {
					min-width: auto;
				}
			}

			&:last-child {
				margin-right: 0;
			}
		}
	}
</style>

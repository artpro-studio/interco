<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	interface IProps {
		data: any
	}
	defineProps<IProps>();

	const { t, locale } = useI18n();
</script>

<template>
	<div class="faq pt-8 pb-8 bg-white" id="faq">
		<div class="container">
			<div data-aos="fade-right" class="faq__header">
				<h3 class="faq__header__title headline-1 text-gradient text-uppercase">{{ t('clientsFaqTitle') }}</h3>
			</div>
			<div class="faq__body row items-lg-start justify-between">
				<div
					v-for="(item, index) in data"
					:key="index"
					data-aos="fade-up"
					class="faq__body__columns"
				>
					<h6 class="faq__body__title text-red text-uppercase">{{ item.value[locale] }}</h6>
					<q-expansion-item
						v-for="(el, indx) in item.data"
						:key="indx"
						class="faq__body__item"
						:label="el.fields.question[locale].value"
						expand-icon="add"
						expanded-icon="close"
						>
						<div class="faq__body__item__body">
							<p>{{ el.fields.description[locale].value }}</p>
						</div>
   					 </q-expansion-item>

				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss">
	.faq {
		&__body {
			&__item {
				.q-item {
					padding: 0;

					.q-focus-helper {
						display: none;
					}

					&__label {
						font-size: 1.22em;
						font-weight: bold;
						letter-spacing:1px;
						line-height: 150% !important;
					}
				}
			}
		}
	}
</style>
<style lang="scss" scoped>
	.faq {
		&__header {
			margin-bottom: 64px;

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 32px;
			}
		}

		&__body {
			&__columns {
				width: calc(50% - 32px);
			}
			&__title {
				font-weight: bold;
				font-size: 1.55em;
				margin-bottom: 32px;
			}

			&__item {
				padding: 16px 0;
				border-bottom: 1px rgba(227, 227, 227, 1) solid;
				&__body {
					padding-top: 16px;
					p {
						font-size: 0.9em;
						letter-spacing:1px;
						line-height: 140%;
					}
				}
			}

			@media (max-width: 900px) {
				flex-wrap: wrap !important;

				&__columns {
					width: 100%;
					margin-bottom: 32px;

					&:last-child {
						margin-bottom: 0;
					}
				}

				&__title {
					margin-bottom: 16px;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				&__title {
					margin-bottom: 16px;
				}

				&__item {
					padding: 8px 0;
				}
			}

		}
	}
</style>

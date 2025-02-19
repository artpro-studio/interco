<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	interface IProps {
		data: any
	}
	defineProps<IProps>();

	const { t, locale } = useI18n();
</script>

<template>
	<div class="about-years pt-8 pb-8">
		<div class="container">
			<div data-aos="fade-right" class="about-years__header">
				<h3 class="about-years__header__title headline-1 text-gradient text-uppercase">{{ t('aboutYearsTitle') }}</h3>
			</div>
			<div class="about-years__body">
				<div
					v-for="(item, index) in data"
					:key="index"
					class="about-years__item row no-wrap"
					data-aos="fade-up"
				>
					<div class="about-years__item__column headline-2">{{ item.fields?.year?.[locale]?.value }}</div>
					<div class="about-years__item__info">
						<p>{{ item.fields?.description?.[locale]?.value }}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<style lang="scss" scoped>
	.about-years {
		color: var(--white);
		font-family: 'Oswald', sans-serif;
		&__header {
			margin-bottom: 64px;

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 40px;
			}
		}

		&__item {
			border-bottom: 2px rgba(136, 136, 145, 0.55) solid;
			padding-bottom: 24px;
			margin-bottom: 24px;

			&:last-child {
				margin-bottom: 0;
				border-bottom: none;
			}

			&__column {
				min-width: 24%;
			}

			&__info {
				p {
					font-size: 1.35em;
					text-transform: uppercase;
					line-height: 145%;

					@media (max-width: $breakpoint-sm-min) {
						font-size: 1.2em;
					}
				}
			}
		}
	}
</style>

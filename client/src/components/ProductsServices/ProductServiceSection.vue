<script lang="ts" setup>
	interface IProps {
		title: string,
		text: string
	}
	defineProps<IProps>();
</script>

<template>
	<div class="service-product-section">
		<div class="container">
			<div class="service-product-section__header row no-wrap items-center justify-between">
				<div class="service-product-section__header__title row no-wrap items-center">
					<q-img src="icons/arrow-red.svg" width="40px" class="service-product-section__header__title__arrow" />
					<h4 class="service-product-sectiont__header__title__text headline-2 text-uppercase">{{ title }}</h4>
				</div>
				<div class="service-product-section__header__text">
					<p>{{ text }}</p>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.service-product-section {
		width: 100%;
		&__header {
			margin-bottom: 40px;
			&__title {
				&__arrow {
					margin-right: 40px;
				}

				&__text {
					line-height: 140%;
				}

			}
			&__text {
				max-width: 520px;
				text-align: right;

				p {
					color: #888891;
					font-size: 1em;
					font-family: 'Oswald', sans-serif;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				flex-wrap: wrap;
				margin-bottom: 24px;

				&__title {
					&__arrow {
						width: 30px !important;
						margin-right: 16px;
					}
				}

				&__text {
					text-align: left;
					margin-top: 16px;
				}
			}
		}
	}
</style>

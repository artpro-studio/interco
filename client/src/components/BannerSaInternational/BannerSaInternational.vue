<script lang="ts" setup>
	interface IProps {
		title: string;
		description: string;
	}

	defineProps<IProps>()
</script>

<template>
	<div class="clients-section-text pt-8 pb-12">
		<div class="container">
			<div class="clients-section-text__title headline-1 text-gradient fonts-oswald text-uppercase text-center">{{ title }}</div>
			<p class="clients-section-text__text fonts-oswald text-uppercase text-center">{{ description }}</p>
		</div>
		<div class="clients-section-text__arrows row no-wrap">
			<q-img class="clients-section-text__arrows__item" src="icons/arrow-red.svg" />
			<q-img class="clients-section-text__arrows__item" src="icons/arrow-red.svg" />
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.clients-section-text {
		position: relative;
		overflow: hidden;

		&__title {
			margin-bottom: 40px;
			position: relative;
		}
		&__text {
			font-size: 1.22em;
			max-width: 840px;
			margin: 0 auto;
			color: var(--white);
			line-height: 140%;
			position: relative;

			@media (max-width: $breakpoint-sm-min) {
				font-size: 1em;
			}
		}

		&__arrows {
			position: absolute;
			top: -2px;
			right: 0;

			&__item {
				width: 300px;
				opacity: .15;

				&:first-child {
					position: relative;
					right: -70px;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				right: -140px;

				&__item {
					width: 200px;

					&:first-child {
						position: relative;
						right: -40px;
					}
				}
			}
		}
	}
</style>

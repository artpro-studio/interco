<script lang="ts" setup>
	interface IProps {
		widthTitle: string;
		widthText: string;
		title: string;
		text: string;
		images: string;
		dense?:boolean;
		minHeightText?: string
	}
	const props = withDefaults(defineProps<IProps>(), {
		dense: true,
		minHeightText: 'auto',
	});
</script>

<template>
	<div class="home-global pb-8">
		<div class="container">
			<div class="home-global__body">
				<h3 data-aos="fade-right" class="home-global__title" :class="{dense: props.dense}" :style="{maxWidth: props.widthTitle}">{{ title }}</h3>
				<div data-aos="fade-right" class="home-global__text" :style="{maxWidth: props.widthText, minHeight: props.minHeightText}">
					<p>{{ text }}</p>
				</div>
				<q-img data-aos="fade-left" :src="images" class="home-global__bg" />
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.home-global {
		padding-top: 220px;

		&__body {
			position: relative;
		}

		&__title {
			font-size: 4.55em;
			font-family: 'Oswald', sans-serif;
			font-weight: 500;
			margin-bottom: 80px;
			line-height: 130%;
			position: relative;
			z-index: 2;
			text-transform: uppercase;

			&.dense {
				font-size: 2.6em;
				line-height: 140%;
			}

			@media (max-width: $breakpoint-sm-min) {
				font-size: 2em;
				margin-bottom: 24px;

				&.dense {
					font-size: 2em;
				}
			}
		}

		&__text {
			position: relative;
			z-index: 2;
			p {
				font-size: 1.2em;
				color: var(--gray-secondary);
			}
		}

		&__bg {
			position: absolute;
			top: 0px;
			right: 0;
			width: 237px;

			@media (max-width: 900px) {
				top: -50px;
			}
		}
	}
</style>

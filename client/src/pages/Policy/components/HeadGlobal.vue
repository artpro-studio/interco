<script lang="ts" setup>
	interface IProps {
		widthTitle: string;
		widthText: string;
		title: string;
		text: string;
		images: string;
	}
	const props = defineProps<IProps>();
</script>

<template>
	<div class="home-global pb-12">
		<div class="container">
			<div class="home-global__body">
				<h3 class="home-global__title text-white" :style="{maxWidth: props.widthTitle}">{{ title }}</h3>
				<div class="home-global__text" :style="{maxWidth: props.widthText}">
					<p class="text-white">{{ text }}</p>
				</div>
				<q-img :src="images" class="home-global__bg" />
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
			font-size: 2.6em;
			font-family: 'Oswald', sans-serif;
			margin-bottom: 80px;
			line-height: 140%;
			position: relative;
			z-index: 2;

			@media (max-width: $breakpoint-sm-min) {
				font-size: 2em;
				margin-bottom: 24px;
			}
		}

		&__text {
			position: relative;
			z-index: 2;
			p {
				font-size: 1.2em;
			}
		}

		&__bg {
			position: absolute;
			top: -60px;
			right: 0;

			@media (max-width: $breakpoint-sm-min) {
				top: -65px;
			}
		}
	}
</style>

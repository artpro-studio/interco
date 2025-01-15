<script lang="ts" setup>
import { computed } from 'vue';

	interface IProps {
		title: string;
		tag?: string;
		color?: 'red' | 'gold';
		colorText?: 'white' | 'black';
	}
	const props = withDefaults(defineProps<IProps>(), {
		color: 'red',
		colorText: 'white',
	});

	const imagesPath = computed(() => {
		if (props.color === 'gold') {
			return 'icons/arrow-gradient.svg'
		}

		return 'icons/arrow-red.svg';
	})

</script>
<template>
	<div data-aos="fade-right" class="section__title row no-wrap items-center">
		<q-img :src="imagesPath" width="26px" fit="contain" class="section__title__img" />
		<h3 class="section__title__title headline-1" :class="{'text-white': props.colorText === 'white'}">{{ title }}</h3>
	</div>
</template>
<style lang="scss" scoped>
	.section__title {
		padding-left: 18px;
		margin-bottom: 80px;
		position: relative;

		&__img {
			margin-right: 52px;
		}

		&__title {
			text-transform: uppercase;
		}

		@media (max-width: $breakpoint-sm-min) {
			padding-left: 0px;
			margin-bottom: 40px;
			&__img {
				margin-right: 18px;
				width: 35px !important;
			}

			&__title {
				font-size: 1.75em;
			}

		}
	}
</style>

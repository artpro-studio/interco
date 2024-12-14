<script lang="ts" setup>
	interface IProps {
		title: string;
		tag?: string;
	}
	defineProps<IProps>();

</script>
<template>
	<div class="section__title row no-wrap items-center">
		<q-img src="icons/arrow-red.svg" width="26px" fit="contain" class="section__title__img" />
		<h3 class="section__title__title headline-1 text-white">{{ title }}</h3>
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

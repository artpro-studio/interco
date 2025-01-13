<script lang="ts" setup>
	import { NamedColor } from 'quasar';

	interface IProps {
		color?: NamedColor | undefined;
		height?: number;
		text: string;
	}
	defineProps<IProps>();
	const emit = defineEmits(['on-click'])
</script>
<template>
	<div class="v-btn-red">
		<q-btn class="v-btn-red__wrap" @click="emit('on-click')" :style="{height: height + 'px'}">
			<div class="row no-wrap items-center">
				<q-img src="icons/arrow-white.svg" class="q-mr-md" width="16px" :alt="text" />
				<div class="v-btn-red__text">{{ text }}</div>
			</div>
		</q-btn>
	</div>
</template>
<style lang="scss">
	.v-btn-red {
		width: 100%;
		&__wrap {
			width: 100%;
			border-radius: 10px;
			font-weight: bold;
			font-size: 1.12em;
			padding: 0 16px;

			&::before {
				display: none;
			}
		}
		.q-btn {
			height: 44px;
			background: var(--red);

			.q-focus-helper {
				display: none;
			}

			.v-btn-red__text {
				transition: .4s all;
			}

			&:hover {
				.v-btn-red__text {
					opacity: .7;
				}
			}

			&__content {
				font-size: .7em;
				color: var(--white);
				line-height: 140%;
				text-align: left;
				@media (max-width: $breakpoint-sm-min) {
					font-size: 15px;
				}
			}
			@media (max-width: $breakpoint-sm-min) {
				height: 64px;
			}
		}
	}
</style>

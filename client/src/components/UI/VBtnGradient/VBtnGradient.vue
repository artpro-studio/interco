<script lang="ts" setup>
	import { NamedColor } from 'quasar';

	interface IProps {
		color?: NamedColor | undefined;
	}
	defineProps<IProps>();
	const emit = defineEmits(['on-click'])
</script>
<template>
	<div class="v-btn-gradient">
		<q-btn class="v-btn-gradient__wrap" @click="emit('on-click')" dense>
			<slot name="default" />
		</q-btn>
	</div>
</template>
<style lang="scss">
	.v-btn-gradient {
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
			background: var(--gradient-yellow);

			&__content {
				font-size: .7em;
				color: var(--dark-blue);
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

<script lang="ts" setup>
	import { NamedColor } from 'quasar';

	interface IProps {
		color?: NamedColor | undefined;
	}
	defineProps<IProps>();
	const emit = defineEmits(['on-click'])
</script>
<template>
	<div class="v-btn">
		<q-btn :color="color" class="v-btn__wrap" @click="emit('on-click')">
			<slot name="default" />
		</q-btn>
	</div>
</template>
<style lang="scss">
	.v-btn {
		&__wrap {
			height: 80px;
			border-radius: 10px;
			font-weight: bold;
			font-size: 1.12em;
			padding: 0 32px;

			&::before {
				display: none;
			}
		}
	}
</style>

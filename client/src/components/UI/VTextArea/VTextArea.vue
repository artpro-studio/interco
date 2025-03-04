<script lang="ts" setup>
	import { computed } from 'vue';

	interface IProps {
		modelValue: string;
		placeholder?: string;
		color?: 'gray';
	}
	const props = defineProps<IProps>();
	const emit = defineEmits(['update:model-value']);
	const maxRows = 3;

	const currentValue = computed({
		get: () => props.modelValue,
		set: (value: string) => emit('update:model-value', value),
	});

	const limitLines = () => {
		const lines = currentValue.value.split('\n');

		if (lines.length > maxRows) {
			currentValue.value = lines.slice(0, maxRows).join('\n'); // Обрезаем лишние строки
		}
	};

	const preventExtraLine = (event: any) => {
		const lines = currentValue.value.split('\n');

		if (lines.length >= maxRows) {
			event.preventDefault(); // Блокируем Enter, если строк уже 2
		}
	};
</script>

<template>
	<div :class="`v-text-area ` + props.color">
		<div class="v-text-area__lines"></div>
		<q-input
			v-model="currentValue"
			color="white"
			:class="`v-text-area__field ` + props.color"
			type="textarea"
			:placeholder="placeholder"
			rows="3"
			@update:model-value="limitLines"
			@keydown.enter="preventExtraLine"
		/>
	</div>
</template>
<style lang="scss">
	.v-text-area {
		position: relative;
		width: 100%;
		height: 192px;
		overflow: hidden;

		&__lines {
			position: absolute;
			width: 100%;
			height: 100%;
			z-index: 1;
			top: 61px;
			left: 0;
			pointer-events: none;

			&::before,
			&::after {
				content: '';
				display: block;
				height: 100%;
				background: repeating-linear-gradient(to bottom, #ccc 0, #ccc 1px, transparent 1px, transparent 64px);
			}
		}

		&__field {
			height: 174px;
			font-family: 'Oswald', sans-serif;
			font-size: 1.2em;
			color: var(--white);

			textarea {
				color: var(--white);
				resize: none !important;
				line-height: 64px !important;
				padding-top: 0 !important;
				height: 210px;
				overflow: hidden;
			}
			.q-field__control {
				&::after,
				&::before {
					display: none;
				}
			}
		}

		&.gray {
			.v-text-area__lines {
				&::before,
				&::after {
					background: repeating-linear-gradient(to bottom, #e3e3e3 0, #e3e3e3 1px, transparent 1px, transparent 64px);
				}
			}
			textarea {
				color: var(--dark-blue) !important;
			}
		}
	}
</style>

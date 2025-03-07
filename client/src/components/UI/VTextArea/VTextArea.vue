<script lang="ts" setup>
	import { ref } from 'vue';
	import { computed } from 'vue';

	interface IProps {
		modelValue: string;
		placeholder?: string;
		color?: 'gray';
	}
	const props = defineProps<IProps>();
	const emit = defineEmits(['update:model-value']);

	const textareaRef = ref<HTMLTextAreaElement | null>(null);

	const currentValue = computed({
		get: () => props.modelValue,
		set: (value: string) => {
			emit('update:model-value', value);
		},
	});
</script>

<template>
	<div :class="`v-text-area ` + props.color">
		<q-input
			ref="textareaRef"
			v-model="currentValue"
			color="white"
			:class="`v-text-area__field ` + props.color"
			type="textarea"
			:placeholder="placeholder"
			rows="3"
		/>
	</div>
</template>
<style lang="scss">
	.v-text-area {
		position: relative;
		width: 100%;
		padding-top: 1;

		&__field {
			font-family: 'Oswald', sans-serif;
			font-size: 1em;
			color: var(--white);

			textarea {
				color: var(--white);
				resize: none !important;
				line-height: 1.6 !important;
				padding-top: 0 !important;
				height: 210px;
				overflow: hidden;
			}
		}

		.q-field__control {
			&::before {
				border-bottom: 1px solid #fff;
			}

			&:hover {
				&::before {
					border-bottom: 1px solid #fff;
				}
			}
		}

		&.gray {
			.q-field__control {
				&::before {
					border-bottom: 1px solid #e3e3e3;
				}

				&::after {
					background-color: rgba(97, 97, 113, 1) !important;
				}
			}

			textarea {
				color: var(--dark-blue) !important;
			}
		}
	}
</style>

<script lang="ts" setup>
	import { computed } from 'vue';

	interface IProps {
		modelValue: string;
		placeholder?: string;
		color?: 'dark' | 'white';
		rows?: number
	}
	const props = withDefaults(defineProps<IProps>(), {
		color: 'dark',
		rows: 3,
	});
	const emit = defineEmits(['update:model-value']);

	const currentValue = computed({
		get: () => props.modelValue,
		set: (value: string) => emit('update:model-value', value)
	})
</script>

<template>
	<div class="v-input-text">
		<q-input
			v-model="currentValue"
			color="white"
			:class="`v-input-text__field ` + props.color"
			type="textarea"
			:placeholder="placeholder"
			:rows="rows"
		/>
	</div>
</template>
<style lang="scss">
	.v-input-text {
		.q-field {
			font-size: 1em !important;
		}

		&__field {
			font-family: 'Oswald', sans-serif;

			&.dark {
				.q-field__control {
					&::before {
						border-bottom: 1px solid rgba(97, 97, 113, 1);
					}

					&::after {
						background-color: rgba(97, 97, 113, 1) !important;
					}
				}

				textarea {
					color:var(--dark-blue);

					&::placeholder {
						color: #616171;
					}
				}
			}

			&.white {
				.q-field__control {
					&::before {
						border-bottom: 1px solid #fff;
					}
					&::after {
						background-color: #fff !important;
					}
				}

				textarea {
					color: var(--white);

					&::placeholder {
						color: #fff;
					}
				}
			}

			textarea {
				font-size: 1em;
			}
		}
	}
</style>

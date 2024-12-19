<script lang="ts" setup>
	import { computed } from 'vue';

	interface IProps {
		modelValue: string;
		placeholder?: string;
		color?: 'dark' | 'white' | 'gray'
	}
	const props = withDefaults(defineProps<IProps>(), {
		color: 'dark',
	});
	const emit = defineEmits(['update:model-value']);

	const currentValue = computed({
		get: () => props.modelValue,
		set: (value: string) => emit('update:model-value', value)
	})
</script>

<template>
	<div class="v-input">
		<q-input
			v-model="currentValue"
			:class="`v-input__field ` + props.color"
			:placeholder="placeholder"
		/>
	</div>

</template>
<style lang="scss">
	.v-input {
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

				input {
					color:var(--dark-blue);

					&::placeholder {
						color: #616171;
					}
				}
			}

			&.gray {
				.q-field__control {
					&::before {
						border-bottom: 1px solid #E3E3E3;
					}

					&::after {
						background-color: rgba(97, 97, 113, 1) !important;
					}
				}

				input {
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

				input {
					color: var(--white);

					&::placeholder {
						color: #fff;
					}
				}
			}

			input {
				font-size: 1em;
			}
		}
	}
</style>

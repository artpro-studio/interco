<script lang="ts" setup>
	import { computed } from 'vue';

	interface IProps {
		modelValue: string;
		placeholder?: string;
	}
	const props = defineProps<IProps>();
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
			class="v-input__field"
			:placeholder="placeholder"
		/>
	</div>

</template>
<style lang="scss">
	.v-input {
		&__field {
			font-family: 'Oswald', sans-serif;

			.q-field__control {
				&::before {
					border-bottom: 1px solid rgba(97, 97, 113, 1);
				}
			}

			input {
				color:var(--dark-blue);
				font-size: 1.22em;

				&::placeholder {
					color: #616171;
				}
			}
		}
	}
</style>

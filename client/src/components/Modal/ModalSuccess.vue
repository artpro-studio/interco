<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	interface IProps {
		title?: string;
		text?: string;
	}
	const props = withDefaults(defineProps<IProps>(), {
		title: '',
		text: '',
	});
	const emit = defineEmits(['on-close']);

	const { t } = useI18n();

	const getTitle = props.title || t('modalSuccessTitle');
	const getText = props.text || t('modalSuccessText');
</script>

<template>
	<div class="modal-success">
		<q-btn class="modal-success__close" @click="emit('on-close')" flat><q-icon name="close" /></q-btn>
		<div class="modal-success__body">
			<h4 class="modal-success__title text-center q-mb-md">{{ getTitle }}</h4>
			<p class="modal-success__description text-center">{{ getText }}</p>
		</div>
	</div>
</template>

<style lang="scss" scoped>
	.modal-success {
		padding: 80px;
		background-color: #f5f5f5;
		min-width: 1280px;
		border-radius: 10px;
		position: relative;
		min-width: 500px;

		@media (max-width: 500px) {
			min-width: none;
			width: 100%;
		}

		&__close {
			position: absolute;
			top: 40px;
			right: 40px;

			@media (max-width: 900px) {
				top: 20px;
				right: 20px;
			}

			@media (max-width: 800px) {
				top: 15px;
				right: 15px;
			}
		}
	}
</style>

<script setup lang="ts">
	import { onUnmounted } from 'vue';
	import { ref, onMounted } from 'vue';
	import { useI18n } from 'vue-i18n';

	interface IProps {
		id?: string;
	}
	const props = withDefaults(defineProps<IProps>(), {
		id: 'turnstile-container',
	});

	const { locale } = useI18n();

	const token = ref('');
	let userInteracted = false;

	onMounted(() => {
		const lang = locale.value;
		window.turnstile.ready(function () {
			window.turnstile.render(`#${props.id}`, {
				'sitekey': import.meta.env.VITE_APP_SITE_KEY,
				'language': lang,
				'action': 'strict_check',
				'execution': 'render',
				'cData': 'force-interaction',
				'refresh-expired': 'never',
				'response-field': false,
				'callback': (res) => {
					if (!userInteracted) {
						console.log('Turnstile решена автоматически, перезапускаем...');
						window.turnstile.reset(`#${props.id}`);
					} else {
						token.value = res;
					}
				}, // Записываем токен
			});
		});

		document?.getElementById(`${props.id}`)?.addEventListener('click', () => {
			userInteracted = true;
		});
	});

	onUnmounted(() => {
		document?.getElementById(`${props.id}`)?.removeEventListener('click', () => {
			userInteracted = false;
		});
	});

	defineExpose({
		token,
	});
</script>
<template>
	<div :id="id"></div>
</template>

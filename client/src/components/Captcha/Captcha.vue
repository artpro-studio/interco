<script setup lang="ts">
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

	onMounted(() => {
		const lang = locale.value;
		window.turnstile.render(`#${props.id}`, {
			sitekey: import.meta.env.VITE_APP_SITE_KEY,
			language: lang,
			execution: 'execute',
			callback: (res) => (token.value = res), // Записываем токен
		});
	});

	defineExpose({
		token,
	});
</script>
<template>
	<div :id="id"></div>
</template>

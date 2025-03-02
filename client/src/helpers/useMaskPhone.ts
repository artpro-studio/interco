import { computed } from 'vue';
import { useI18n } from 'vue-i18n';

const phoneMask = {
	'ru-RU': '+7 (###) ###-##-##',
	'en-US': '+1 (###) ###-####',
	'zh-CN': '+86 ### #### ####',
};

export default function useMaskPhone() {
	const { locale } = useI18n();

	return computed(() => (phoneMask as any)[locale.value] || phoneMask['ru-RU']);
}

import { useI18n } from 'vue-i18n';

/**
 * Локализация клиентских ошибок валидации
 */
const ValidationRulesText = () => {
	const { t } = useI18n();

	const required = t('validateTextRequired');
	const email = t('validateTextEmail');
	const minLength = t('validateTextMinLength');
	const mustMatch = t('validateTextPassword');
	const number = t('validateTextNumber');
	const notValidPassword = t('validateTextNotPassword');
	const notValidLink = t('validateTextLink');

	return {
		required,
		email,
		minLength,
		mustMatch,
		number,
		notValidPassword,
		notValidLink,
	};
};

export default ValidationRulesText;

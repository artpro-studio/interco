/**
 * Локализация клиентских ошибок валидации
 */
const ValidationRulesText = () => {
	const required = 'validateTextRequired';
	const email = 'validateTextEmail';
	const minLength = 'validateTextMinLength';
	const mustMatch = 'validateTextPassword';
	const number = 'validateTextNumber';
	const notValidPassword = 'validateTextNotPassword';
	const notValidLink = 'validateTextLink';

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

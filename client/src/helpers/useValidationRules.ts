import ValidationRulesText from 'src/helpers/ValidationRulesText';
import { computed } from 'vue';
import { useI18n } from 'vue-i18n';

// Правила валидации для поля rules
// При необходимости, список можно расширить
export default function useValidationRules() {
	const validationRulesText = ValidationRulesText();
	const { t } = useI18n();

	// Обязательное поле
	const isRequired = (val: string | null | undefined): boolean | string => {
		const value = val?.toString().trim();
		const rule = value !== undefined && value !== null && value !== '';

		return rule || t(validationRulesText.required);
	};

	// Обязательное поле при условии что conditionFunc === true
	const isRequiredIf =
		(conditionFunc: () => boolean) =>
		(val: string | null | undefined): boolean | string => {
			if (conditionFunc.call(null) === true) {
				return isRequired(val);
			} else {
				return true;
			}
		};

	const isRequiredEmail = (val: string | null | undefined): boolean | string => {
		const value = val?.toString().trim();
		const rule =
			value !== undefined &&
			value !== null &&
			value !== '' &&
			value
				.toLowerCase()
				.match(
					/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
				) !== null;

		return rule || t(validationRulesText.email);
	};

	return {
		isRequired: computed(() => isRequired),
		isRequiredIf: computed(() => isRequiredIf),
		isRequiredEmail: computed(() => isRequiredEmail),
	};
}

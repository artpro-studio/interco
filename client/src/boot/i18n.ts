import { defineBoot } from '#q-app/wrappers';
import { createI18n } from 'vue-i18n';

import messages from 'src/i18n';

// Функция определения языка пользователя
function getUserLocale() {
	const langs: any = {
		'ru-RU': 'ru-RU',
		'en-US': 'en-US',
		'zh-CN': 'zh-CN',
	};
	const locale = navigator.language!.toString(); // 'ru-RU', 'zh-CN', 'en-US'
	const shortLocale = langs[locale] || 'en-US';
	return shortLocale; // Если нет в списке, ставим английский
}

export type MessageLanguages = keyof typeof messages;
// Type-define 'en-US' as the master schema for the resource
export type MessageSchema = (typeof messages)['en-US'];

// See https://vue-i18n.intlify.dev/guide/advanced/typescript.html#global-resource-schema-type-definition
/* eslint-disable @typescript-eslint/no-empty-object-type */
declare module 'vue-i18n' {
	// define the locale messages schema
	export interface DefineLocaleMessage extends MessageSchema {}

	// define the datetime format schema
	export interface DefineDateTimeFormat {}

	// define the number format schema
	export interface DefineNumberFormat {}
}
/* eslint-enable @typescript-eslint/no-empty-object-type */

export default defineBoot(({ app, ssrContext }) => {
	let locale = getUserLocale();
	if (ssrContext) {
		const req = ssrContext.req;
		const host = req.headers.host!;
		const subdomain = host.split('.')[0]!;
		let urlLocale = '';
		if (['en', 'ru', 'ch'].includes(subdomain)) {
			urlLocale = subdomain;
		}
		if (urlLocale && urlLocale.length) {
			const langsUrl: any = {
				ru: 'ru-RU',
				en: 'en-US',
				ch: 'zh-CN',
			};
			locale = langsUrl[urlLocale];
		}
	}
	const i18n = createI18n<{ message: MessageSchema }, MessageLanguages>({
		locale: locale,
		legacy: false,
		messages,
	});

	// Set i18n instance on app
	app.use(i18n);
});

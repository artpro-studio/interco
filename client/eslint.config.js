import js from '@eslint/js'
import globals from 'globals'
import pluginVue from 'eslint-plugin-vue'
import pluginQuasar from '@quasar/app-vite/eslint'
import vueTsEslintConfig from '@vue/eslint-config-typescript'
import prettierSkipFormatting from '@vue/eslint-config-prettier/skip-formatting'

const isBuild = process.env.NODE_ENV === 'production';
const modeError = isBuild ? 'warn' : 'warn';

export default [
  {
    /**
     * Ignore the following files.
     * Please note that pluginQuasar.configs.recommended already ignores
     * the "node_modules" folder for you (and all other Quasar project
     * relevant folders and files).
     *
     * ESLint requires "ignores" key to be the only one in this object
     */
    // ignores: []
  },

  ...pluginQuasar.configs.recommended(),
  js.configs.recommended,

  /**
   * https://eslint.vuejs.org
   *
   * pluginVue.configs.base
   *   -> Settings and rules to enable correct ESLint parsing.
   * pluginVue.configs[ 'flat/essential']
   *   -> base, plus rules to prevent errors or unintended behavior.
   * pluginVue.configs["flat/strongly-recommended"]
   *   -> Above, plus rules to considerably improve code readability and/or dev experience.
   * pluginVue.configs["flat/recommended"]
   *   -> Above, plus rules to enforce subjective community defaults to ensure consistency.
   */
  ...pluginVue.configs[ 'flat/essential' ],

  // https://github.com/vuejs/eslint-config-typescript
  ...vueTsEslintConfig({
    // Optional: extend additional configurations from typescript-eslint'.
    // Supports all the configurations in
    // https://typescript-eslint.io/users/configs#recommended-configurations
    extends: [
		// By default, only the recommended rules are enabled.
		'recommended'
    ]
  }),

  {
    languageOptions: {
      ecmaVersion: 'latest',
      sourceType: 'module',

      globals: {
        ...globals.browser,
        ...globals.node, // SSR, Electron, config files
        process: 'readonly', // process.env.*
        ga: 'readonly', // Google Analytics
        cordova: 'readonly',
        Capacitor: 'readonly',
        chrome: 'readonly', // BEX related
        browser: 'readonly' // BEX related
      }
    },

    // add your custom rules here
    rules: {
		// Требовать использования объектов Error в качестве причин отклонения обещания
		'prefer-promise-reject-errors': 'off',
		// Запретить возвращаемые значения из функций-исполнителей промисов
		'no-floating-promise': 0,

		// TypeScript
		// Требуются явные возвращаемые типы для функций и методов класса.
		'@typescript-eslint/explicit-function-return-type': 'off',
		// Требуются явные возвращаемые значения и типы аргументов в методах открытых классов экспортируемых функций и классов.
		'@typescript-eslint/explicit-module-boundary-types': 'off',
		// Требуется, чтобы операторы, подобные Promise, обрабатывались должным образом.
		'@typescript-eslint/no-floating-promises': 'off',
		// Запрещает перебор массива с помощью цикла for-in.
		'@typescript-eslint/no-for-in-array': 'off',
		// Запрещает присваивать значение типа anyпеременным и свойствам.
		'@typescript-eslint/no-unsafe-assignment': 'off',
		// Запрещает доступ членов к значению типа any.
		'@typescript-eslint/no-unsafe-member-access': 'off',
		// Требуются аннотации типа в определенных местах.
		'@typescript-eslint/typedef': 'error',
		// Запрещает явные объявления типов для переменных или параметров, инициализированных числом, строкой или логическим значением.
		'@typescript-eslint/no-inferrable-types': 'off',
		// Требует, чтобы оба операнда сложения имели тип numberили string.
		'@typescript-eslint/restrict-plus-operands': 'off',
		// Принудительно вызывает несвязанные методы с их ожидаемой областью действия.
		'@typescript-eslint/unbound-method': 'off',
		// Запрещает возвращать значение с типом anyиз функции.
		'@typescript-eslint/no-unsafe-return': 'off',
		// Запрещает вызов значения с типом any.
		'@typescript-eslint/no-unsafe-call': 'off',
		// Запрещает вызов функции со значением типа any.
		'@typescript-eslint/no-unsafe-argument': 'off',
		// Применяется , если не указан глобальный флаг RegExp#exec.String#match
		'@typescript-eslint/prefer-regexp-exec': 'off',
		// Запрещает обещания в местах, не предназначенных для их обработки.
		'@typescript-eslint/no-misused-promises': 'off',
		// Запрещает пользовательские модули и пространства имен TypeScript.
		'@typescript-eslint/no-namespace': 'off',
		// Принуждает литеральные выражения шаблона иметь stringтип.
		'@typescript-eslint/restrict-template-expressions': 'off',
		// Запрещает ненулевые утверждения с использованием !постфиксного оператора.
		'@typescript-eslint/no-non-null-assertion': 'off',
		// no-explicit-any
		'@typescript-eslint/no-explicit-any': 'off',
		// Запрещает неиспользуемые переменные.
		'@typescript-eslint/no-unused-vars': 'warn',
		// Запрещает require операторы, кроме операторов импорта.
		'@typescript-eslint/no-var-requires': 'off',

		// TODO: После фикса поставить error
		// Обязывает импортировать типы как типы (import type)
		'@typescript-eslint/consistent-type-imports': 'off',

		'vue/no-v-text-v-html-on-component': 'off',
		// Это правило обеспечивает использование разделенных дефисом имен событий v-on для пользовательских компонентов в шаблонах Vue.
		'vue/v-on-event-hyphenation': 'error',
		// Это правило направлено на предотвращение использования v-forдиректив вместе с v-ifдирективами для одного и того же элемента.
		'vue/no-use-v-if-with-v-for': 'off',
		// Это правило требует, чтобы имена компонентов всегда состояли из нескольких слов,
		//за исключением корневых App компонентов и встроенных компонентов, предоставляемых Vue, таких как <transition>или <component>
		'vue/multi-word-component-names': 'off',
		// Это правило не <template> <script> <style>позволяет блоку быть пустым.
		'vue/no-empty-component-block': 'error',
		// Это правило предупреждает об использовании неопределенных свойств.
		'vue/no-undef-properties': 'off',
		// Это правило направлено на устранение неиспользуемых свойств.
		'vue/no-unused-properties': 'off',
		// 'vue/no-unused-refs': 'error',
		// Это правило сообщает об определениях переменных директив v-for или атрибутов области действия, если они не используются.
		'vue/no-unused-vars': 'error',
		// Это правило обеспечивает присутствие return инструкции в computed свойствах и функ
		'vue/return-in-computed-property': 'error',
		// Это правило сообщает об изменении свойств компонента.
		'vue/no-mutating-props': modeError,
		// Принудительно размещать свойства объекта на отдельных строках в<template>
		'vue/object-property-newline': 'error',
		// Обеспечить расположение первого атрибута
		'vue/first-attribute-linebreak': 'error',
		// Запретить неиспользуемые переменные
		'no-unused-vars': 'off',

		// allow debugger during development only
		'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
		// Отступ перед templae style script
		//"indent": ["error", "tab"],
		// Запрещаем var вместо него let const
		'no-var': 'error',
		// Одинарные ковычки
		'quotes': ['error', 'single'],
		// Интервал между блоками
		'space-before-blocks': 'error',
		// Обеспечьте постоянный интервал перед functionоткрывающей скобкой определения
		'space-before-function-paren': ['error', { anonymous: 'always', named: 'never', asyncArrow: 'always' }],
		// Обеспечьте постоянный интервал до и после стрелки в стрелочных функциях
		'arrow-spacing': 'error',
		// Требовать круглых скобок вокруг аргументов стрелочной функции
		'arrow-parens': 'error',
		// Запретить неправильные пробелы
		'no-irregular-whitespace': 'off',
		// Запретить повторяющиеся члены класса
		'no-dupe-class-members': 'error',
		// Требовать использования ===и!==
		'eqeqeq': ['off', 'smart'],
		// Запретить использованиеeval()
		'no-eval': 'error',
		// Обеспечьте согласованный стиль фигурных скобок для всех операторов управления
		'curly': ['error', 'all'],
		// Точка запятой в конце строки
		'semi': [2, 'always'],
		// Запретить использование console
		'no-console': 0,
		// Запретить несколько пустых строк
		'no-multiple-empty-lines': ['error', { max: 2, maxEOF: 0 }],
		// Обеспечить постоянный интервал до и после ключевых слов
		'keyword-spacing': ['error', { before: true, after: true }],
		// Запрещает пользовательские модули и пространства имен TypeScript.
		'no-namespace': 'off',
		// Обеспечьте максимальное количество строк кода в функции
		'max-lines-per-function': ['error', { max: 55, skipComments: true, skipBlankLines: true }],

		// Валидация слотов Vue, можно удалить это правило, после фикса данной ошибки
		'vue/valid-v-slot': modeError,

		'vue/component-name-in-template-casing': [
			'error',
			'kebab-case',
			{
				registeredComponentsOnly: false,
				ignores: [],
			},
		],

		'vue/block-order': [
			'warn',
			{
				order: ['script', 'template', 'style'],
			},
		],

		/** Правила отключаемые в ESLint т.к за них отвечает Prettier */
		// Обеспечить последовательный отступ в <template>
		'vue/html-indent': 'off',
		'vue/object-property-newline': 'off',
		// Принудительное размещение свойств объекта на отдельных строках
		'object-property-newline': 'off',
		'object-curly-newline': 'off',
		// Отступ перед template style script
		'indent': 'off',
		// Принудительное расположение тел функций стрелок
		'implicit-arrow-linebreak': 'off',
		// "Висящая" запятая
		'comma-dangle': 'off',
		// Обеспечить последовательный отступ в<script>
		'vue/script-indent': 'off',
		// Запретить стрелочные функции, если их можно спутать со сравнениями.
		'no-confusing-arrow': 'off',
		'linebreak-style': 'off',
    }
  },

  {
    files: [ 'src-pwa/custom-service-worker.ts' ],
    languageOptions: {
      globals: {
        ...globals.serviceworker
      }
    }
  },

  prettierSkipFormatting
]

module.exports = {
    // https://eslint.org/docs/user-guide/configuring#configuration-cascading-and-hierarchy
    // This option interrupts the configuration hierarchy at this file
    // Remove this if you have an higher level ESLint config file (it usually happens into a monorepos)
    root: true,

    // https://eslint.vuejs.org/user-guide/#how-to-use-a-custom-parser
    // Must use parserOptions instead of "parser" to allow vue-eslint-parser to keep working
    // `parser: 'vue-eslint-parser'` is already included with any 'plugin:vue/**' config and should be omitted
    parserOptions: {
        parser: require.resolve('@typescript-eslint/parser'),
        extraFileExtensions: ['.vue'],
    },

    env: {
        browser: true,
        es2021: true,
        node: true,
        'vue/setup-compiler-macros': true,
    },

    // Rules order is important, please avoid shuffling them
    extends: [
        // Base ESLint recommended rules
        // 'eslint:recommended',

        // https://github.com/typescript-eslint/typescript-eslint/tree/master/packages/eslint-plugin#usage
        // ESLint typescript rules
        'plugin:@typescript-eslint/recommended',

        // Uncomment any of the lines below to choose desired strictness,
        // but leave only one uncommented!
        // See https://eslint.vuejs.org/rules/#available-rules
        'plugin:vue/vue3-essential', // Priority A: Essential (Error Prevention)
        // 'plugin:vue/vue3-strongly-recommended', // Priority B: Strongly Recommended (Improving Readability)
        // 'plugin:vue/vue3-recommended', // Priority C: Recommended (Minimizing Arbitrary Choices and Cognitive Overhead)

        // https://github.com/prettier/eslint-config-prettier#installation
        // usage with Prettier, provided by 'eslint-config-prettier'.
        'prettier',
    ],

    settings: {
        'import/resolver': {
            alias: {
                extensions: ['.js', '.ts', '.vue'],
                map: [['@', './src']],
            },
        },
    },

    plugins: [
        // required to apply rules which need type information
        '@typescript-eslint',

        // https://eslint.vuejs.org/user-guide/#why-doesn-t-it-work-on-vue-files
        // required to lint *.vue files
        'vue',
        // https://github.com/typescript-eslint/typescript-eslint/issues/389#issuecomment-509292674
        // Prettier has not been included as plugin to avoid performance impact
        // add it as an extension for your IDE
    ],

    globals: {
        ga: 'readonly', // Google Analytics
        cordova: 'readonly',
        __statics: 'readonly',
        __QUASAR_SSR__: 'readonly',
        __QUASAR_SSR_SERVER__: 'readonly',
        __QUASAR_SSR_CLIENT__: 'readonly',
        __QUASAR_SSR_PWA__: 'readonly',
        process: 'readonly',
        Capacitor: 'readonly',
        chrome: 'readonly',
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
        '@typescript-eslint/no-unused-vars': 'error',
        // Запрещает requireоператоры, кроме операторов импорта.
        '@typescript-eslint/no-var-requires': 'off',

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
        'vue/no-undef-properties': 'error',
        // Это правило направлено на устранение неиспользуемых свойств.
        'vue/no-unused-properties': 'off',
        // 'vue/no-unused-refs': 'error',
        // Это правило сообщает об определениях переменных директив v-for или атрибутов области действия, если они не используются.
        'vue/no-unused-vars': 'error',
        // Это правило обеспечивает присутствие returnинструкции в computedсвойствах и функ
        'vue/return-in-computed-property': 'error',
        // Это правило сообщает об изменении свойств компонента.
        'vue/no-mutating-props': 'error',
        // Принудительно размещать свойства объекта на отдельных строках в<template>
        'vue/object-property-newline': 'error',
        // Обеспечить расположение первого атрибута
        'vue/first-attribute-linebreak': 'error',
        // Обеспечить последовательный отступ в<script>
        'vue/script-indent': ['error', 4, { baseIndent: 1, switchCase: 1 }],
        // Обеспечить последовательный отступ в<template>
        'vue/html-indent': [
            'error',
            4,
            {
                attribute: 1,
                baseIndent: 1,
                closeBracket: 0,
                alignAttributesVertically: true,
                ignores: [],
            },
        ],
        // Запретить неиспользуемые переменные
        'no-unused-vars': 'off',

        // allow debugger during development only
        'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
        // Отключние проверка на название компонентов
        'vue/multi-word-component-names': 0,
        // Отступ перед templae style script
        //"indent": ["error", "tab"],
        // Запрещаем var вместо него let const
        'no-var': 'error',
        // Одинарные ковычки
        quotes: ['error', 'single'],
        // Интервал между блоками
        'space-before-blocks': 'error',
        // Обеспечьте постоянный интервал перед functionоткрывающей скобкой определения
        'space-before-function-paren': ['error', { anonymous: 'always', named: 'never', asyncArrow: 'always' }],
        // Обеспечьте постоянный интервал до и после стрелки в стрелочных функциях
        'arrow-spacing': 'error',
        // Требовать круглых скобок вокруг аргументов стрелочной функции
        'arrow-parens': 'error',
        // Запретить стрелочные функции, если их можно спутать со сравнениями.
        'no-confusing-arrow': 'error',
        // Запретить неправильные пробелы
        'no-irregular-whitespace': 'off',
        // Принудительное расположение тел функций стрелок
        'implicit-arrow-linebreak': 'error',
        // Запретить повторяющиеся члены класса
        'no-dupe-class-members': 'error',
        // Требовать использования ===и!==
        eqeqeq: ['off', 'smart'],
        // Запретить использованиеeval()
        'no-eval': 'error',
        // Обеспечьте согласованный стиль фигурных скобок для всех операторов управления
        curly: ['error', 'all'],
        // Точка запятой в конце строки
        semi: [2, 'always'],
        // Запретить использование console
        //'no-console': ['error', { allow: ['warn', 'error', 'info'] }],
        // Запретить несколько пустых строк
        'no-multiple-empty-lines': ['error', { max: 2, maxEOF: 0 }],
        // Обеспечить постоянный интервал до и после ключевых слов
        'keyword-spacing': ['error', { before: true, after: true }],
        // Запрещает пользовательские модули и пространства имен TypeScript.
        'no-namespace': 'off',
        // Обеспечьте максимальное количество строк кода в функции
        'max-lines-per-function': ['error', { max: 55, skipComments: true, skipBlankLines: true }],
        // Принудительное размещение свойств объекта на отдельных строках
        'object-property-newline': 'error',
    },
};

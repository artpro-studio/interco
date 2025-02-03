/**
 * Локализация клиентских ошибок валидации
 */
const ValidationRulesText = {
    /**
     * Обязательное поле
     */
    get required() {
        return 'Обязательное поле';
    },
    /**
     * Некорректный email
     */
    get email() {
        return 'Некорректный email';
    },
    /**
     * Минимальная длина символов
     */
    get minLength() {
        return 'Минимальная длина 10 символов';
    },
    /**
     * Значения полей должны совпадать
     */
    get mustMatch() {
        return 'Пароли должны совпадать';
    },
    /**
     * Только числа, запятые и точки
     */
    get number() {
        return 'Допустимые символы: цифры, точка и запятая';
    },
    /**
     * Некорректный пароль
     */
    get notValidPassword() {
        return 'Вы ввели неверный пароль';
    },
    get notValidLink() {
        return 'Некорректная ссылка';
    }
};

export default ValidationRulesText;


declare global {
    interface Number {
        cased: (this: number | null | undefined, one: string, two: string, five: string, includeNumber: boolean) => string;
    }

    interface Date {
        toServerFormat: (this: Date, isLocal?: boolean) => string;
    }
}

/**
 * Форматирует объект Date в формат YYYY-MM-DDTHH:mm:ss (2021-08-31T05:00:00) часовой пояс UTC±0:00
 * @param date Объект даты для форматирования
 */
function convertDateToServerFormat(date: Date): string {
    const isoDate = date.toJSON();
    return isoDate.slice(0, isoDate.indexOf('.'));
}
/**
 * Форматирует объект Date в формат YYYY-MM-DDTHH:mm:ss (2021-08-31T05:00:00) в местном часовом поясе
 * @param date Объект даты для форматирования
 * @returns
 */
function convertDateToServerFormatLocal(date: Date): string {
    const utcFromLocal = new Date(Date.UTC(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds()));
    return convertDateToServerFormat(utcFromLocal);
}

/**
 * Форматирует объект Date в формат YYYY-MM-DDTHH:mm:ss (2021-08-31T05:00:00)
 * @param isLocal Использовать ли локальный часовой пояс клиента (если false, то используется часовой пояс UTC±0:00)
 */
function toServerFormat(this: Date, isLocal: boolean = true): string {
    return isLocal ? convertDateToServerFormatLocal(this) : convertDateToServerFormat(this);
}

Date.prototype.toServerFormat = toServerFormat;

export {};

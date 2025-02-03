// eslint-disable-next-line max-lines-per-function
export default function useDateUntil() {
    // return 2021-03-07T00:00 from new Date()
    const getFormatServerDateTime = (date: Date): string  => {
        // Прибавляем 1 так как в JS месяцы нумеруются с нуля
        const monthIndex = date.getMonth() + 1;
        const month = monthIndex < 10 ? '0' + monthIndex : monthIndex;
        const day = date.getDate() < 10 ? '0' + date.getDate() : date.getDate();
        const hours = date.getHours() < 10 ? '0' + date.getHours() : date.getHours();
        const minutes = date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes();
        return `${date.getFullYear()}-${month}-${day}T${hours}:${minutes}`;
    };

    // return 2021-03-07T00:00:00 07.03.2021 from 07.03.2021, 12:00
    const getDateInterfaceToServer = (date: string, lang: string): string => {
        const arrayFullDate = date.split(',');
        const arrayDate = arrayFullDate[0].split('.');
        // Проверка на времмя
        let time = 'T00:00';
        if (arrayFullDate[1]) {
            let arrayTime = arrayFullDate[1].split(':');
            // Убираем пробелы
            arrayTime = arrayTime.map((el: string) => el.trim());
            const hour = arrayTime[0] ? arrayTime[0] : '00';
            const minuts = arrayTime[1] ? arrayTime[1] : '00';
            time = `T${hour}:${minuts}`;
        }
        if (lang === 'en') {
            return `${arrayDate[2]}-${arrayDate[0]}-${arrayDate[1]}${time}`;
        }
        return `${arrayDate[2]}-${arrayDate[1]}-${arrayDate[0]}${time}`;
    };

    // return 07.03.2021
    const getDateDayMonthYear = (isoString: Date | string): string => {
        return new Date(isoString).toLocaleDateString('ru', {
            day: 'numeric',
            month: 'numeric',
            year: 'numeric'
        }).toString();
    };

    // return 7 Марта from 2021-03-07T00:00:00
    const getDateWithMonths = (isoString: Date | string): string => {
        return new Date(isoString).toLocaleDateString('ru', {
            day: 'numeric',
            month: 'long',
        }).toString();
    };

    // return 7 мар from 2021-03-07T00:00:00
    const getDateWithShortMonths = (isoString: Date | string): string => {
        return new Date(isoString).toLocaleDateString('ru', {
            day: 'numeric',
            month: 'short',
        }).toString();
    };

    // Смещение от UTC в минутах на текущем устройстве, если часовой пояс устройства
    // UTC+1, то вернёт 60
    const getDeviceTimezoneOffset = () => {
        return getTimezoneOffset(new Date());
    };

    // Смещение от UTC в минутах, если часовой пояс параметра date UTC+1, то вернёт 60
    const getTimezoneOffset = (date: Date) => {
        // Стандартный метод возвращает сколько минут нужно прибавить, чтобы было время UTC, поэтому
        // для положительного смещения от UTC значения возвращаются отрицательные
        return -(date.getTimezoneOffset());
    };

    // return 08:45 from 2021-03-07T08:45:00
    const getTime = (isoString: Date | string): string => {
        // Поскольку мы не передаем часовой пояс, время может быть интерпретировано в UTC и привестись к длкальному
        // часовому поясу. Чтобы этого избежать, нужно самостоятельно распарсить строку
        const date = typeof isoString !== 'string'
            ? isoString
            : parseIsoLocal(isoString);

        // Для времени  в 24-часовом всегда указываем русскую локаль, так как в англоязычной локали 00:хх отображается как 24:хх
        return date.toLocaleTimeString(['ru'], {
            hour12: false,
            hour: '2-digit',
            minute: '2-digit'
        });
    };

    const parseIsoLocal = (isoString: string): Date => {
        const parts = isoString
            .split(/\D/)
            .map((value: string) => Number.parseInt(value));

        return new Date(parts[0], parts[1] - 1, parts[2], parts[3], parts[4], 0);
    };

    /**
     * Возвращает строку, часов склоненную в зависимости от значения объёма
     * @param hours - количество часов
     * @param includeNumber - нужно ли добавить цифру
     */
    const getHoursString = (hours: number | null | undefined, includeNumber: boolean = false): string | null => {
        if (!hours) {
            return null;
        }
        return hours.cased(
            'час',
            'часа',
            'часов',
            includeNumber);
    };

    /**
     * Возвращает строку, которая отображет количество прошедшего времени, т.е. 7д 8ч 23мин 43сек
     * @param durationSec - количество секунд
     * @param isFullName - нужно или использовать полные названия ("минута", а не "мин" и тд)
     */
    // eslint-disable-next-line max-lines-per-function
    const getDurationTimeString = (durationSec: number, isFullName: boolean = false): string => {
        durationSec = Math.ceil(durationSec);
        const secondsInMinute = 60;
        const secondsInHour = secondsInMinute * 60;
        const secondsInDay = secondsInHour * 24;

        const days = Math.floor(durationSec / secondsInDay);
        durationSec -= days * secondsInDay;

        const hours = Math.floor(durationSec / secondsInHour);
        durationSec -= hours * secondsInHour;

        const minutes = Math.floor(durationSec / secondsInMinute);
        durationSec -= minutes * 60;

        const tmp = [];
        if (days) {
            if (isFullName) {
                tmp.push(days.cased(
                    'день',
                    'дня',
                    'дней',
                    true,
                ));
            } else {
                tmp.push(days + 'д');
            }
        }

        if (days || hours) {
            if (isFullName) {
                tmp.push(hours.cased(
                    'час',
                    'часа',
                    'часов',
                    true,
                ));
            } else {
                tmp.push(hours + 'ч');
            }
        }

        if (days || hours || minutes) {
            if (isFullName) {
                tmp.push(minutes.cased(
                    'минута',
                    'минуты',
                    'минут',
                    true,
                ));
            } else {
                tmp.push(minutes + 'мин');
            }
        }

        if (isFullName) {
            if (!minutes) {
                tmp.push(durationSec.cased(
                    'секунда',
                    'секунды',
                    'секунд',
                    true,
                ));
            }
        } else {
            if (durationSec > 0) {
                tmp.push(durationSec + 'сек');
            }
        }

        return tmp.join(' ');
    };

    // return 3 Ноября, 07:00 — 10 Декабря, 07:00
    const getFormattedDateRange = (startDate: Date | string | undefined, endDate: Date | string | undefined): string => {
        if (!startDate && !endDate) {
            return '';
        }

        let formattedDate = '';

        if (startDate) {
            formattedDate = `${getDateWithMonths(startDate)}, ${getTime(startDate)}`;
        }

        if (endDate) {
            formattedDate += startDate ? ' — ' : ' ';
            const start = new Date(startDate!);
            const end = new Date(endDate);

            if (start.getDate() === end.getDate() && start.getMonth() === end.getMonth()) {
                formattedDate += getTime(endDate);
            } else {
                formattedDate += `${getDateWithMonths(endDate)}, ${getTime(endDate)}`;
            }
        }

        return formattedDate;
    };

    // Диапазон дат в формате DD.MM.YYYY – DD.MM.YYYY
    // return 15.06.2021 – 09.08.2021,
    const getFormattedShortDateRange = (startDate: Date | string | null, endDate: Date | string | null): string => {
        if (!startDate && !endDate) {
            return '';
        }

        let formattedDate = '';

        if (startDate) {
            formattedDate = `${getDateDayMonthYear(startDate)}`;
        }

        if (endDate) {
            formattedDate += startDate ? ' — ' : 'до' + ' ';
            formattedDate += `${getDateDayMonthYear(endDate)}`;
        }

        return formattedDate;
    };
    // return 15.06.2021, 10:00 from 2021-03-07T08:45:00
    const getFormattedDateTime = (date: Date | string | undefined): string => {
        let formattedDate = '';
        if (date) {
            formattedDate = `${getDateDayMonthYear(date)}, ${getTime(date)}`;
        }
        return formattedDate;
    };

    // Диапазон дат в формате DD.MM.YYYY, TT – DD.MM.YYYY, TT
    // return 15.06.2021, 10:00 – 09.08.2021, 18:00
    const getFormattedShortWithTimeDateRange = (startDate: Date | string | null, endDate: Date | string | null): string => {
        if (!startDate && !endDate) {
            return '';
        }

        let formattedDate = '';

        if (startDate) {
            formattedDate = `${getDateDayMonthYear(startDate)}, ${getTime(startDate)}`;
        }

        if (endDate) {
            formattedDate += startDate ? ' — ' : 'до' + ' ';
            formattedDate += `${getDateDayMonthYear(endDate)}, ${getTime(endDate)}`;
        }

        return formattedDate;
    };

    // Является ли дата сегодняшним днем
    const isToday = (isoString: Date | string) :boolean => {
        const today = new Date();
        const date = new Date(isoString);
        return date.getDate() == today.getDate() &&
            date.getMonth() == today.getMonth() &&
            date.getFullYear() == today.getFullYear();
    };

    // Является ли дата вчера
    const isYesterday = (isoString: Date | string) :boolean => {
        const today = new Date();
        const yesterday = new Date(today.setDate(today.getDate() - 1));
        const date = new Date(isoString);
        return date.getDate() == yesterday.getDate() &&
            date.getMonth() == yesterday.getMonth() &&
            date.getFullYear() == yesterday.getFullYear();
    };

    // Является ли дата before yesterday
    const isBeforeYesterday = (isoString: Date | string) :boolean => {
        const today = new Date();
        const beforeYesterday = new Date(today.setDate(today.getDate() - 2));
        const date = new Date(isoString);
        return date.getDate() == beforeYesterday.getDate() &&
            date.getMonth() == beforeYesterday.getMonth() &&
            date.getFullYear() == beforeYesterday.getFullYear();
    };

    // Когда время приходит в UTC, оно может нам придти из api и из вебсокетов
    // но формат почему-то разный, несмотря на то, что и там и там UTC
    // Из api приходит - "2022-07-29T10:12:22.777502"
    // Из вебсокетов приходит - "2022-07-29T10:12:22.777502Z" - есть буква Z на конце
    // из-за этой 'Z' JS время в UTC приводит к локальному
    // эта функция сделана для того, чтобы вырезать Z из строки времени
    const trimTimeZone = (date: string) => {
        if (date[date.length - 1] === 'Z') {
            return date.substring(0, date.length - 1);
        }

        return date;
    };

    // return 3 октября 2022 from new Date
    const getDayMonthYearLong = (date: string) => {
        return new Date(date).toLocaleDateString('ru', {
            day: 'numeric',
            month: 'long',
            year: 'numeric',
        });
    };

    // return 3 окт 2022 from new Date
    const getDayMonthYearShort = (date: string) => {
        return new Date(date).toLocaleDateString('ru', {
            day: 'numeric',
            month: 'short',
            year: 'numeric',
        });
    };

    const getDayWithMonth = (date: string) => {
        return new Date(date).toLocaleDateString('ru', {
            day: 'numeric',
            month: 'long'
        });
    };

    // Получить название для недели (понедельник, вторник и тд)
    const getDayName = (date: string): string => {
        const dateString = new Date(date).toLocaleDateString('ru', {
            weekday: 'long'
        });

        // тк название дня возвращается маленькими буквами, делаем первый символ большим
        return dateString.charAt(0).toUpperCase() + dateString.slice(1);
    };

    return {
        getFormatServerDateTime,
        getDateInterfaceToServer,
        getDateDayMonthYear,
        getDateWithMonths,
        getDateWithShortMonths,
        getDeviceTimezoneOffset,
        getTimezoneOffset,
        getTime,
        parseIsoLocal,
        getHoursString,
        getDurationTimeString,
        getFormattedDateRange,
        getFormattedShortDateRange,
        getFormattedDateTime,
        getFormattedShortWithTimeDateRange,
        isToday,
        isYesterday,
        isBeforeYesterday,
        trimTimeZone,
        getDayMonthYearLong,
        getDayMonthYearShort,
        getDayWithMonth,
        getDayName,
    };
}

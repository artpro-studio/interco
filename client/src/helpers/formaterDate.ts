// return 07.03.2021
export const getDateDayMonthYear = (isoString: Date | string | undefined | null): string => {
	if (!isoString) {
		return '';
	}

	return new Date(isoString)
		.toLocaleDateString('ru', {
			day: 'numeric',
			month: 'numeric',
			year: 'numeric',
		})
		.toString();
};

// return 08:45 from 2021-03-07T08:45:00
export const getTime = (isoString: Date | string): string => {
	// Поскольку мы не передаем часовой пояс, время может быть интерпретировано в UTC и привестись к длкальному
	// часовому поясу. Чтобы этого избежать, нужно самостоятельно распарсить строку
	const date = typeof isoString !== 'string' ? isoString : parseIsoLocal(isoString);

	// Для времени  в 24-часовом всегда указываем русскую локаль, так как в англоязычной локали 00:хх отображается как 24:хх
	return date.toLocaleTimeString(['ru'], {
		hour12: false,
		hour: '2-digit',
		minute: '2-digit',
	});
};

// return 15/23 from 2021-03-07T00:00:00
export const getMonthWithYear = (isoString: Date | string): string => {
	return new Date(isoString)
		.toLocaleDateString('ru', {
			month: 'numeric',
			year: 'numeric',
		})
		.toString().split('.').join('/');
};


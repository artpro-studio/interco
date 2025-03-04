export const formatterPhone = (phone?: string): string => {
	if (phone) {
		const phoneArray = phone.split('(ext')[0];
		return 'tel:' + (phoneArray || phone);
	}
	return '';
};

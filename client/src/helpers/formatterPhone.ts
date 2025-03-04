export const formatterPhone = (phone: string): string => {
	const phoneArray = phone.split('(ext')[0];
	return 'tel:' + (phoneArray || phone);
};

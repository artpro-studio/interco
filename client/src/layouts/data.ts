import { RouterName } from 'src/router/routerName';

export const menuData = [
	{
		title: 'menuProducts',
		path: RouterName.Products,
	},
	{
		title: 'menuService',
		path: RouterName.Services,
	},
	{
		title: 'menuCompany',
		path: RouterName.About,
	},
	{
		title: 'menuNews',
		path: RouterName.News,
	},
	{
		title: 'menuContacts',
		path: RouterName.Contacts,
	},
];

export const menuFooter = [
	[
		{
			link: RouterName.Policy,
			title: 'footerPolyce',
		},
		{
			link: RouterName.Contacts,
			title: 'footerContact',
		},
		{
			link: RouterName.Clients,
			title: 'footerFaq',
			hash: 'faq',
		},
	],
	[
		{
			link: RouterName.Home,
			title: 'footerStatus',
			isModal: true,
		},
		{
			link: RouterName.Partners,
			title: 'footerPartner',
		},
		{
			link: RouterName.Career,
			title: 'footerJobs',
		},
	],
];

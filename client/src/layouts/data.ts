import { RouterName } from "src/router/routerName";

export const menuData = [
	{
		title: 'menuService',
		path: RouterName.Services,
	},
	{
		title: 'menuCompany',
		path: RouterName.About,
	},
	{
		title: 'menuProduct',
		path: RouterName.Clients,
	},
	{
		title: 'menuProject',
		path: RouterName.Services,
	},
	{
		title: 'menuNews',
		path: RouterName.News,
	},
	{
		title: 'menuContacts',
		path: RouterName.Contacts,
	},
]

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
			link: RouterName.About,
			title: 'footerFaq',
		},
	],
	[
		{
			link: '/',
			title: 'footerStatus'
		},
		{
			link: RouterName.Partners,
			title: 'footerPartner'
		},
		{
			link: RouterName.Career,
			title: 'footerJobs'
		},
	],
];

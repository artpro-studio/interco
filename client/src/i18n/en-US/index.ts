// This is just an example,
// so you can safely delete all default props below
import Head from './home/head';
import Company from './home/company';
import Direction from './home/direction';
import Global from './home/global';
import Map from './home/map';
import Advantages from './home/advantages';
import Project from './home/project';
import Career from './home/career';
import Contacts from './home/contacts';
import Form from './home/form';
import Footer from './footer';
import Policy from './policy';

export default {
	failed: 'Action failed',
	success: 'Action was successful',
	menuService: 'Service',
	menuCompany: 'About company',
	menuProduct: 'Products',
	menuProject: 'Projects',
	menuNews: 'News',
	menuContacts: 'Contacts',
	headerStatusLink: 'Order status',
	moreDetailed: 'More detailed',
	submitApplication: 'Submit your application',
	...Head,
	...Company,
	...Direction,
	...Global,
	...Map,
	...Advantages,
	...Project,
	...Career,
	...Contacts,
	...Form,
	...Footer,
	...Policy,
};

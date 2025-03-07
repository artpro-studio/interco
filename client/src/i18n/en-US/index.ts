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
import CareerPage from './career';
import ServicesPage from './services';
import PartnersPage from './partners';
import ClientsPage from './clients';
import ClientsNews from './news';
import Social from './Social';
import BannerCallback from './bannerCallback';
import ContactsPage from './contacts';
import AboutPages from './about';

export default {
	failed: 'Action failed',
	success: 'Action was successful',
	menuProducts: 'Products',
	menuService: 'Services',
	menuCompany: 'About Us',
	menuProduct: 'Products',
	menuProject: 'Projects',
	menuNews: 'News',
	menuContacts: 'Contacts',
	headerStatusLink: 'Order status',
	moreDetailed: 'More detailed',
	submitApplication: 'Submit your application',
	firstName: 'Name',
	lastName: 'Surname',
	middleName: 'Middle name',
	position: 'Post',
	formTitle: 'Application',
	formCallbackTitle: 'SUPPORT FORM',
	formCallbackText:
		'We are here to assist with any technical questions or issues. Please fill out the form so we can contact you promptly and provide the necessary support.',
	formEmail: 'Your e-mail',
	formCompany: 'Company',
	formMessage: 'Message',
	formRequest: 'Request',
	formRequestText:
		'Please describe your request or the required service in detail. Specify specific requirements, important details, and any additional information (such as deadlines, conditions, etc.) that will help us accurately understand and effectively complete your task. The more accurate the description, the faster and better we will be able to provide assistance.',
	formDelivary: 'Place of delivery',
	formFile: 'Attach a file',
	formPolicy: 'I give my consent to the processing of personal data in accordance with the privacy policy',
	formBtn: 'Submit',
	fromValidateChecked: 'You have not given your consent to the processing of personal data',
	validateTextRequired: 'Required field',
	validateTextEmail: 'Invalid email',
	validateTextMinLength: 'Minimum length of 10 characters',
	validateTextPassword: 'Passwords must match',
	validateTextNumber: 'Valid characters: digits, dot and comma',
	validateTextNotPassword: 'You entered an incorrect password',
	validateTextLink: 'Invalid Link',
	modalSuccessTitle: 'Your application has been accepted',
	modalSuccessText: 'We will contact you soon.',
	phone: 'Phone',
	address: 'Address',
	email: 'Email',
	timeJob: 'Working hours',
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
	...CareerPage,
	...ServicesPage,
	...PartnersPage,
	...ClientsPage,
	...ClientsNews,
	...Social,
	...BannerCallback,
	...ContactsPage,
	...AboutPages,
};

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
import CareerPage from './career'
import ClientsPage from './clients'

export default {
	failed: 'Action failed',
	success: 'Action was successful',
	menuService: 'Услуги',
	menuCompany: 'О компании',
	menuProduct: 'Продукция',
	menuProject: 'Проекты',
	menuNews: 'Новости',
	menuContacts: 'Контакты',
	headerStatusLink: 'Статус заказа',
	moreDetailed: 'Подробнее',
	submitApplication: 'Оставить заявку',
	phone: 'Телефон',
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
	...ClientsPage,
  };

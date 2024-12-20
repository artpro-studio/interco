
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
import ClientsNews from './news'
import Social from './Social'
import BannerCallback from './bannerCallback'
import ContactsPage from './contacts'

export default {
	failed: 'Action failed',
	success: 'Action was successful',
	menuService: '服务',
	menuCompany: '关于公司',
	menuProduct: '产品介绍',
	menuProject: '工程项目',
	menuNews: '新闻',
	menuContacts: '联络人',
	headerStatusLink: '订单状况',
	moreDetailed: '更详细',
	submitApplication: '递交申请',
	phone: '电话',
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
	...ClientsNews,
	...Social,
	...BannerCallback,
	...ContactsPage,
};

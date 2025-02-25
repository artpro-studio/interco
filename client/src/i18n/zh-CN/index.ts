
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
import ServicesPage from './services'
import PartnersPage from './partners'
import ClientsPage from './clients'
import ClientsNews from './news'
import Social from './Social'
import BannerCallback from './bannerCallback'
import ContactsPage from './contacts'
import AboutPages from './about'

export default {
	failed: 'Action failed',
	success: 'Action was successful',
	menuProducts: '产品中心',
	menuService: '服务',
	menuCompany: '关于我们',
	menuProduct: '产品',
	menuProject: '项目',
	menuNews: '新闻',
	menuContacts: '联系方式',
	headerStatusLink: '订单状况',
	moreDetailed: '更详细',
	submitApplication: '递交申请',
	firstName: '姓名',
    lastName: '姓',
    middleName: '中间名',
    position: '职位',
	phone: '電話',
	formTitle: '申请表格',
	formEmail: '你的电子邮件',
	formRequest: '请求',
	formRequestText: '请详细描述您的要求或所需的服务. 指定具体要求，重要细节和任何其他信息（如截止日期，条件等）。 这将帮助我们准确理解并有效地完成您的任务。 描述越准确，我们就能更快更好地提供帮助。',
	formDelivary: '交货地点',
	formFile: '附加档案',
	formPolicy: '本人同意根据私隐政策处理个人资料',
	formBtn: '提交',
	address: '地址',
	email: '电邮',
	timeJob: '工作时间',
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

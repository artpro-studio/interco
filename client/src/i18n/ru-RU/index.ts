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
	menuProducts: 'Продукты',
	menuService: 'Услуги',
	menuCompany: 'О компании',
	menuProduct: 'Продукция',
	menuProject: 'Проекты',
	menuNews: 'Новости',
	menuContacts: 'Контакты',
	headerStatusLink: 'Статус заказа',
	moreDetailed: 'Подробнее',
	submitApplication: 'Оставить заявку',
	firstName: 'Имя',
	lastName: 'Фамилия',
	middleName: 'Отчество',
	position: 'Должность',
	phone: 'Телефон',
	formTitle: 'Заявка',
	formCallbackTitle: 'ФОРМА ТЕХНИЧЕСКОЙ ПОДДЕРЖКИ',
	formCallbackText:
		'Мы поможем с любыми техническими вопросами или проблемами. Пожалуйста, заполните форму, чтобы мы могли оперативно связаться с вами и предоставить необходимую поддержку.',
	formEmail: 'Ваш e-mail',
	formCompany: 'Компания',
	formMessage: 'Сообщение',
	formRequest: 'Запрос',
	formRequestText:
		'Пожалуйста, подробно опишите ваш запрос или необходимую услугу. Укажите конкретные требования, важные детали и любую дополнительную информацию(например, сроки, условия и т. д.), которая поможет нам точно понять и эффективно выполнить вашу задачу. Чем точнее описание, тем быстрее и качественнее мы сможем предоставить помощь.',
	formDelivary: 'Место доставки',
	formFile: 'Прикрепить файл',
	formPolicy: 'Даю согласие на обработку персональных данных, согласно политике конфиденциальности',
	formBtn: 'Отправить',
	formCaptchaText: 'Капча обязательное поле',
	fromValidateChecked: 'Вы не не дали согласие на обработку персональных данных',
	validateTextRequired: 'Обязательное поле',
	validateTextEmail: 'Некорректный email',
	validateTextMinLength: 'Минимальная длина 10 символов',
	validateTextPassword: 'Пароли должны совпадать',
	validateTextNumber: 'Допустимые символы: цифры, точка и запятая',
	validateTextNotPassword: 'Вы ввели неверный пароль',
	validateTextLink: 'Некорректная ссылка',
	modalSuccessTitle: 'Ваша заявка принята',
	modalSuccessText: 'Мы скоро свяжемся с Вами',
	address: 'Адрес',
	email: 'Электронная почта',
	timeJob: 'Время работы',
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

<script lang="ts" setup>
	import HeadGlobal from 'src/components/HeadGlobal/HeadGlobal.vue';
	import PartnersAdvantages from './components/PartnersAdvantages.vue';
	import PartnersPrinciples from './components/PartnersPrinciples.vue';
	import PartnersHowBecome from './components/PartnersHowBecome.vue';
	import PartnersCooperation from './components/PartnersCooperation.vue';
	import PartnersStep from './components/PartnersStep.vue';
	import PartnersContacts from './components/PartnersContacts.vue';
	import PartnersProgram from './components/PartnersProgram.vue';
	import PartnersInfo from './components/PartnersInfo.vue';
	import PartnersForm from './components/PartnersForm.vue';
	import ClientsContacts from 'src/components/ClientsContacts/ClientsContacts.vue';
	import BannerSaInternational from 'src/components/BannerSaInternational/BannerSaInternational.vue';
</script>
<template>
	<head-global
		width-title="957px"
		width-text="653px"
		title="Добро пожаловать в раздел для наших текущих и потенциальных партнеров"
		text="Компания SA International ценит долгосрочные и взаимовыгодные отношения с партнерами по всему миру. Мы открыты для сотрудничества и готовы предложить гибкие и эффективные решения для совместного развития и достижения общих целей."
		images="images/bg-partners.svg"
		:dense="false"
		:top="0"
	/>
	<partners-advantages />
	<partners-principles />
	<partners-how-become />
	<partners-cooperation />
	<partners-step />
	<partners-contacts />
	<partners-program />
	<partners-info />
	<partners-form />
	<clients-contacts>
		<template v-slot:column1>
			<div class="clients-contacts__item">
				<h6 class="clients-contacts__item__title text-gradient text-uppercase fonts-oswald">E-mail</h6>
				<div class="clients-contacts__item__link">
					<a href="mailto:partners@inter-sa.com">partners@inter-sa.com</a>
				</div>
			</div>
		</template>
		<template v-slot:column2>
			<div class="clients-contacts__item">
				<h6 class="clients-contacts__item__title text-gradient text-uppercase fonts-oswald">Телефон</h6>
				<div class="clients-contacts__item__link">
					<a href="tel:+8654322755">+86-5432-2755 (ext. 818)</a>
				</div>
			</div>
		</template>
		<template v-slot:column3>
			<div class="clients-contacts__item">
				<h6 class="clients-contacts__item__title text-gradient text-uppercase fonts-oswald">Адрес главного офиса</h6>
				<div class="clients-contacts__item__link">
					<p>Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-505</p>
				</div>
			</div>
		</template>
		<template v-slot:column4>
			<div class="clients-contacts__item">
				<h6 class="clients-contacts__item__title text-gradient text-uppercase fonts-oswald">Адрес главного офиса</h6>
				<div class="clients-contacts__item__link">
					<p>Дмитрий Александрович Гаврилов,
						Директор по развитию бизнеса</p>
				</div>
			</div>
		</template>
	</clients-contacts>
	<banner-sa-international title="SA International — " description="Вместе создаем будущее промышленности и технологий" />
</template>

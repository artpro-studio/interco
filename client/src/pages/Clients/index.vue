<script lang="ts" setup>
	import HeadGlobal from 'src/components/HeadGlobal/HeadGlobal.vue';
	import Support from './components/Support.vue';
	import ClientsBanner from './components/ClientsBanner.vue';
	import Faq from './components/Faq.vue';
	import ClientsForm from './components/ClientsForm.vue';
	import ClientsContacts from './components/ClientsContacts.vue';
	import ClientsSectionText from './components/ClientsSectionText.vue';
</script>

<template>
	<head-global
		width-title="957px"
		width-text="653px"
		title="Добро пожаловать в раздел для наших уважаемых клиентов"
		text="SA International стремится обеспечить высокий уровень сервиса и поддержки на каждом этапе сотрудничества. Мы ценим ваше доверие и делаем все возможное, чтобы вы были довольны нашей продукцией и услугами."
		images="images/clients-bg.png"
		:dense="false"
	/>
	<support />
	<clients-banner />
	<faq />
	<clients-form />
	<clients-contacts />
	<clients-section-text />
</template>

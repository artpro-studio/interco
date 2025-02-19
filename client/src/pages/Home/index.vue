<script lang="ts" setup>
	import HomeHead from './components/HomeHead.vue';
	import HomeComany from './components/HomeComany.vue';
	import HomeDirection from './components/HomeDirection.vue';
	import HomeDirectionInfo from './components/HomeDirectionInfo.vue';
	import HomeGlobal from './components/HomeGlobal.vue';
	import HomeMaps from './components/HomeMaps.vue';
	import HomeAdvantages from './components/HomeAdvantages.vue';
	import HomeProject from './components/HomeProject.vue';
	import HomeCareer from './components/HomeCareer.vue';
	import HomeContacts from './components/HomeContacts.vue';
	import HomeForm from './components/HomeForm.vue';
	import { computed, onMounted, ref } from 'vue';
	import { useGetMeta } from 'src/hooks/useGetMeta';
	import { getApiClientInitialParams, PagesPublicControllerClient, PagesPublicDto } from 'src/ApiClient/ApiClient';

	const SLUG_HOME_DIRECTION = 'home-direction';
	const SLUG_STRATAGY_PROJECT = 'stratagy-project';
	const SLUG_CONTACTS = 'home-contacts';

	const pagePublic = ref<PagesPublicDto | null>(null);

	const getHomeDirection = computed(() => {
		return pagePublic.value?.iblocks?.find((el) => el.slug === SLUG_HOME_DIRECTION)?.records;
	})

	const getContacts = computed(() => {
		const data: any = pagePublic.value?.iblocks?.find((el) => el.slug === SLUG_CONTACTS)?.records
		return data?.length ? data[0] : null;
	})

	const getStratagyProject = computed(() => {
		return pagePublic.value?.iblocks?.find((el) => el.slug === SLUG_STRATAGY_PROJECT);
	})

	const getInfo = () => {
		new PagesPublicControllerClient(getApiClientInitialParams()).getOneForSlug('home')
		.then((data) => {
			pagePublic.value = data.entity;
		})
	}

	onMounted(() => {
		useGetMeta('home')
		getInfo();
	})
</script>
<template>
	<q-page>
		<home-head />
		<home-comany />
		<home-direction :data="getHomeDirection" />
		<home-direction-info />
		<home-global />
		<home-maps />
		<home-advantages />
		<home-project :data="getStratagyProject" />
		<home-career />
		<home-contacts :data="getContacts" />
		<home-form />
	</q-page>
</template>

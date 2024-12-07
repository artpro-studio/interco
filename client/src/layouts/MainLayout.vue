
<script setup lang="ts">
	import { provide, ref } from 'vue';
	import MainHeaders from './components/MainHeaders.vue';
	import MobileMenu from './components/MobileMenu.vue';

	const leftDrawerOpen = ref(false);
	const widthScreen = ref(0);
	const scrollTop = ref(0);
	provide('widthScreen', widthScreen)
	provide('scrollTop', scrollTop)

	function toggleLeftDrawer () {
		leftDrawerOpen.value = !leftDrawerOpen.value;
	}

	const onResize = (size: {height: number; width: number;}) => {
		widthScreen.value = size.width;
	}

	const scrollHandler = ({position}: {position: {top: number}}) => {
		scrollTop.value = position.top;
	}
</script>

<template>
	<q-layout view="lHh lpr lFf" class="main-layout">
		<main-headers @on-click="toggleLeftDrawer"/>
		<mobile-menu v-model:value="leftDrawerOpen" @value:update="leftDrawerOpen = $event" />
		<q-page-container class="page-contaoner">
			<router-view />
		</q-page-container>

		<q-resize-observer @resize="onResize" />
		<q-scroll-observer @scroll="scrollHandler" />
  </q-layout>
</template>
<style lang="scss" scoped>
	.page-contaoner {
		padding-top: 0 !important;
	}
	.main-layout {
		background-color: var(--dark-blue);
		position: relative;
		&::before {
			content: '';
			background-image: url('images/bg.png');
			background-size: cover;
			width: 100%;
			height: 100%;
			position: absolute;
			top: 0;
			left: 0;
			opacity: .9;
			z-index: 0;
		}
	}
</style>

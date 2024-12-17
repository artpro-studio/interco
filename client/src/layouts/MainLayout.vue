
<script setup lang="ts">
	import { computed, provide, ref } from 'vue';
	import MainHeaders from './components/MainHeaders.vue';
	import MobileMenu from './components/MobileMenu.vue';
	import MainFooter from './components/MainFooter.vue';
	import { useRoute } from 'vue-router';

	const route = useRoute();

	const leftDrawerOpen = ref(false);
	const widthScreen = ref(0);
	const scrollTop = ref(0);
	provide('widthScreen', widthScreen)
	provide('scrollTop', scrollTop)

	const isWhite = computed(() => {
		return route.meta.background === 'white';
	})

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
	<q-layout view="lHh lpr lFf" class="main-layout" :class="{white: isWhite}">
		<div class="main-layout__body">
			<main-headers @on-click="toggleLeftDrawer"/>
			<mobile-menu v-model:value="leftDrawerOpen" @value:update="leftDrawerOpen = $event" />
			<q-page-container class="page-contaoner">
				<router-view />
			</q-page-container>
			<main-footer />
			<q-resize-observer @resize="onResize" />
			<q-scroll-observer @scroll="scrollHandler" />
		</div>
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

		&.white {
			background-color: #f5f5f5;

			&::before {
				display: none;
			}
		}

		&__body {
			position: relative;
		}
	}
</style>

<script lang="ts" setup>
	import { computed, inject, onMounted, ref } from 'vue';
	import { menuData } from '../data';
	import { useI18n } from 'vue-i18n';
	import { RouterName } from 'src/router/routerName';
	import { useRouter } from 'vue-router';
	import ModalApplication from 'src/components/Modal/ModalApplication.vue';

	interface IProps {
		value: boolean;
	}
	const props = defineProps<IProps>()
	const emit = defineEmits(['value:update'])
	const { t } = useI18n()
	const router = useRouter();

	const widthScreen = inject('widthScreen')

	const isOpenDialog = ref(false);
	const menuDataItems = ref(menuData);

	const leftDrawerOpen = computed({
		get: () => props.value,
		set: (value: boolean) => emit('value:update', value)
	})

	const getUrlPath = (name: RouterName) => {
		const path = router.resolve({
			name
		});

		return path.fullPath;
	}

	onMounted(() => {
		console.log(t('menuService'))
	})
</script>

<template>
	<q-drawer
		v-model="leftDrawerOpen"
		class="mobile-menu"
		side="right"
		:breakpoint="1024"
		:width="Number(widthScreen)"
		behavior="mobile"
		show-if-above
		overlay
	>
		<div class="container">
			<div class="mobile-menu__row">
				<div class="mobile-menu__wrap">
					<div class="mobile-menu__header">
						<q-btn
							class="headers__btn-menu text-white"
							flat
							dense
							round
							icon="menu"
							aria-label="Menu"
							@click="emit('value:update', false)"
						/>
					</div>
					<nav class="mobile-menu__body">
						<div
							v-for="(item, index) in menuDataItems"
							:key="index"
							class="mobile-menu__item text-right"
							clickable
						>
							<router-link :to="getUrlPath(item.path)" class="mobile-menu__item__link text-right text-white">{{ t(item.title) }}</router-link>
						</div>
					</nav>
				</div>

				<div class="mobile-menu__info">
					<div @click="isOpenDialog = true" class="mobile-menu__info__links row items-center no-wrap justify-end cursor-pointer">
						{{ t('headerStatusLink') }}
						<q-img src="icons/arrow.svg" width="16px" fit="contain" class="mobile-menu__info__links__img" />
					</div>
					<a href="tel:88000000000" class="mobile-menu__info__phone row items-center justify-end">8 800 000 00 00</a>
				</div>
			</div>
		</div>
	</q-drawer>
	<q-dialog v-model="isOpenDialog">
		<modal-application @on-close="isOpenDialog = false" />
	</q-dialog>
</template>
<style lang="scss">
	.q-drawer {
		background-color: var(--dark-blue);
	}
	.mobile-menu {
		padding-bottom: 48px;
		.container {
			height: 100%;
		}
		&__row {
			display: flex;
			flex-direction: column;
			justify-content: space-between;
			height: 100%;
		}
		&__header {
			padding: 32px 0;
			text-align: right;
		}

		&__item {
			margin-bottom: 24px;
			&__link {
				text-decoration: none;
				transition: .4s all;
				font-size: 32px;
				font-weight: bold;

				&:hover {
					color: var(--yellow);
				}
			}
		}

		&__info {
			font-size: 24px;
			font-weight: bold;
			text-align: right;

			&__links {
				margin-bottom: 12px;
				&__img {
					margin-left: 10px;
				}
			}

			&__links, &__phone {
				color: var(--white);
				text-decoration: none;
			}
		}
	}
</style>

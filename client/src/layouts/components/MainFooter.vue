<script lang="ts" setup>
	import { computed, ref } from 'vue';
	import { useI18n } from 'vue-i18n';
	import { menuFooter } from '../data';
	import { RouterName } from 'src/router/routerName';
	import { useRoute, useRouter } from 'vue-router';
	import { useStore } from 'src/store';
	import { FullSettingsDto } from 'src/ApiClient/ApiClient';
	import ModalApplication from 'src/components/Modal/ModalApplication.vue';

	const route = useRoute();
	const router = useRouter();
	const { t } = useI18n();
	const store = useStore();

	const footerMenu = ref(menuFooter);
	const isOpenDialog = ref(false);

	const getSettings = computed((): FullSettingsDto | undefined => {
		return store.getters['settingsModule/getSettings'];
	});

	const isWhite = computed(() => {
		return route.meta.background === 'white';
	});

	const getUrlPath = (name: RouterName) => {
		const path = router.resolve({
			name,
		});

		return path.fullPath;
	};

	const getPath = (name: RouterName, hash?: string) => {
		const path = router.resolve({ name, hash: hash ? `#${hash}` : undefined });
		return path.fullPath;
	};
</script>

<template>
	<footer class="footer pt-12 pb-12" :class="{ white: isWhite }">
		<div class="container">
			<div class="footer__body row items-start justify-between">
				<div class="footer__left">
					<div class="footer__logo">
						<router-link to="/" title="SA International" class="row items-center">
							<q-img src="images/logo.svg" height="42px" width="28px" fit="contain" />
							<span>SA<br />International</span>
						</router-link>
					</div>
					<div class="footer__social row no-wrap items-center">
						<a v-if="getSettings?.whatsapp" :href="getSettings?.whatsapp" class="footer__social__item">
							<q-img src="icons/whatsapp.svg" width="24px" />
						</a>
						<a v-if="getSettings?.discord" :href="getSettings?.discord" class="footer__social__item">
							<q-img src="icons/discord.svg" width="24px" />
						</a>
						<a v-if="getSettings?.telegram" :href="getSettings?.telegram" class="footer__social__item">
							<q-img src="icons/telegram.svg" width="24px" />
						</a>
					</div>
					<router-link :to="getUrlPath(RouterName.Policy)" class="footer__link fonts-oswald text-white">{{
						t('footerConsent')
					}}</router-link>
				</div>
				<div v-for="(item, index) in footerMenu" :key="index" class="footer__menu">
					<nav>
						<ul>
							<li v-for="(el, indx) in item" :key="indx">
								<router-link v-if="!el.isModal" :to="getPath(el.link, el.hash)">{{ t(el.title) }}</router-link>
								<a v-else class="cursor-pointer" @click="isOpenDialog = true">{{ t(el.title) }}</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</footer>
	<q-dialog v-model="isOpenDialog">
		<modal-application @on-close="isOpenDialog = false" />
	</q-dialog>
</template>
<style lang="scss" scoped>
	.footer {
		position: relative;
		&__logo {
			margin-bottom: 55px;
			a {
				text-decoration: none;
				font-weight: bold;
			}
			span {
				color: #fff;
				line-height: 1;
				display: block;
				margin-left: 10px;
			}
		}

		&__social {
			margin-bottom: 74px;
			&__item {
				background-color: rgba(50, 62, 102, 0.7);
				padding: 8px;
				border-radius: 8px;
				margin: 0 8px;
				transition: 0.4s all;
				display: flex;
				align-items: center;
				justify-content: center;

				&:hover {
					background-color: var(--red);
				}
			}
		}

		&__link {
			font-size: 0.9em;
		}

		&__menu {
			ul {
				list-style-type: none;
				margin: 0;
				padding: 0;

				li {
					margin: 0;
					padding: 0;

					a {
						font-family: 'Oswald', sans-serif;
						color: var(--white);
						font-size: 1.23em;
						line-height: 220%;
						text-decoration: none;
						transition: 0.4s all;

						&:hover {
							color: var(--red);
						}
					}
				}
			}
		}

		@media (max-width: 700px) {
			&__left {
				width: 100%;
				margin-bottom: 32px;
				padding-left: 10px;
			}

			&__logo {
				margin-bottom: 32px;
			}
			&__social {
				margin-bottom: 32px;
			}

			&__menu {
				margin-bottom: 12px;
			}
		}

		&.white {
			background-color: var(--dark-blue);
		}
	}
</style>

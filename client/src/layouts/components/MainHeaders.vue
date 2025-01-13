<script lang="ts" setup>
	import { computed, inject, ref } from 'vue';
	import { menuData } from '../data';
	import { useI18n } from 'vue-i18n';
	import { RouterName } from 'src/router/routerName';
	import { useRoute, useRouter } from 'vue-router';
	import lang from 'src/components/lang/lang.vue';
	import ModalApplication from 'src/components/Modal/ModalApplication.vue';

	const emit = defineEmits(['on-click'])
	const { t } = useI18n();
	const router = useRouter();
	const route = useRoute();

	const scrollTop = inject<number>('scrollTop', 0)

	const isOpenDialog = ref(false);
	const menuDataItems = ref(menuData)

	const isWhite = computed(() => {
		return route.meta.background === 'white';
	})

	const isHome = computed(() => {
		return route.name === RouterName.Home;
	})

	const getUrlPath = (name: RouterName) => {
		const path = router.resolve({
			name
		});

		return path.fullPath;
	}
</script>

<template>
	<q-header class="headers" :class="{'on-scroll': scrollTop > 70, white: isWhite}">
		<div class="container">
			<div class="headers__body row items-center justify-between">
				<div class="headers__logo">
					<router-link to="/" title="SA International" class="row items-center">
						<q-img src="images/logo.svg" height="42px" width="28px" fit="contain" />
						<span>SA<br>International</span>
					</router-link>
				</div>
				<nav class="headers__menu">
					<ul class="row">
						<li v-for="(item, index) in menuDataItems" :key="index" class="headers__menu__item">
							<router-link :to="getUrlPath(item.path)">{{ t(item.title) }}</router-link>
						</li>
					</ul>
				</nav>
				<div class="headers__actions row no-wrpa">
					<div @click="isOpenDialog = true" class="headers__actions__links row items-center no-wrap cursor-pointer" exact-active-class="active">
						{{ t('headerStatusLink') }}
						<q-img src="icons/arrow.svg" width="16px" fit="contain" class="headers__actions__links__img" />
					</div>
					<a href="tel:88000000000" class="headers__actions__phone row items-center">8 800 000 00 00</a>
					<q-btn
						class="headers__btn-menu"
						flat
						dense
						round
						icon="menu"
						aria-label="Menu"
						@click="emit('on-click')"
					/>
				</div>
			</div>
			<lang v-if="!isHome" class="headers__lang justify-end" />
		</div>
    </q-header>
	<q-dialog v-model="isOpenDialog">
		<modal-application @on-close="isOpenDialog = false" />
	</q-dialog>
</template>

<style lang="scss">
	.headers {
		&.on-scroll {
			.lang__item {
				color: var(--white) !important;
				opacity: .4 !important;

				&:hover {
					opacity: 1 !important;
				}

				&.active {
					opacity: 1 !important;
				}
			}

			.headers__menu {
				&__item {
					a {
						color: var(--white) !important;
						opacity: .7 !important;

						&:hover {
							opacity: 1 !important;
						}

						&.router-link-exact-active {
							opacity: 1 !important;
							color: var(--white);
						}
					}
				}
			}
			.headers__actions {
				&__links {
					color: var(--white) !important;
					transition: .4s all;

					&:hover {
						color: var(--yellow) !important;
					}
				}
				&__phone {
					color: var(--white) !important;
					transition: .4s all;

					&:hover {
						color: var(--yellow) !important;
					}
				}
			}
			.headers__logo {
				span {
					color: var(--white) !important;
				}
			}
			.headers__btn-menu {
				color: var(--white) !important;
			}

		}
	}
</style>

<style lang="scss" scoped>
	.headers {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		background-color: transparent;
		box-shadow: none;
		padding: 40px 0;
		transition: .4s all;

		&.on-scroll {
			background-color: var(--dark-blue);
			padding: 20px 0;

			.headers__lang {
				padding-top: 00px;
			}
		}

		@media (max-width: $breakpoint-md-min) {
			padding: 24px 0;
		}

		&__lang {
			padding-top: 30px;
			transition: .4s all;
		}

		&__logo {
			a {
				text-decoration: none;
			}
			span {
				color: #fff;
				line-height: 1;
				display: block;
				margin-left: 10px;
			}
		}
		&__menu {
			@media (max-width: $breakpoint-md-min) {
				display: none;
			}
			ul {
				list-style-type: none;
				margin: 0;
				padding: 0;
			}

			&__item {
				margin: 0 16px;

				@media (max-width: 1100px) {
					margin: 0 10px;
				}

				a {
					font-size: 0.9em;
					color: #fff;
					text-decoration: none;
					opacity: .7;
					transition: .4s all;

					&:hover {
						opacity: 1;
					}

					&.router-link-exact-active {
						opacity: 1 !important;
						color: var(--white);
					}
				}
			}
		}

		&__actions {

			&__links {
				line-height: 1;
				color: var(--white);
				text-decoration: none;
				text-transform: uppercase;
				font-size: .83em;
				white-space: nowrap;
				margin-right: 16px;
				font-weight: bold;
				transition: .4s all;

				&__img {
					margin-left: 10px;
				}

				@media (max-width: $breakpoint-sm-min) {
					display: none;
				}

				&:hover {
					color: var(--yellow) !important;
				}
			}

			&__phone {
				font-size: 0.95em;
				margin-left: 18px;
				color: var(--white);
				text-decoration: none;
				font-weight: bold;
				transition: .4s all;

				@media (max-width: $breakpoint-sm-min) {
					display: none;
				}

				&:hover {
					color: var(--yellow) !important;
				}
			}

			@media (max-width: 1100px) {
				&__links {
					margin-right: 8px;
				}
			}
		}

		&__btn-menu {
			display: none;
			margin-left: 16px;

			@media (max-width: $breakpoint-md-min) {
				display: flex;
			}
		}

		&.white {
			.headers__menu {
				&__item {
					a {
						color: rgba(136, 136, 145, 1);

						&:hover {
							color: var(--dark-blue);
						}

						&.router-link-exact-active {
							opacity: 1 !important;
							color: var(--dark-blue);
						}
					}
				}
			}
			.headers__actions {
				&__links {
					color: var(--dark-blue);
					font-weight: bold;
				}
				&__phone {
					color: var(--dark-blue);
					font-weight: bold;
				}
			}
			.headers__logo {
				span {
					color: var(--dark-blue);
					font-weight: bold;
				}
			}
			.headers__btn-menu {
				color: var(--dark-blue);
			}
		}
	}
</style>

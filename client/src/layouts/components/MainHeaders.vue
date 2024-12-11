<script lang="ts" setup>
	import { inject, ref } from 'vue';
	import { menuData } from '../data';
	import { useI18n } from 'vue-i18n';
	import { RouterName } from 'src/router/routerName';
	import { useRouter } from 'vue-router';

	const emit = defineEmits(['on-click'])
	const { t } = useI18n();
	const router = useRouter();

	const scrollTop = inject<number>('scrollTop', 0)

	const menuDataItems = ref(menuData)

	const getUrlPath = (name: RouterName) => {
		const path = router.resolve({
			name
		});

		return path.fullPath;
	}
</script>

<template>
	<q-header class="headers" :class="{'on-scroll': scrollTop > 70}">
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
					<router-link to="/" class="headers__actions__links row items-center no-wrap">
						{{ t('headerStatusLink') }}
						<q-img src="icons/arrow.svg" width="16px" fit="contain" class="headers__actions__links__img" />
					</router-link>
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
		</div>
    </q-header>
</template>

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
		}

		@media (max-width: $breakpoint-md-min) {
			padding: 24px 0;
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

				&__img {
					margin-left: 10px;
				}

				@media (max-width: $breakpoint-sm-min) {
					display: none;
				}
			}

			&__phone {
				font-size: 0.95em;
				margin-left: 18px;
				color: var(--white);
				text-decoration: none;

				@media (max-width: $breakpoint-sm-min) {
					display: none;
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
	}
</style>

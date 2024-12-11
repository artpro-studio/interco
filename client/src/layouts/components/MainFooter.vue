<script lang="ts" setup>
	import { ref } from 'vue';
import { useI18n } from 'vue-i18n';

	const { t } = useI18n();

	const footerMenu = ref(
		[
			[
				{
					link: '/',
					title: t('footerPolyce')
				},
				{
					link: '/',
					title: t('footerContact')
				},
				{
					link: '/',
					title: t('footerFaq')
				},
			],
			[
				{
					link: '/',
					title: t('footerStatus')
				},
				{
					link: '/',
					title: t('footerPartner')
				},
				{
					link: '/',
					title: t('footerJobs')
				},
			],
		]
	)
</script>

<template>
	<footer class="footer pt-12 pb-12">
		<div class="container">
			<div class="footer__body row items-start justify-between">
				<div class="footer__left">
					<div class="footer__logo">
						<router-link to="/" title="SA International" class="row items-center">
							<q-img src="images/logo.svg" height="42px" width="28px" fit="contain" />
							<span>SA<br>International</span>
						</router-link>
					</div>
					<div class="footer__social row no-wrap items-center">
						<a href="/" class="footer__social__item">
							<q-img src="icons/whatsapp.svg" width="24px" />
						</a>
						<a href="/" class="footer__social__item">
							<q-img src="icons/discord.svg" width="24px" />
						</a>
						<a  href="/" class="footer__social__item">
							<q-img src="icons/telegram.svg" width="24px" />
						</a>
					</div>
					<router-link to="/" class="footer__link fonts-oswald text-white">{{ t('footerConsent') }}</router-link>
				</div>
				<div v-for="(item, index) in footerMenu" :key="index" class="footer__menu">
					<nav>
						<ul>
							<li v-for="(el, indx) in item" :key="indx">
								<router-link :to="el.link">{{ el.title }}</router-link>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</footer>
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
				background-color: rgba(50, 62, 102, .7);
				padding: 8px;
				border-radius: 8px;
				margin: 0 8px;
				transition: .4s all;
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
						transition: .4s all;

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
	}
</style>

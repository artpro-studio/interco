<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';
	import { formatterPhone } from 'src/helpers/formatterPhone';

	interface IProps {
		data: any;
	}
	defineProps<IProps>();

	const { locale } = useI18n();
</script>

<template>
	<div class="home-contacts pt-8 pb-12">
		<div class="container">
			<h4 data-aos="fade-right" class="home-contacts__title fonts-oswald headline-1 text-gradient">
				{{ data?.fields?.title[locale]?.value }}
			</h4>
			<div data-aos="fade-left" class="home-contacts__body row no-wrap justify-between items-center">
				<p class="fonts-oswald">{{ data?.fields?.description[locale]?.value }}</p>
				<div class="home-contacts__info">
					<div class="home-contacts__info__item">
						<a :href="formatterPhone(data?.fields?.phone[locale]?.value)" class="fonts-oswald">{{
							data?.fields?.phone[locale]?.value
						}}</a>
					</div>
					<div class="home-contacts__info__item">
						<a :href="'mailto:' + data?.fields?.email[locale]?.value" class="fonts-oswald">{{
							data?.fields?.email[locale]?.value
						}}</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.home-contacts {
		background-color: var(--white);

		&__title {
			margin-bottom: 40px;
		}

		&__body {
			font-size: 2.45em;
			p {
				max-width: 737px;
			}
		}
		&__info {
			margin-left: 40px;
			&__item {
				margin-bottom: 16px;
			}
			a {
				text-decoration: none;
				line-height: 10%;
				color: var(--dark-blue);
				transition: 0.4s all;
				white-space: nowrap;

				&:hover {
					color: var(--red);
				}
			}
		}

		@media (max-width: $breakpoint-md-min) {
			&__body {
				font-size: 1.5em;
			}
		}

		@media (max-width: $breakpoint-sm-min) {
			&__body {
				flex-wrap: wrap;
			}
			&__info {
				margin-left: 0;
				margin-top: 24px;
				a {
					font-size: 1.35em;
				}
			}
		}
	}
</style>

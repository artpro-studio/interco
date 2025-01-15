<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>

<template>
	<div class="news-banner pt-8 pb-8">
		<div class="container">
			<h4 data-aos="fade-right" class="news-banner__title headline-1 text-gradient text-uppercase">{{ t('newsBannerTitle') }}</h4>
			<div data-aos="fade-left" class="news-banner__body row no-wrap justify-between">
				<div class="news-banner__info fonts-oswald">
					<p>{{ t('newsBannerText') }}</p>
				</div>
				<div class="news-banner__contacts">
					<div class="news-banner__link">
						<a href="tel:+862154322755" class="headline-2">+86-21-5432-2755</a>
					</div>
					<div class="news-banner__link">
						<a href="mailto:info@inter-sa.com" class="headline-2">info@inter-sa.com</a>
					</div>
					<p>Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-505</p>
				</div>
			</div>
		</div>
		<div data-aos="fade-left" class="news-banner__arrows row no-wrap">
			<q-img class="news-banner__arrows__item" src="icons/arrow-red.svg" />
			<q-img class="news-banner__arrows__item" src="icons/arrow-red.svg" />
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.news-banner {
		position: relative;
		background-color: var(--dark-blue);
		color: var(--white);

		&__arrows {
			position: absolute;
			top: -2px;
			right: 0;

			&__item {
				width: 350px;
				opacity: .15;

				&:first-child {
					position: relative;
					right: -70px;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				right: -370px;

				&__item {
					width: 350px;

					&:first-child {
						position: relative;
						right: -40px;
					}
				}
			}
		}

		&__body {
			@media (max-width: $breakpoint-sm-min) {
				flex-wrap: wrap;
			}
		}

		&__title {
			margin-bottom: 40px;
		}
		&__info {
			max-width: 600px;
			padding-right: 10px;
			p {
				font-size: 1.22em;
				text-transform: uppercase;
			}

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 24px;
			}
		}

		&__contacts {
			font-size: 1.22em;
			max-width: 540px;
			p {
				line-height: 135%;
			}
		}

		&__link {
			margin-bottom: 24px;
			a {
				text-decoration: none;
				color: var(--white);

				&:hover {
					color: var(--yellow);
				}
			}
		}
	}
</style>

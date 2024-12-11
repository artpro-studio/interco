<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>

<template>
	<div class="home-contacts pt-8 pb-12">
		<div class="container">
			<h4 class="home-contacts__title fonts-oswald headline-1 text-gradient">SA International</h4>
			<div class="home-contacts__body row no-wrap justify-between items-center">
				<p class="fonts-oswald">{{ t('homeContactsText') }}</p>
				<div class="home-contacts__info">
					<div class="home-contacts__info__item">
						<a href="tel:+862154322755" class="fonts-oswald">+86-21-5432-2755</a>
					</div>
					<div class="home-contacts__info__item">
						<a href="mailto:info@inter-sa.com" class="fonts-oswald">info@inter-sa.com</a>
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
				transition: .4s all;
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

<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>
<template>
	<div class="clients-contacts pt-8 pb-12">
		<div class="container">
			<h4 data-aos="fade-up" class="clients-contacts__title headline-1 text-gradient text-center text-uppercase">{{t('partnersContactsTitle')}}</h4>
			<div data-aos="fade-up" class="clients-contacts__body row justify-between no-wrap">
				<div class="clients-contacts__item">
					<h6 class="clients-contacts__item__title text-gradient text-uppercase fonts-oswald">{{t('partnersContactsSubTitle1')}}</h6>
					<div class="clients-contacts__item__link">
						<a href="tel:+8654322755">partners@inter-sa.com</a>
					</div>
				</div>
				<div class="clients-contacts__item">
					<h6 class="clients-contacts__item__title text-gradient text-uppercase fonts-oswald">{{t('phone')}}</h6>
					<div class="clients-contacts__item__link">
						<a href="mailto:support@inter-sa.com">8+6-21-5432-2755 (ext. 818)</a>
					</div>
				</div>
				<div class="clients-contacts__item">
					<h6 class="clients-contacts__item__title text-gradient text-uppercase fonts-oswald">{{t('partnersContactsSubTitle3')}}</h6>
					<div class="clients-contacts__item__link">
						<p>Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-505</p>
					</div>
				</div>
				<div class="clients-contacts__item">
					<h6 class="clients-contacts__item__title text-gradient text-uppercase fonts-oswald">{{t('partnersContactsSubTitle4')}}</h6>
					<div class="clients-contacts__item__link">
						<p>Дмитрий Александрович Гаврилов,
							Директор по развитию бизнеса</p>
					</div>
				</div>
			</div>
		</div>
		<div data-aos="fade-left" class="clients-contacts__arrows row no-wrap">
			<q-img class="clients-contacts__arrows__item" src="icons/arrow-red.svg" />
			<q-img class="clients-contacts__arrows__item" src="icons/arrow-red.svg" />
		</div>
	</div>
</template>

<style lang="scss" scoped>
	.clients-contacts {
		position: relative;

		&::before {
			content: '';
			width: 100%;
			height: 100%;
			background-color: rgba(16, 16, 41, 0.69);
			position: absolute;
			top: 0;
			left: 0;
		}

		&__title {
			position: relative;
		}

		&__body {
			margin-top: 64px;
			position: relative;
			color: var(--white);
		}

		&__item {
			padding-right: 35px;
			border-right: 2px rgba(255, 255, 255, 0.5) solid;
			margin-right: 35px;

			&:last-child {
				padding-right: 0;
				border-right: none;
				margin-right: 0;
			}

			&__title {
				color: var(--yellow);
				margin-bottom: 32px;
				font-size: 1.55em;
				line-height: 140%;
				white-space: nowrap;
			}

			&__link {
				margin-bottom: 16px;

				&:last-child {
					margin-bottom: 0;
				}
			}

			a {
				color: var(--white);
				text-decoration: none;
				font-size: 1.22em;
				transition: .4s all;
				font-family: 'Oswald', sans-serif;

				&:hover {
					color: var(--red);
				}
			}

			p {
				font-family: 'Oswald', sans-serif;
				font-size: 1.22em;
			}

			@media (max-width: 1310px) {
				width: 25%;
				&__title {
					white-space: wrap;
					height: 80px;
					margin-bottom: 10px;
				}
			}

			@media (max-width: $breakpoint-md-min) {
				padding-right: 0;
				width: calc(50% - 28px);
				border-right: none;
				border-bottom: 2px rgba(255, 255, 255, 0.5) solid;
				padding-bottom: 24px;
				margin-bottom: 24px;

				&:nth-child(2) {
					margin-right: 0;
				}

				&__title {
					height: auto;
					margin-bottom: 8px;
				}
			}

			@media (max-width: 700px) {
				width: 100%;
				margin-right: 0;

				&:last-child {
					border-bottom: none;
					margin-bottom: 0;
				}
			}
		}
		@media (max-width: $breakpoint-md-min) {
			&__body {
				flex-wrap: wrap;
			}
		}
		@media (max-width: 700px) {
			&__title {
				margin-bottom: 24px;
			}

			&__body {
				margin-top: 0;
			}
		}

		&__arrows {
			position: absolute;
			top: -2px;
			right: 0;

			&__item {
				width: 300px;
				opacity: .15;

				&:first-child {
					position: relative;
					right: -70px;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				right: -140px;

				&__item {
					width: 200px;

					&:first-child {
						position: relative;
						right: -40px;
					}
				}
			}
		}
	}
</style>

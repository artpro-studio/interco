<script lang="ts" setup>
	import SectionTitle from 'src/components/SectionTitle/SectionTitle.vue';
	import { useSlots } from 'vue';
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
	const slots = useSlots()
</script>

<template>
	<div class="clients-contacts pt-8 pb-12">
		<div class="container">
			<section-title :title="t('clientsContactsTitle')" color="gold" class="clients-contacts__title" />
			<div class="clients-contacts__body row justify-between no-wrap">
				<div v-if="!slots['column1']" class="clients-contacts__item">
					<h6 class="clients-contacts__item__title text-gradient text-uppercase fonts-oswald">{{ t('clientsContactsSubTitle1') }}</h6>
					<div class="clients-contacts__item__link">
						<a href="tel:+8654322755">+86-5432-2755 (ext. 804)</a>
					</div>
					<div class="clients-contacts__item__link">
						<a href="mailto:support@inter-sa.com">support@inter-sa.com</a>
					</div>
				</div>
				<slot v-else name="column1" />

				<div v-if="!slots['column2']" class="clients-contacts__item">
					<h6 class="clients-contacts__item__title text-gradient text-uppercase fonts-oswald">{{ t('clientsContactsSubTitle2') }}</h6>
					<div class="clients-contacts__item__link">
						<a href="mailto:support@inter-sa.com">parts@inter-sa.com</a>
					</div>
				</div>
				<slot v-else name="column2" />

				<div v-if="!slots['column3']" class="clients-contacts__item">
					<h6 class="clients-contacts__item__title text-gradient text-uppercase fonts-oswald">{{ t('clientsContactsSubTitle3') }}</h6>
					<div class="clients-contacts__item__link">
						<a href="mailto:support@inter-sa.com">info@inter-sa.com</a>
					</div>
				</div>
				<slot v-else name="column3" />

				<div v-if="!slots['column4']" class="clients-contacts__item">
					<h6 class="clients-contacts__item__title text-gradient text-uppercase fonts-oswald">{{ t('clientsContactsSubTitle4') }}</h6>
					<div class="clients-contacts__item__link">
						<p>Китай, г. Шанхай, район Миньхан, улица Синьцзюньхуань, дом 115, корпус 1, офисы 503-505</p>
					</div>
				</div>
				<slot v-else name="column4" />
			</div>
		</div>
	</div>
</template>

<style lang="scss">
	.clients-contacts {
		overflow: hidden;
		&__item {
			padding-right: 35px;
			border-right: 2px rgba(255, 255, 255, 0.5) solid;
			margin-right: 35px;
			width: 27%;

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
					font-size: 1.22em;
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
	}
</style>

<style lang="scss" scoped>
	.clients-contacts {
		background-image: url('/images/bg-client-contacts.png');
		background-repeat: no-repeat;
		background-position: top center;
		background-size: cover;
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

		&__body {
			margin-top: 64px;
			position: relative;
			color: var(--white);
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
	}
</style>

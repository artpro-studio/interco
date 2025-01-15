<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>
<template>
	<div class="home-advantages pt-8">
		<div class="container">
			<h3 data-aos="fade-right" class="home-advantages__title headline-1 text-white text-uppercase">{{t('partnersStepTitle')}}</h3>
		</div>
		<div class="home-advantages__body">
				<div data-aos="fade-right" class="home-advantages__first">
					<div class="container">
						<div class="home-advantages__wrap row no-wrap q-gutter-lg q-ml-none">
							<div class="home-advantages__item">
								<h4 class="home-advantages__item__title fonts-oswald text-uppercase">1. {{t('partnersStepItem1Title')}}</h4>
								<p>{{t('partnersStepItem1Text')}}</p>
							</div>
							<div class="home-advantages__item">
								<h4 class="home-advantages__item__title fonts-oswald text-uppercase">2. {{t('partnersStepItem2Title')}}</h4>
								<p>{{t('partnersStepItem2Text')}}</p>
							</div>
						</div>
					</div>
				</div>
				<div data-aos="fade-left" class="home-advantages__two">
					<div class="container">
						<div class="home-advantages__wrap row no-wrap q-gutter-lg q-ml-none">
							<div class="home-advantages__item">
								<h4 class="home-advantages__item__title fonts-oswald text-uppercase">3. {{t('partnersStepItem3Title')}}</h4>
								<p>{{t('partnersStepItem3Text')}}</p>
							</div>
							<div class="home-advantages__item">
								<h4 class="home-advantages__item__title fonts-oswald text-uppercase">4. {{t('partnersStepItem4Title')}}</h4>
								<p>{{t('partnersStepItem4Text')}}</p>
							</div>
						</div>
					</div>

				</div>
				<div data-aos="fade-up" class="home-advantages__three">
					<div class="container">
						<div class="home-advantages__item">
							<h4 class="home-advantages__item__title fonts-oswald text-uppercase">5. {{t('partnersStepItem5Title')}}</h4>
							<p>{{t('partnersStepItem5Text')}}</p>
						</div>
					</div>

				</div>

			</div>
	</div>
</template>
<style lang="scss" scoped>
	.home-advantages {
		&__title {
			margin-bottom: 64px;

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 40px;
			}
		}

		&__wrap {
			@media (max-width: $breakpoint-md-min) {
				margin: 0;
				padding: 0;
				justify-content: space-between;

				& > div {
					margin: 0;
					padding: 0;
				}
			}

			@media (max-width: $breakpoint-md-min) {
				flex-wrap: wrap;
			}

		}

		&__item {
			padding: 40px 50px;
			background-color: var(--red);
			color: var(--white);
			position: relative;
			z-index: 2;

			&__title {
				margin-bottom: 24px;
				font-size: 1.77em;
				font-weight: 500;
			}

			p {
				line-height: 130%;
				color: #E3E3E3;
			}

			@media (max-width: $breakpoint-md-min) {
				padding: 30px !important;
				width: calc(50% - 12px) !important;
				max-width: none !important;

				&__title {
					font-size: 1.5em;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				width: 100% !important;
				margin-bottom: 16px !important;
				padding: 16px !important;

				&__title {
					font-size: 1.5em;
					margin-bottom: 16px;
				}
			}
		}

		&__first, &__two {
			margin-bottom: 24px;
			position: relative;

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 0;
			}
		}

		&__first {
			&::before {
				content: '';
				width: 40%;
				height: calc(100% - 24px);
				background-color: var(--red);
				position: absolute;
				bottom: 0;
				left: 0;
			}
			&::after {
				content: '';
				width: 40%;
				height: calc(100% - 24px);
				background-color: var(--red);
				position: absolute;
				bottom: 0;
				right: 0;
			}

			.home-advantages__item {
				&:first-child {
					max-width: 44%;
					margin-left: 0;
				}
			}

			@media (max-width: $breakpoint-md-min) {
				margin-bottom: 24px;
				&::before, &::after {
					display: none;
				}
			}
			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 0;
			}
		}

		&__two {
			&::before {
				content: '';
				width: 40%;
				height: calc(100% - 24px);
				background-color: var(--red);
				position: absolute;
				bottom: 0;
				right: 0;
			}
			.home-advantages__item {
				&:first-child {
					width: 85%;
					max-width: 55%;
					padding: 40px 60px;
					margin-left: 0;
				}
				&:last-child {
					padding-right: 0;
				}
			}
			@media (max-width: $breakpoint-md-min) {
				&::before, &::after {
					display: none;
				}
			}
		}

		&__three {
			position: relative;
			&::before {
				content: '';
				width: 100%;
				height: 100%;
				background-color: var(--red);
				position: absolute;
				bottom: 0;
				left: 0;
			}

			.home-advantages__item {
				padding-left: 60px;
				p {
					max-width: 90%;
				}
			}

			@media (max-width: $breakpoint-md-min) {
				&::before, &::after {
					display: none;
				}
			}
			@media (max-width: $breakpoint-sm-min) {
				p {
					max-width: 100% !important;
				}
			}
		}
	}
</style>

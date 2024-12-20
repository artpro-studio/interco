<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>
<template>
	<div class="partners-principles pt-8 pb-8 bg-white">
		<div class="container">
			<h3 class="partners-principles__title text-gradient headline-1 text-uppercase">{{t('partnersPrinciplesTitle')}}</h3>
			<div class="partners-principles__body row">
				<div class="partners-principles__item">
					<h5 class="text-red text-uppercase fonts-oswald text-bold">1. {{t('partnersPrinciplesItem1Title')}}</h5>
					<div class="partners-principles__item__content">
						<h6>{{t('partnersPrinciplesItem1SubTitle1')}}</h6>
						<p>{{t('partnersPrinciplesItem1Text1')}}</p>
					</div>
					<div class="partners-principles__item__content">
						<h6>{{t('partnersPrinciplesItem1SubTitle2')}}</h6>
						<p>{{t('partnersPrinciplesItem1Text2')}}</p>
					</div>
				</div>
				<div class="partners-principles__item">
					<h5 class="text-red text-uppercase fonts-oswald text-bold">2. {{t('partnersPrinciplesItem2Title')}}</h5>
					<div class="partners-principles__item__content">
						<h6>{{t('partnersPrinciplesItem2SubTitle1')}}</h6>
						<p>{{t('partnersPrinciplesItem2Text1')}}</p>
					</div>
					<div class="partners-principles__item__content">
						<h6>{{t('partnersPrinciplesItem2SubTitle2')}}</h6>
						<p>{{t('partnersPrinciplesItem2Text2')}}</p>
					</div>
				</div>
				<div class="partners-principles__item">
					<h5 class="text-red text-uppercase fonts-oswald text-bold">3. {{t('partnersPrinciplesItem3Title')}}</h5>
					<div class="partners-principles__item__content">
						<h6>{{t('partnersPrinciplesItem3SubTitle1')}}</h6>
						<p>{{t('partnersPrinciplesItem3Text1')}}</p>
					</div>
					<div class="partners-principles__item__content">
						<h6>{{t('partnersPrinciplesItem3SubTitle2')}}</h6>
						<p>{{t('partnersPrinciplesItem3Text2')}}</p>
					</div>
				</div>
				<div class="partners-principles__item">
					<h5 class="text-red text-uppercase fonts-oswald text-bold">4. {{t('partnersPrinciplesItem4Title')}}</h5>
					<div class="partners-principles__item__content">
						<h6>{{t('partnersPrinciplesItem4SubTitle1')}}</h6>
						<p>{{t('partnersPrinciplesItem4Text1')}}</p>
					</div>
					<div class="partners-principles__item__content">
						<h6>{{t('partnersPrinciplesItem4SubTitle2')}}</h6>
						<p>{{t('partnersPrinciplesItem4Text2')}}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.partners-principles {
		color: var(--dark-blue);

		&__title {
			margin-bottom: 64px;

			@media (max-width: 800px) {
				margin-bottom: 40px;
			}
		}
		&__body {
			margin: 0 -16px;

			@media (max-width: 800px) {
				margin: 0;
			}

		}
		&__item {
			width: calc(50% - 32px);
			margin: 0 16px;
			margin-bottom: 64px;

			h5 {
				margin-bottom: 32px;
				font-size: 1.55em;
				line-height: 140%;
			}

			h6 {
				font-size: 1.22em;
				font-weight: bold;
				margin-bottom: 6px;
				line-height: 140%;
			}

			p {
				line-height: 145%;
			}

			&__content {
				margin-bottom: 24px;

				&:last-child {
					margin-bottom: 0;
				}
			}

			@media (max-width: 800px) {
				width: 100%;
				margin: 0;
				margin-bottom: 32px;

				h5 {
					font-size: 1.38em;
					margin-bottom: 16px;
				}

				h6 {
					font-size: 1.15em;
				}

				p {
					font-size: 1em;
				}

				&__content {
					margin-bottom: 16px;
				}

				&:last-child {
					margin-bottom: 0;
				}
			}
		}
	}

</style>

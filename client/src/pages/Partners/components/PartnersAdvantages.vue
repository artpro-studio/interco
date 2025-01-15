<script lang="ts" setup>
	import SectionTitle from 'src/components/SectionTitle/SectionTitle.vue';
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>

<template>
	<div class="partners-advantages pt-8 pb-8">
		<div class="container">
			<section-title :title="t('partnersAdvantagesTitle')" class="partners-advantages__title" />
			<div class="partners-advantages__body row">
				<div data-aos="fade-right" class="partners-advantages__item">
					<h5 class="text-gradient text-uppercase fonts-oswald text-bold">1. {{t('partnersAdvantagesItem1Title')}}</h5>
					<div class="partners-advantages__item__content">
						<h6>{{t('partnersAdvantagesItem1SubTitle1')}}</h6>
						<p>{{t('partnersAdvantagesItem1Text1')}}</p>
					</div>
					<div class="partners-advantages__item__content">
						<h6>{{t('partnersAdvantagesItem1SubTitle2')}}</h6>
						<p>{{t('partnersAdvantagesItem1Text2')}}</p>
					</div>
				</div>
				<div data-aos="fade-left" class="partners-advantages__item">
					<h5 class="text-gradient text-uppercase fonts-oswald text-bold">2. {{t('partnersAdvantagesItem2Title')}}</h5>
					<div class="partners-advantages__item__content">
						<h6>{{t('partnersAdvantagesItem2SubTitle1')}}</h6>
						<p>{{t('partnersAdvantagesItem2Text1')}}</p>
					</div>
					<div class="partners-advantages__item__content">
						<h6>{{t('partnersAdvantagesItem2SubTitle2')}}</h6>
						<p>{{t('partnersAdvantagesItem2Text2')}}</p>
					</div>
				</div>
				<div data-aos="fade-right" class="partners-advantages__item">
					<h5 class="text-gradient text-uppercase fonts-oswald text-bold">3. {{t('partnersAdvantagesItem3Title')}}</h5>
					<div class="partners-advantages__item__content">
						<h6>{{t('partnersAdvantagesItem3SubTitle1')}}</h6>
						<p>{{t('partnersAdvantagesItem3Text1')}}</p>
					</div>
					<div class="partners-advantages__item__content">
						<h6>{{t('partnersAdvantagesItem3SubTitle2')}}</h6>
						<p>{{t('partnersAdvantagesItem3Text2')}}</p>
					</div>
				</div>
				<div data-aos="fade-left" class="partners-advantages__item">
					<h5 class="text-gradient text-uppercase fonts-oswald text-bold">4. {{t('partnersAdvantagesItem4Title')}}</h5>
					<div class="partners-advantages__item__content">
						<h6>{{t('partnersAdvantagesItem4SubTitle1')}}</h6>
						<p>{{t('partnersAdvantagesItem4Text1')}}</p>
					</div>
					<div class="partners-advantages__item__content">
						<h6>{{t('partnersAdvantagesItem4SubTitle2')}}</h6>
						<p>{{t('partnersAdvantagesItem4Text2')}}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.partners-advantages {
		color: var(--white);
		&__body {
			margin: 0 -16px;

			@media (max-width: 800px) {
				margin: 0;
			}

		}
		&__item {
			width: calc(50% - 32px);
			margin: 0 16px;
			border-radius: 10px;
    		background-color: rgba(35, 36, 57, 0.6);
			padding: 40px;
			margin-bottom: 40px;

			h5 {
				margin-bottom: 40px;
				font-size: 1.55em;
				line-height: 140%;
			}

			h6 {
				font-size: 1.22em;
				font-weight: bold;
				margin-bottom: 16px;
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
				margin-bottom: 20px;
				padding: 20px;

				h5 {
					font-size: 1.38em;
					margin-bottom: 24px;
				}

				h6 {
					font-size: 1.15em;
					margin-bottom: 8px;
				}

				p {
					font-size: 1em;
				}

				&__content {
					margin-bottom: 16px;
				}

				:last-child {
					margin-bottom: 0;
				}
			}
		}
	}

</style>

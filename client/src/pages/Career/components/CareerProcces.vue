<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>

<template>
	<div class="career-procces pt-8 pb-8 bg-white">
		<div class="container">
			<div class="career-procces__header">
				<h4 class="career-procces__title headline-1 text-gradient text-uppercase">{{ t('careerProccesTitle') }}</h4>
			</div>
			<div class="career-procces__body">
				<div class="career-procces__section row justify-between no-wrap">
					<div class="career-procces__item">
						<h5 class="career-procces__item__title fonts-oswald text-uppercase">1. {{ t('careerProccesItem1Title') }}</h5>
						<p>{{ t('careerProccesItem1Text') }}</p>
					</div>
					<q-img src="icons/arrow-red-outline.svg" class="career-procces__arrow" fit="contain" width="64px" />
					<div class="career-procces__item">
						<h5 class="career-procces__item__title fonts-oswald text-uppercase">2. {{ t('careerProccesItem2Title') }}</h5>
						<p>{{ t('careerProccesItem2Text') }}</p>
					</div>
					<q-img src="icons/arrow-red-outline.svg" class="career-procces__arrow" fit="contain" width="64px" />
					<div class="career-procces__item">
						<h5 class="career-procces__item__title fonts-oswald text-uppercase">3. {{ t('careerProccesItem3Title') }}</h5>
						<p>{{ t('careerProccesItem3Text') }}</p>
					</div>
					<q-img src="icons/arrow-red-outline.svg" class="career-procces__arrow desktop-hide" fit="contain" width="64px" />
				</div>
				<div class="career-procces__section row justify-between no-wrap">
					<div class="career-procces__item">
						<h5 class="career-procces__item__title fonts-oswald text-uppercase">4. {{ t('careerProccesItem4Title') }}</h5>
						<p>{{ t('careerProccesItem4Text') }}</p>
					</div>
					<q-img src="icons/arrow-red-outline.svg" class="career-procces__arrow" fit="contain" width="64px" />
					<div class="career-procces__item">
						<h5 class="career-procces__item__title fonts-oswald text-uppercase">5. {{ t('careerProccesItem5Title') }}</h5>
						<p>{{ t('careerProccesItem5Text') }}</p>
					</div>
					<q-img src="icons/arrow-red-outline.svg" class="career-procces__arrow" fit="contain" width="64px" />
					<div class="career-procces__item">
						<h5 class="career-procces__item__title fonts-oswald text-uppercase">6. {{ t('careerProccesItem6Title') }}</h5>
						<p>{{ t('careerProccesItem6Text') }}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.career-procces {
		&__header {
			margin-bottom: 64px;
		}

		&__section {
			margin-bottom: 64px;

			@media (max-width: 700px) {
				flex-wrap: wrap;
				margin-bottom: 0;
			}
		}

		&__item {
			width: 341px;

			&__title {
				margin-bottom: 24px;
				font-size: 1.22em;
				font-weight: 500;
				letter-spacing: 2%;
			}

			p {
				letter-spacing: 3%;
				font-size: 0.9em;
			}

			@media (max-width: 700px) {
				width: 100%;

				&__title {
					margin-bottom: 8px;
				}
			}
		}

		&__arrow {
			margin: 0 40px;
			min-width: 64px;

			@media (max-width: $breakpoint-md-min) {
				width: 40px !important;
				min-width: 40px;
				margin: 0 20px;
			}
			@media (max-width: 700px) {
				width: 20px !important;
				min-width: 20px;
				margin: 30px 0;

				&.desktop-hide {
					display: block !important;
				}
			}
		}
	}
</style>

<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>

<template>
	<div class="career-advantages pt-8 pb-120">
		<div class="container">
			<div class="career-advantages__header">
				<h4 class="career-advantages__header__title headline-1 text-gradient text-uppercase">{{ t('careerAdvantagesTitle') }}</h4>
			</div>
			<div class="career-advantages__body">
				<div class="career-advantages__body__section row no-wrap">
					<div class="career-advantages__body__item images">
						<q-img src="images/career-adv.png" height="230px" width="437px" fit="cover" class="career-advantages__body__item__img"/>
					</div>
					<div class="career-advantages__body__item" style="max-width: 326px;">
						<div class="career-advantages__body__item__header row no-wrap items-start">
							<span>1.</span>
							<h5>{{ t('careerAdvantagesItem1Title') }}</h5>
						</div>
						<p>{{ t('careerAdvantagesItem1Text') }}</p>
					</div>
					<div class="career-advantages__body__item">
						<div class="career-advantages__body__item__header row no-wrap items-start">
							<span>2.</span>
							<h5>{{ t('careerAdvantagesItem2Title') }}</h5>
						</div>
						<ul>
							<li>{{ t('careerAdvantagesItem2List1') }}</li>
							<li>{{ t('careerAdvantagesItem2List2') }}</li>
							<li>{{ t('careerAdvantagesItem2List3') }}</li>
						</ul>
					</div>
				</div>
				<div class="career-advantages__body__section row no-wrap">
					<div class="career-advantages__body__item">
						<div class="career-advantages__body__item__header row no-wrap items-start">
							<span>3.</span>
							<h5>{{ t('careerAdvantagesItem3Title') }}</h5>
						</div>
						<ul>
							<li>{{ t('careerAdvantagesItem3List1') }}</li>
							<li>{{ t('careerAdvantagesItem3List2') }}</li>
							<li>{{ t('careerAdvantagesItem3List3') }}</li>
						</ul>
					</div>
					<div class="career-advantages__body__item">
						<div class="career-advantages__body__item__header row no-wrap items-start">
							<span>4.</span>
							<h5>{{ t('careerAdvantagesItem4Title') }}</h5>
						</div>
						<ul>
							<li>{{ t('careerAdvantagesItem4List1') }}</li>
							<li>{{ t('careerAdvantagesItem4List2') }}</li>
							<li>{{ t('careerAdvantagesItem4List3') }}</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.career-advantages {
		&__header {
			margin-bottom: 64px;

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 32px;
			}
		}

		&__body {
			color: var(--white);

			&__section {
				margin: 0 -20px;
				margin-bottom: 64px;

				@media (max-width: 1200px) {
					margin: 0px -16px;
				}

				@media (max-width: $breakpoint-md-min) {
					flex-wrap: wrap;
				}
				@media (max-width: $breakpoint-sm-min) {
					margin: 0;
					&:first-child {
						.career-advantages__body__item {
							&:nth-child(1) {
								order: 1;
							}
							&:nth-child(2) {
								order: 0;
							}
							&:nth-child(3) {
								order: 2;
							}
						}
					}
				}
			}

			&__item {
				margin: 0 20px;

				&.images {
					@media (max-width: $breakpoint-sm-min) {
						width: 100%;
					}
				}

				&__img {
					border-radius: 10px;
					@media (max-width: 1200px) {
						width: 300px !important;
					}
					@media (max-width: $breakpoint-sm-min) {
						width: 100% !important;
					}

				}
				&__header {
					font-size: 1.22em;
					margin-bottom: 16px;

					h5 {
						font-size: 1em;
						margin-left: 16px;
					}
				}

				ul {
					list-style-type: none;
					margin: 0;
					padding: 0;

					li {
						margin: 0;
						padding: 0;
						margin-bottom: 8px;
						position: relative;
						padding-left: 40px;

						&::before {
							content: '';
							width: 32px;
							height: 32px;
							background-image: url('icons/arrow-yellow.svg');
							background-repeat: no-repeat;
							background-position: center;
							position: absolute;
							top: 50%;
							left: 0;
							margin-top: -16px;
						}
					}
				}

				@media (max-width: $breakpoint-md-min) {
					margin-bottom: 24px;
				}
				@media (max-width: $breakpoint-sm-min) {
					margin: 0;
					margin-bottom: 24px;
				}
			}
		}
	}
</style>

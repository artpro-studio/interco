<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>
<template>
	<div class="partners-info pt-8 pb-8 bg-white">
		<div class="container">
			<h4 data-aos="fade-right" class="partners-info__title headline-1 text-uppercase text-red">{{t('partnersInfoTitle')}}</h4>
			<div data-aos="fade-up" class="partners-info__body row no-wrap justify-between">
				<div class="partners-info__item">
					<h6 class="partners-info__item__title text-gradient text-uppercase fonts-oswald">{{t('partnersInfoItem1Title')}}</h6>
					<ul>
						<li>- {{t('partnersInfoItem1Text1')}}</li>
						<li>- {{t('partnersInfoItem1Text2')}}</li>
					</ul>
				</div>
				<div class="partners-info__item">
					<h6 class="partners-info__item__title text-gradient text-uppercase fonts-oswald">{{t('partnersInfoItem2Title')}}</h6>
					<ul>
						<li>- {{t('partnersInfoItem2Text1')}}</li>
						<li>- {{t('partnersInfoItem2Text2')}}</li>
					</ul>
				</div>
				<div class="partners-info__item">
					<h6 class="partners-info__item__title text-gradient text-uppercase fonts-oswald">{{t('partnersInfoItem3Title')}}</h6>
					<ul>
						<li>- {{t('partnersInfoItem3Text1')}}</li>
						<li>- {{t('partnersInfoItem3Text2')}}</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.partners-info {
		&__title {
			margin-bottom: 64px;

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 24px;
			}
		}

		&__body {
			@media (max-width: 800px) {
				flex-wrap: wrap;
			}
		}

		&__item {
			width: 33.3333%;
			padding-right: 30px;


			&:last-child {
				margin-right: 0;
			}

			&__title {
				font-size: 1.55em;
				margin-bottom: 32px;

				@media (max-width: 1290px) {
					height: 80px;
					margin-bottom: 8px;
				}
			}
			ul {
				list-style-type: none;
				margin: 0;
				padding: 0;
				li {
					margin: 0;
					padding: 0;
					font-size: 1em;
					color: #888891;
					margin-bottom: 24px;
					font-weight: bold;

					&:last-child {
						margin-bottom: 0;
					}
				}
			}

			@media (max-width: 800px) {
				width: 100%;
				padding-right: 0;
				margin-bottom: 24px;

				&__title {
					height: auto;
					margin-bottom: 16px;
					font-size: 1.37em;
				}

				ul {
					li {
						margin-bottom: 8px;
					}
				}
			}
		}
	}
</style>

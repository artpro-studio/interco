<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>
<template>
	<div class="partners-how-become pt-8 pb-8 bg-white">
		<div data-aos="fade-up" class="container">
			<div class="partners-how-become__body">
				<div class="partners-how-become__header">
					<h4 class="partners-how-become__title fonts-oswald headline-1 text-red text-uppercase">{{t('partnersHowBecomeTitle')}}</h4>
				</div>
				<p class="fonts-oswald text-uppercase">{{t('partnersHowBecomeSubTitle')}}</p>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.partners-how-become {
		text-align: center;
		position: relative;

		&::before {
			content: '';
			background-image: url('/icons/mail-bg.svg');
			background-repeat: no-repeat;
			background-position: center left;
			background-size: 250px;
			height: 100%;
			width: 100%;
			position: absolute;
			top: 0;
			left: 0;

			@media (max-width: $breakpoint-md-min) {
				background-size: 220px;
			}

			@media (max-width: $breakpoint-sm-min) {
				background-size: 150px;
			}
		}
		&__body {
			position: relative;
		}

		&__header {
			display: inline-block;
			padding: 0px 24px 24px 24px;
			position: relative;
			margin-bottom: 24px;

			&::before {
				content: '';
				background: var(--gradient-yellow);
				height: 2px;
				width: 100%;
				position: absolute;
				bottom: 0;
				left: 0;
			}
		}

		p {
			color: #888891;
			font-size: 1.55em;
			font-weight: 500;
			max-width: 990px;
			margin: 0 auto;
		}

		@media (max-width: $breakpoint-sm-min) {
			background-size: 150px;
			p {
				font-size: 1.39em;
			}
		}
	}
</style>

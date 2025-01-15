<script lang="ts" setup>
	import { reactive } from 'vue';
import { useI18n } from 'vue-i18n';

	const { t } = useI18n();

	const missionData = reactive([
		{
			title: t('aboutMissionList1Title'),
			text: t('aboutMissionList1Text'),
		},
		{
			title: t('aboutMissionList2Title'),
			text: t('aboutMissionList2Text'),
		},
		{
			title: t('aboutMissionList3Title'),
			text: t('aboutMissionList3Text'),
		},
		{
			title: t('aboutMissionList4Title'),
			text: t('aboutMissionList4Text'),
		},
		{
			title: t('aboutMissionList5Title'),
			text: t('aboutMissionList5Text'),
		},
	])
</script>

<template>
	<div class="about-mission pt-8 pb-8 bg-white">
		<div class="container">
			<div class="about-mission__header">
				<h3 data-aos="fade-right" class="about-mission__header__title headline-1 text-gradient text-uppercase">{{ t('aboutMissionTitle') }}</h3>
			</div>
			<div class="about-mission__body row no-wrap">
				<div data-aos="fade-right" class="about-mission__item info">
					<h5 class="fonts-oswald">{{ t('aboutMissionSubTitle1') }}</h5>
					<p>{{ t('aboutMissionText') }}</p>
				</div>
				<div data-aos="fade-left" class="about-mission__item">
					<h5 class="fonts-oswald">{{ t('aboutMissionSubTitle2') }}</h5>
					<div
						v-for="(item, index) in missionData"
						:key="index"
						class="about-mission__item__content"
					>
						<h6>{{ item.title }}</h6>
						<p>{{ item.text }}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.about-mission {
		&__header {
			margin-bottom: 64px;

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 40px;
			}
		}

		&__body {
			@media (max-width: $breakpoint-sm-min) {
				flex-wrap: wrap;
			}
		}

		&__item {
			&.info {
				min-width: 305px;
				width: 305px;
				margin-right: 24px;
			}
			&__content {
				margin-bottom: 16px;

				&:last-child {
					margin-bottom: 0;
				}
			}
			h5 {
				font-size: 1.56em;
				text-transform: uppercase;
				color: var(--red);
				margin-bottom: 32px;
				font-weight: 500;
			}
			h6 {
				font-size: 1.22em;
				font-weight: bold;
				margin-bottom: 4px;
			}

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 24px;

				&.info {
					min-width: auto;
					width: 100%;
					margin-right: 24px;
				}

				h5 {
					margin-bottom: 16px;
				}
			}
		}
	}


</style>

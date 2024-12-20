<script lang="ts" setup>
	import { ref } from 'vue';
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();

	const principles = ref([
		{
			title: t('aboutPrinciplesItem1Title'),
			text: t('aboutPrinciplesItem1Text'),
			isFull: true,
		},
		{
			title: t('aboutPrinciplesItem2Title'),
			text: t('aboutPrinciplesItem2Text'),
			isFull: true,
		},
		{
			title: t('aboutPrinciplesItem3Title'),
			text: t('aboutPrinciplesItem3Text'),
		},
		{
			title: t('aboutPrinciplesItem4Title'),
			text: t('aboutPrinciplesItem4Text'),
		},
		{
			title: t('aboutPrinciplesItem5Title'),
			text: t('aboutPrinciplesItem5Text'),
		}
	])
</script>

<template>
	<div class="about-principles pt-8 pb-8">
		<div class="container">
			<div class="about-principles__header row no-wrap justify-between items-center">
				<div class="about-principles__header__body row items-center no-wrap">
					<q-img src="icons/arrow-red.svg" class="about-principles__header__arrow" width="40px" />
					<h4 class="about-principles__header__title headline-1 text-uppercase">{{ t('aboutPrinciplesTitle') }}</h4>
				</div>
				<div class="about-principles__header__info">
					<p>{{ t('aboutPrinciplesDescription') }}</p>
				</div>
			</div>
			<div class="about-principles__body row q-gutter-lg">
				<div
					v-for="(item, index) in principles"
					:key="index"
					class="about-principles__item"
					:class="{isFull: item.isFull}"
				>
					<h5 class="about-principles__item__title fonts-oswald">{{ item.title }}</h5>
					<p class="about-principles__item__text">{{ item.text }}</p>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.about-principles {
		background-color: #F5F5F5;

		&__header {
			margin-bottom: 64px;

			&__arrow {
				margin-right: 58px;
			}

			&__info {
				padding-left: 40px;
				border-left: 2px var(--yellow) solid;
				width: 500px;
				p {
					letter-spacing: 3%;
					font-size: 1em;
					font-weight: 700;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 32px;
				flex-wrap: wrap;

				&__arrow {
					margin-right: 20px;
					width: 40px;
				}

				&__body {
					margin-bottom: 32px;
				}

				&__info {
					padding-left: 0;
					border-left: none;
					border-top: 2px var(--yellow) solid;
					padding-top: 8px;

					p {
						font-size: 1.15em;
						font-weight: 40;
					}
				}
			}
		}

		&__item {
			padding: 32px;
			background-color: var(--white);
			width: calc(33.333% - 24px);

			&.isFull {
				width: calc(50% - 24px);
			}


			&__title {
				color: var(--red);
				font-size: 1.55em;
				font-weight: 500;
				margin-bottom: 16px;
			}

			&__text {
				font-size: 1.22em;
				font-weight: bold;
			}

			@media (max-width: 768px) {
				width: 100% !important;
				padding: 20px;

				&__title {
					font-size: 1.45em;
				}

				&__text {
					font-size: 1.12em;

				}
			}
		}
	}
</style>

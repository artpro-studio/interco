<script lang="ts" setup>
	import VBtnGradient from 'src/components/UI/VBtnGradient/VBtnGradient.vue';
	import ModalApplication from 'src/components/Modal/ModalApplication.vue';
	import { useI18n } from 'vue-i18n';
	import { ref } from 'vue';

	interface IProps {
		data: any;
	}
	defineProps<IProps>();

	const { t, locale } = useI18n();
	const isOpenDialog = ref(false);
</script>
<template>
	<div class="job-openings__slide">
		<div class="job-openings__slide__header row items-center no-wrap">
			<q-img src="icons/user.svg" class="job-openings__slide__header__icon" width="64px" />
			<h4 class="job-openings__slide__header__title text-gradient">{{ data?.fields?.title[locale]?.value }}</h4>
		</div>
		<div class="job-openings__slide__body">
			<h5>{{ t('careerJobLocation') }}</h5>
			<p>{{ data?.fields?.location[locale]?.value }}</p>
			<template v-if="data?.fields?.requirements[locale]?.value">
				<h5>{{ t('careerJobRequirements') }}</h5>
				<ul>
					<li v-for="(item, index) in data?.fields?.requirements[locale]?.value" :key="index">{{ item }}</li>
				</ul>
			</template>
			<template v-if="data?.fields?.responsibilities[locale]?.value">
				<h5>{{ t('careerJobResponsibilities') }}</h5>
				<ul>
					<li v-for="(item, index) in data?.fields?.responsibilities[locale]?.value" :key="index">{{ item }}</li>
				</ul>
			</template>
			<template v-if="data?.fields?.conditions[locale]?.value">
				<h5>{{ t('careerJobTerm') }}</h5>
				<ul>
					<li v-for="(item, index) in data?.fields?.conditions[locale]?.value" :key="index">{{ item }}</li>
				</ul>
			</template>
			<v-btn-gradient
				class="job-openings__slide__btn"
				:height="44"
				:href="'https://forms.yandex.ru/u/67cabcebd046880c82a83630/'"
				>{{ t('careerJobTextButton') }}</v-btn-gradient
			>
		</div>
		<q-dialog v-model="isOpenDialog">
			<modal-application @on-close="isOpenDialog = false" />
		</q-dialog>
	</div>
</template>
<style lang="scss" scoped>
	.job-openings {
		&__slide {
			padding: 40px;
			max-width: 440px;
			width: 440px;
			background-color: rgba(35, 36, 57, 0.6);
			border-radius: 10px;
			position: relative;

			&::before {
				content: '';
				width: 324px;
				height: 316px;
				background-image: url('/icons/arrow-big-blue.svg');
				background-repeat: no-repeat;
				background-size: contain;
				background-position: right;
				position: absolute;
				top: 0;
				right: 0;
			}

			&__header {
				position: relative;
				padding-bottom: 8px;
				&__title {
					font-size: 1.55em;
					font-weight: 700;
				}
				&__icon {
					margin-right: 24px;
				}
			}

			&__body {
				color: var(--white);
				position: relative;

				h5 {
					margin-top: 32px;
					margin-bottom: 16px;
					font-weight: 700;
					font-size: 1.24em;
				}

				ul {
					list-style-type: none;
					margin: 0;
					padding: 0;

					li {
						margin: 0;
						padding: 0;
						margin-bottom: 8px;
					}
				}
			}

			&__btn {
				margin-top: 32px;
				max-width: 208px;
			}

			@media (max-width: $breakpoint-sm-min) {
				padding: 24px;
				max-width: 304px;
				width: 304px;
				&__header {
					&__title {
						font-size: 1.28em;
					}
					&__icon {
						width: 40px !important;
					}
				}

				&__body {
					h5 {
						font-size: 1.28em;
						margin-top: 16px;
					}
				}

				&__btn {
					margin-top: 16px;
				}
			}
		}
	}
</style>

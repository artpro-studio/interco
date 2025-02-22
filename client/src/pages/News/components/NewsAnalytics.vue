<script lang="ts" setup>
	import { getApiClientInitialParams, PagesPublicControllerClient, RecordsPublicDto } from 'src/ApiClient/ApiClient';
	import { nextTick, onMounted, ref, watch } from 'vue';
	import { useI18n } from 'vue-i18n';
	import { getMonthWithYear } from 'src/helpers/formaterDate';

	interface IProps {
		header: any
	}
	defineProps<IProps>();

	const { locale } = useI18n();

	const isLoading = ref(true);
	const rows = ref<RecordsPublicDto[]>([]);

	watch(() => locale.value, () => {
		isLoading.value = true;
		nextTick(() => {
			isLoading.value = false;
		})
	})

	const getInfo = () => {
		new PagesPublicControllerClient(getApiClientInitialParams()).getRecordsBlogs('', 1, 20, 'articles-analytics')
			.then((res) => {
				rows.value = res.entity?.entity || [];
				isLoading.value = false;
			})
	}

	onMounted(() => {
		getInfo();
	})
</script>

<template>
	<div class="news-analytics pt-8 pb-8 bg-white">
		<div v-if="isLoading" class="q-pa-md flex flex-center">
			<q-circular-progress
				indeterminate
				rounded
				color="orange"
				 size="30px"
			/>
		</div>
		<div v-else class="container">
			<div class="news-analytics__header row no-wrap justify-between items-center">
				<div data-aos="fade-right" class="news-analytics__header__body row items-center no-wrap">
					<h4 class="news-analytics__header__title headline-1 text-gradient text-uppercase">{{ header?.fields?.title[locale]?.value }}</h4>
				</div>
				<div data-aos="fade-left" class="news-analytics__header__info">
					<p>{{ header?.fields?.description[locale]?.value }}</p>
				</div>
			</div>
			<div class="news-analytics__body">
				<div
					v-for="(item, index) in rows"
					:key="index"
					class="news-analytics__item"
					data-aos="fade-up"
				>
					<div class="news-analytics__item__date">{{ getMonthWithYear(item.createdAt!) }}</div>
					<h5 class="news-analytics__item__title">{{ item.title[locale] }}</h5>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.news-analytics {
		&__header {
			margin-bottom: 64px;

			&__arrow {
				margin-right: 58px;
			}

			&__info {
				padding-left: 40px;
				border-left: 2px var(--yellow) solid;
				width: 570px;
				p {
					letter-spacing: 1px;
					line-height: 156%;
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
						font-weight: 400;
						line-height: 140%;
					}
				}
			}
		}

		&__body {
			padding-left: 220px;

			@media (max-width: 768px) {
				padding-left: 0;
			}
		}

		&__item {
			border-bottom: 2px #E3E3E3 solid;
			padding-bottom: 24px;
			margin-bottom: 24px;


			&:last-child {
				margin-bottom: 0;
				border-bottom: none
			}
			&__date {
				color: var(--gray-secondary);
				font-size: 0.95em;
				margin-bottom: 16px;
				font-weight: bold;
			}

			&__title {
				font-family: 'Oswald', sans-serif;
				font-size: 1.35em;
				text-transform: uppercase;
				font-weight: 500;
			}

			@media (max-width: $breakpoint-sm-min) {
				&__date {
					font-size: 1em;
				}

				&__title {
					font-size: 1.25em;
				}
			}
		}
	}
</style>

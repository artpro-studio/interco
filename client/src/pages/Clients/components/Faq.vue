<script lang="ts" setup>
	import { getApiClientInitialParams, PublicPagesSectionsDto } from 'src/ApiClient/ApiClient';
	import { PagesPublicControllerClient } from 'src/ApiClient/ApiClient';
	import { ref } from 'vue';
	import { onMounted } from 'vue';
	import { useI18n } from 'vue-i18n';

	const { t, locale } = useI18n();

	const SLUG = 'faq';
	const isLoading = ref(true);
	const sections = ref<PublicPagesSectionsDto[]>([]);
	const limit = 10;

	const getInfo = async (sectionID: number, page: number) => {
		const result = await new PagesPublicControllerClient(getApiClientInitialParams()).getRecordsForSlugAndSection(
			'',
			page,
			limit,
			SLUG,
			sectionID
		);
		if (result.isSuccess) {
			return {
				...result.entity,
				page: page,
				isLoading: false,
			};
		} else {
			return null;
		}
	};

	const isViewBtn = (count: number, page: number) => {
		return Math.ceil(count / limit) > page;
	};

	const getMore = async (page: number, sectionId: number) => {
		const thisPage = page + 1;
		const findIndex = sections.value?.findIndex((el) => el.id === sectionId);
		if (findIndex !== undefined && findIndex > -1) {
			sections.value[findIndex]!.data.isLoading = true;
		}
		const result = await getInfo(sectionId, thisPage);
		if (result) {
			if (findIndex !== undefined && findIndex > -1) {
				sections.value[findIndex] = {
					...sections.value[findIndex],
					data: {
						...sections.value[findIndex]!.data,
						...result,
						page: thisPage,
						entity: [...sections.value[findIndex]!.data.entity, ...result.entity],
					},
				};
			}
		}
	};

	const getSections = async () => {
		await new PagesPublicControllerClient(getApiClientInitialParams()).getIblockSections(SLUG).then(async (res) => {
			for (const key in res.entity) {
				const item = res.entity[key as any];
				const data = await getInfo(item!.id!, 1);
				sections.value.push({
					...item,
					data,
				});
			}
			isLoading.value = false;
		});
	};

	onMounted(() => {
		getSections();
	});
</script>

<template>
	<div class="faq pt-8 pb-8 bg-white" id="faq">
		<div v-if="isLoading" class="row items-center justify-center">
			<q-circular-progress indeterminate size="40px" color="primary" :thickness="0.1" />
		</div>
		<div v-else class="container">
			<div data-aos="fade-right" class="faq__header">
				<h3 class="faq__header__title headline-1 text-gradient text-uppercase">{{ t('clientsFaqTitle') }}</h3>
			</div>
			<div class="faq__body row items-lg-start justify-between">
				<div v-for="(item, index) in sections" :key="index" data-aos="fade-up" class="faq__body__columns">
					<h6 class="faq__body__title text-red text-uppercase">{{ item.value[locale] }}</h6>
					<q-expansion-item
						v-for="(el, indx) in item.data?.entity"
						:key="indx"
						class="faq__body__item"
						:label="el.fields.question[locale].value"
						expand-icon="add"
						expanded-icon="close"
					>
						<div class="faq__body__item__body">
							<p>{{ el.fields.description[locale].value }}</p>
						</div>
					</q-expansion-item>
					<q-circular-progress v-if="item.data.isLoading" indeterminate size="40px" color="primary" :thickness="0.1" />
					<q-btn
						v-if="isViewBtn(item.data.count, item.data.page)"
						:key="item.data.page"
						class="faq__btn"
						:disable="item.data.isLoading"
						flat
						@click="getMore(item.data.page, item.id!)"
					>
						Просмотреть все вопросы
					</q-btn>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss">
	.faq {
		&__body {
			&__item {
				.q-item {
					padding: 0;

					.q-focus-helper {
						display: none;
					}

					&__label {
						font-size: 1.22em;
						font-weight: bold;
						letter-spacing: 1px;
						line-height: 150% !important;
					}
				}
			}
		}
	}
</style>
<style lang="scss" scoped>
	.faq {
		&__btn {
			padding: 16px 0;
			color: var(--red);
			font-weight: bold;
			margin-top: 7px;
		}
		&__header {
			margin-bottom: 64px;

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 32px;
			}
		}

		&__body {
			&__columns {
				width: calc(50% - 32px);
			}
			&__title {
				font-weight: bold;
				font-size: 1.55em;
				margin-bottom: 32px;
			}

			&__item {
				padding: 16px 0;
				border-bottom: 1px rgba(227, 227, 227, 1) solid;
				&__body {
					padding-top: 16px;
					p {
						font-size: 0.9em;
						letter-spacing: 1px;
						line-height: 140%;
					}
				}
			}

			@media (max-width: 900px) {
				flex-wrap: wrap !important;

				&__columns {
					width: 100%;
					margin-bottom: 32px;

					&:last-child {
						margin-bottom: 0;
					}
				}

				&__title {
					margin-bottom: 16px;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				&__title {
					margin-bottom: 16px;
				}

				&__item {
					padding: 8px 0;
				}
			}
		}
	}
</style>

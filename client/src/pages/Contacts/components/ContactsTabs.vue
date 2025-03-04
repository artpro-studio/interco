<script lang="ts" setup>
	import { computed, ref } from 'vue';
	import { useI18n } from 'vue-i18n';
	import { formatterPhone } from 'src/helpers/formatterPhone';

	interface IProps {
		data: any;
	}
	const props = defineProps<IProps>();

	const { t, locale } = useI18n();

	const tab = ref('contact1');

	const getData = computed((): any => {
		const result: any = [];
		props.data?.forEach((el: any, index: number) => {
			result.push({
				key: 'contact' + (index + 1),
				name: el.fields?.title[locale.value]?.value,
				data: {
					address: {
						text: el.fields?.address[locale.value]?.value,
						link: {
							text: t('contactsTextMaps') + ' (https://map.baidu.com/)',
							src: el.fields?.link[locale.value]?.value,
						},
					},
					phone: {
						common: el.fields['general-phone'][locale.value]?.value,
						salesDepartment: el.fields['department-phone'][locale.value]?.value,
						support: el.fields['technical-phone'][locale.value]?.value,
					},
					email: {
						common: el.fields['general-email'][locale.value]?.value,
						salesDepartment: el.fields['general-email'][locale.value]?.value,
						support: el.fields['general-email'][locale.value]?.value,
					},
					time: el.fields['time-job'][locale.value]?.value,
				},
			});
		});
		return result;
	});
</script>

<template>
	<div class="contacts-tabs pb-8">
		<div data-aos="fade-up" class="container">
			<div class="contacts-tabs__body">
				<q-tabs v-model="tab" align="left" class="contacts-tabs__tabs">
					<q-tab
						v-for="(item, index) in getData"
						:key="index"
						class="contacts-tabs__tabs__item"
						:name="item.key"
						:label="item.name"
					/>
				</q-tabs>
				<q-tab-panels v-model="tab" class="contacts-tabs__panels" animated>
					<q-tab-panel v-for="(item, index) in getData" :key="index" :name="item.key" class="contacts-tabs__panel">
						<div class="contacts-tabs__content row no-wrap">
							<div class="contacts-tabs__item">
								<h5 class="contacts-tabs__item__title">{{ t('address') }}</h5>
								<div class="contacts-tabs__item__info">
									<p>{{ item.data.address.text }}</p>
									<div v-if="item.data.address.link" class="contacts-tabs__item__info__link">
										<a :href="item.data.address.link.src">{{ item.data.address.link.text }}</a>
									</div>
								</div>
							</div>
							<div class="contacts-tabs__item">
								<h5 class="contacts-tabs__item__title">{{ t('phone') }}</h5>
								<div class="contacts-tabs__item__contact row">
									<span>{{ t('contactsGeneral') }}:</span>
									<a :href="formatterPhone(item.data.phone.common)">{{ item.data.phone.common }}</a>
								</div>
								<div class="contacts-tabs__item__contact row">
									<span>{{ t('contactsTotalSales') }}:</span>
									<a :href="formatterPhone(item.data.phone.salesDepartment)">{{ item.data.phone.salesDepartment }}</a>
								</div>
								<div class="contacts-tabs__item__contact row">
									<span>{{ t('contactsSupportText') }}:</span>
									<a :href="formatterPhone(item.data.phone.support)">{{ item.data.phone.support }}</a>
								</div>
							</div>
							<div class="contacts-tabs__item">
								<h5 class="contacts-tabs__item__title">{{ t('email') }}</h5>
								<div class="contacts-tabs__item__contact row">
									<span>{{ t('contactsGeneral') }}:</span>
									<a :href="'mailto:' + item.data.email.common">{{ item.data.email.common }}</a>
								</div>
								<div class="contacts-tabs__item__contact row">
									<span>{{ t('contactsTotalSales') }}:</span>
									<a :href="'mailto:' + item.data.email.salesDepartment">{{ item.data.email.salesDepartment }}</a>
								</div>
								<div class="contacts-tabs__item__contact row">
									<span>{{ t('contactsSupportText') }}:</span>
									<a :href="'mailto:' + item.data.email.support">{{ item.data.email.support }}</a>
								</div>
							</div>
							<div class="contacts-tabs__item">
								<h5 class="contacts-tabs__item__title">{{ t('timeJob') }}</h5>
								<div class="contacts-tabs__item__info time">
									<p v-html="item.data.time"></p>
								</div>
							</div>
						</div>
					</q-tab-panel>
				</q-tab-panels>
			</div>
		</div>
	</div>
</template>
<style lang="scss">
	.contacts-tabs__tabs__item {
		.q-focus-helper {
			display: none;
		}
		.q-tab__indicator {
			display: none;
		}
		.q-ripple {
			display: none;
		}
		.q-tab__content {
			min-width: auto;
		}
		.q-tab {
			&__label {
				font-size: 1.335em;
				font-weight: 500;
			}
		}
	}
</style>
<style lang="scss" scoped>
	.contacts-tabs {
		padding-top: 40px;
		&__tabs {
			margin-bottom: 64px;

			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 24px;
			}

			&__item {
				padding: 0;
				margin-right: 80px;
				color: var(--gray-secondary);
				font-family: 'Oswald', sans-serif;

				@media (max-width: $breakpoint-sm-min) {
					margin-right: 20px;
				}

				&:last-child {
					margin-right: 0;
				}

				&.q-tab--active {
					color: var(--red);
				}
			}
		}

		&__panels {
			background-color: transparent;
		}

		&__panel {
			padding: 0;
			background-color: transparent;
		}

		&__content {
			font-family: 'Oswald', sans-serif;

			@media (max-width: 900px) {
				flex-wrap: wrap;
			}
		}

		&__item {
			width: 25%;
			font-size: 1em;
			border-right: 2px #cfd1d8 solid;
			padding-right: 20px;
			margin-right: 34px;

			@media (max-width: 900px) {
				width: calc(50% - 25px);

				&:nth-child(2n) {
					margin-right: 0;
					border-right: none;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				width: 100%;
				margin-right: 0;
				border-right: none;
				border-bottom: 2px #cfd1d8 solid;
				margin-bottom: 20px;
				padding-bottom: 20px;

				&:last-child {
					margin-bottom: 0;
				}
			}

			&:last-child {
				border-right: none;
			}
			&__title {
				text-transform: uppercase;
				font-size: 1.22em;
				font-weight: 500;
				margin-bottom: 32px;
				@media (max-width: $breakpoint-sm-min) {
					margin-bottom: 16px;
				}
			}

			&__info {
				&.time {
					p {
						line-height: 180%;
					}
				}
				&__link {
					margin-top: 16px;

					a {
						color: var(--red);
						text-decoration: none;
					}
				}
			}

			&__contact {
				margin-bottom: 8px;
				&:last-child {
					margin-bottom: 0;
				}
				span {
					line-height: 135%;
					margin-right: 5px;
				}
				a {
					color: var(--dark-blue);
					text-decoration: none;
					line-height: 135%;

					&:hover {
						color: var(--red);
					}
				}
			}
		}
	}
</style>

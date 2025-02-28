<script lang="ts" setup>
	import { RouterName } from 'src/router/routerName';
import { useI18n } from 'vue-i18n';
import { useRouter } from 'vue-router';

	interface IProps {
		data?: any;
	}
	defineProps<IProps>();
	const { locale } = useI18n();
	const router = useRouter();

	const routerReplace = (id: number) => {
		router.replace({name: RouterName.Services, hash: `#service-${id}`})
	}
</script>
<template>
	<div data-aos="fade-up" class="service-filter pb-8">
		<div class="container">
			<div class="service-filter__category row">
				<div class="service-filter__category__column">
					<div class="service-filter__category__item" v-for="(item, index) in data" :key="index">
						<a class="cursor-pointer" @click="routerReplace(item.id)">{{ item?.title[locale] }}</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.service-filter {
		&__sections {
			margin-bottom: 80px;
			&__item {
				position: relative;
				padding-right: 25px;
				margin-right: 10px;
				margin-bottom: 24px;

				&::before {
					content: '/';
					color: var(--gray-secondary);
					position: absolute;
					top: -4px;
					right: 0;
					font-size: 1.3em;
				}

				&:last-child, &:nth-child(3) {
					&::before {
						display: none;
					}
				}

				@media (max-width: 1175px) {
					&:nth-child(3){
						&::before {
							display: block;
						}
					}
				}

				a {
					text-decoration: none;
					color: var(--gray-secondary);

					&:hover {
						color: var(--dark-blue);
					}

					&.active {
						font-weight: bold;
						color: var(--dark-blue);
					}
				}
			}
			@media (max-width: $breakpoint-sm-min) {
				margin-bottom: 40px;

				&__item {
					margin-bottom: 8px;

					&::before {
						display: none !important;
					}
				}
			}
		}

		&__category {
			&__column {
				width: 50%;
			}

			&__item {
				margin-bottom: 24px;

				&:last-child {
					margin-bottom: 0;
				}

				a {
					font-size: 1.55em;
					text-decoration: none;
					font-weight: bold;
					font-family: 'Oswald', sans-serif;
					color: var(--dark-blue);

					&:hover {
						color: var(--red);
					}

					&.active {
						color: var(--red);
					}
				}

				@media (max-width: $breakpoint-sm-min) {
					margin-bottom: 16px;

					a {
						font-size: 1.22em;
					}
				}
			}
		}
	}
</style>

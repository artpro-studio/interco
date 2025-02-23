<script lang="ts" setup>
	interface IProps {
		isService?: boolean,
		title: string,
		itemTitle1: string,
		itemTitle2: string,
		itemTitle3: string,
		itemTitle4: string,
		itemText1: string,
		itemText2: string,
		itemText3: string,
		itemText4?: string,
	}
	defineProps<IProps>();
</script>
<template>
	<div class="products-advantages pb-12" :class="{service: isService}">
		<div class="container">
			<div class="products-advantages__title">
				<h4 class="headline-1">{{ title }}</h4>
			</div>
			<div class="products-advantages__body row no-wrap q-gutter-lg">
				<div class="products-advantages__item">
					<h5 class="products-advantages__item__title">{{ itemTitle1 }}</h5>
					<p>{{ itemText1 }}</p>
				</div>
				<div class="products-advantages__item">
					<h5 class="products-advantages__item__title">{{ itemTitle2 }}</h5>
					<p>{{ itemText2 }}</p>
				</div>
				<div class="products-advantages__item">
					<h5 class="products-advantages__item__title">{{ itemTitle3 }}</h5>
					<p>{{ itemText3 }}</p>
				</div>
				<div class="products-advantages__info">
					<h5>{{ itemTitle4 }}</h5>
					<p v-if="itemText4">{{ itemText4 }}</p>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.products-advantages {
		&.service {
			.products-advantages__info {
				display: flex;
				justify-content: space-between;
				flex-direction: row;
				flex-wrap: wrap;
				h5 {
					font-weight: normal;
				}

				p {
					font-size: 1.3em;
					font-weight: bold;
					color: var(--dark-blue);
				}
			}
		}
		&__title {
			text-transform: uppercase;
			color: var(--red);
			margin-bottom: 64px;

			@media (max-width: 600px) {
				margin-bottom: 30px;
				h4 {
					font-size: 1.5em;
				}
			}
		}

		&__body {
			@media (max-width: 1200px) {
				flex-wrap: wrap;
			}
		}

		&__item {
			background-color: #fff;
			border-radius: 8px;
			padding: 24px;
			min-width: 270px;
			max-width: 270px;

			@media (max-width: 1200px) {
				min-width: calc(33.3333% - 24px);
				max-width: calc(33.3333% - 24px);
			}

			@media (max-width: 768px) {
				min-width: calc(50% - 24px);
				max-width: calc(50% - 24px);
			}

			@media (max-width: 600px) {
				max-width: 100%;
				min-width: none;
				width: 100%;
			}

			&__title {
				font-size: 1.3em;
				border-bottom: 3px var(--red) solid;
				padding-bottom: 16px;
				font-weight: bold;
				margin-bottom: 16px;
			}

			p {
				color: var(--gray-secondary);
				font-size: 1em;
				line-height: 1.4;
				font-weight: bold;
			}
		}

		&__info {
			max-width: 400px;
			h5 {
				font-size: 1.3em;
				font-weight: bold;
				margin-bottom: 16px;
			}

			p {
				color: var(--gray-secondary);
				line-height: 1.4;
				font-weight: bold;
			}

			@media (max-width: 768px) {
				max-width: calc(50% - 24px);
			}
			@media (max-width: 600px) {
				max-width: 100%;
			}
		}
	}
</style>

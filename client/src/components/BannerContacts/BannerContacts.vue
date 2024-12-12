<script lang="ts" setup>
	interface IProps {
		title: string;
		description?: string;
		text: string;
		phone: string;
		email: string;
	}
	defineProps<IProps>();
</script>

<template>
	<div class="banner-contacts pt-8 pb-12">
		<div class="container">
			<h4 class="banner-contacts__title headline-1 text-gradient">{{ title }}</h4>
			<div v-if="description" class="banner-contacts__description fonts-oswald text-white">
				<p>{{ description }}</p>
			</div>
			<div class="banner-contacts__body row no-wrap items-center justify-between fonts-oswald">
				<div class="banner-contacts__info">
					<div class="banner-contacts__info__item">
						<a :href="'tel:' + phone">{{ phone }}</a>
					</div>
					<div class="banner-contacts__info__item">
						<a :href="'mailto:' + email">{{ email }}</a>
					</div>
				</div>
				<div class="banner-contacts__text">
					<p>{{ text }}</p>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.banner-contacts {
		background-image: url('images/banner-contacts.png');
		background-repeat: no-repeat;
		background-position: center;
		background-size: cover;

		&__description {
			margin-top: 24px;
			font-size: 1.35em;

		}

		&__body {
			margin-top: 64px;

			@media (max-width: 800px) {
				flex-wrap: wrap;
			}
			@media (max-width: $breakpoint-sm-min) {
				margin-top: 24px;
			}
		}

		&__info {
			font-size: 2.45em;
			&__item {
				margin-bottom: 24px;

				&:last-child {
					margin-bottom: 0;
				}
				a {
					color: var(--white);
					text-decoration: none;
					transition: .4s all;

					&:hover {
						color: var(--red);
					}
				}
			}
			@media (max-width: $breakpoint-md-min) {
				font-size: 2em;

				&__item {
					margin-bottom: 8px;
				}
			}
			@media (max-width: 800px) {
				width: 100%;
				margin-bottom: 16px;
			}
		}

		&__text {
			font-size: 1.8em;
			max-width: 484px;
			color: var(--white);

			@media (max-width: $breakpoint-md-min) {
				font-size: 1.5em;
			}
		}
	}
</style>

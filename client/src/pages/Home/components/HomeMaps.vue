
<template>
	<div class="home-maps pt-8 pb-12">
		<div class="container">
			<div class="home-maps__top row no-wrap items-center">
				<q-img src="icons/arrow-red.svg" width="26px" fit="contain" class="home-maps__top__img" />
				<h3 class="home-maps__top__title headline-1 text-white">Наши направления деятельности</h3>
			</div>
			<div class="home-maps__body">
				<q-img src="images/maps.png" class="home-maps__img" />
			</div>
			<div class="home-maps__list row no-wrap justify-between">
				<div class="home-maps__list__item">
					<h4 class="home-maps__list__item__title fonts-oswald">Страны СНГ</h4>
					<p class="home-maps__list__item__text">Россия, Беларусь, Узбекистан, Казахстан, Таджикистан</p>
				</div>
				<div class="home-maps__list__item">
					<h4 class="home-maps__list__item__title fonts-oswald">Международные рынки</h4>
					<p class="home-maps__list__item__text">Европа, США, Канада, Малайзия, Индия, Южная Корея, Австралия, Таиланд</p>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.home-maps {
		&__top {
			padding-left: 18px;
			margin-bottom: 64px;

			&__img {
				margin-right: 52px;
			}

			&__title {
				text-transform: uppercase;
			}

			@media (max-width: $breakpoint-sm-min) {
				padding-left: 0px;
				margin-bottom: 40px;
				&__img {
					margin-right: 18px;
					width: 40px !important;
				}

			}
		}

		&__body {
			margin-bottom: 24px;
		}
		&__img {
			width: 100%;
		}

		&__list {
			color: var(--white);

			&__item {
				padding-right: 64px;
				width: 50%;
				&__title {
					font-size: 2.4em;
					font-weight: 500;
					margin-bottom: 32px;
				}

				&__text {
					font-size: 1.55em;
					color: var(--gray);
				}
			}

			@media (max-width: 900px) {
				&__item {
					padding-right: 10px;

					&__title {
						font-size: 1.5em;
					}

					&__text {
						font-size: 1.13em;
					}

				}
			}

			@media (max-width: $breakpoint-sm-min) {
				flex-wrap: wrap;

				&__item {
					width: 100%;
					margin-bottom: 24px;
					&__title {
						margin-bottom: 16px;
					}
				}
			}
		}
	}
</style>

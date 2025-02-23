<template>
	<div data-aos="fade-up" class="service-filter pb-8">
		<div class="container">
			<div class="service-filter__category row">
				<div class="service-filter__category__column">
					<div class="service-filter__category__item">
						<a href="/" class="active">Строительное оборудование</a>
					</div>
					<div class="service-filter__category__item">
						<a href="/">Дорожное оборудование</a>
					</div>
					<div class="service-filter__category__item">
						<a href="/">Металлургическое оборудование</a>
					</div>
				</div>
				<div class="service-filter__category__column">
					<div class="service-filter__category__item">
						<a href="/">Горнодобывающее оборудование</a>
					</div>
					<div class="service-filter__category__item">
						<a href="/">Химическое оборудование</a>
					</div>
					<div class="service-filter__category__item">
						<a href="/">Пищевое оборудование</a>
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

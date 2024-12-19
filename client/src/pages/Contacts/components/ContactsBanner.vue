<template>
	<div class="clients-section-text pt-8 pb-12">
		<div class="container">
			<div class="clients-section-text__title headline-1 text-gradient fonts-oswald text-uppercase">SA International</div>
			<h6 class="clients-section-text__subtitle fonts-oswald text-uppercase"> — всегда на связи с вами</h6>
			<p class="clients-section-text__text fonts-oswald">Мы ценим ваше время и готовы помочь вам в любой ситуации. Независимо от вашего местоположения, наши специалисты обеспечат профессиональную поддержку и ответят на все ваши вопросы.</p>
		</div>
		<div class="clients-section-text__arrows row no-wrap">
			<q-img class="clients-section-text__arrows__item" src="icons/arrow-red.svg" />
			<q-img class="clients-section-text__arrows__item" src="icons/arrow-red.svg" />
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.clients-section-text {
		position: relative;
		overflow: hidden;
		background-color: var(--dark-blue);

		&__title {
			margin-bottom: 24px;
			position: relative;
		}

		&__subtitle {
			font-size: 1.55em;
			margin-bottom: 40px;
			color: var(--white);
		}
		&__text {
			font-size: 1.22em;
			max-width: 487px;
			color: var(--white);
			line-height: 140%;
			position: relative;
			font-weight: normal;

			@media (max-width: $breakpoint-sm-min) {
				font-size: 1em;
			}
		}

		&__arrows {
			position: absolute;
			top: -2px;
			right: 0;

			&__item {
				width: 300px;
				opacity: .15;

				&:first-child {
					position: relative;
					right: -70px;
				}
			}

			@media (max-width: $breakpoint-sm-min) {
				right: -140px;

				&__item {
					width: 200px;

					&:first-child {
						position: relative;
						right: -40px;
					}
				}
			}
		}
	}
</style>

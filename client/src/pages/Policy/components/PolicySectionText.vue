<script lang="ts" setup>
	import VBtnGradient from 'src/components/UI/VBtnGradient/VBtnGradient.vue';
	interface IProps {
		buttonText?: string;
	}
	defineProps<IProps>();

</script>
<template>
	<div class="policy-section_text row no-wrap items-start">
		<div class="policy-section_text__info text-white">
			<slot name="text" />
			<v-btn-gradient v-if="buttonText" class="policy-section_text__info__btn">{{ buttonText }}</v-btn-gradient>
		</div>
		<div class="policy-section_text__list text-white">
			<slot name="list" />
		</div>
	</div>
</template>
<style lang="scss">
	.policy-section_text {
		position: relative;
		&__info {
			padding: 40px;
			background-color: rgba(35, 36, 57, 0.6);
			border-radius: 10px;
			max-width: 470px;
			margin-right: 40px;
			&__btn {
				margin-top: 56px;
			}
			p {
				font-size: 1.224em;
				margin-bottom: 40px;

				&:last-child {
					margin-bottom: 0;
				}
			}

			@media (max-width: 900px) {
				max-width: 370px;
			}
			@media (max-width: 800px) {
				max-width: none;
				width: 100%;
				margin-right: 0;
				padding: 16px;
			}
			@media (max-width: $breakpoint-sm-min) {
				&__btn {
					margin-top: 24px;
				}
				p {
					font-size: 1em;
					margin-bottom: 16px;
				}
			}
		}
		&__list {
			h5 {
				font-size: 1.224em;
				font-weight: 700;
				margin-bottom: 24px;
			}
			ul {
				list-style-type: none;
				margin: 0;
				padding: 0;

				li {
					margin: 0;
					padding: 0;
					font-size: 1em;
					line-height: 140%;
					margin-bottom: 16px;
					position: relative;
					padding-left: 48px;

					&::before {
						content: '';
						background-image: url('icons/arrow-yellow.svg');
						width: 30px;
						height: 30px;
						background-size: contain;
						background-position: center;
						background-repeat: no-repeat;
						position: absolute;
						top: 50%;
						margin-top: -16px;
						left: 0;
					}


					&:last-child {
						margin-bottom: 0;
					}
				}
			}

			@media (max-width: 800px) {
				padding: 16px;
				background-color: rgba(35, 36, 57, 0.6);
				border-radius: 10px;
			}

			@media (max-width: $breakpoint-sm-min) {
				h5 {
					font-size: 1em;
				}
				ul {
					li {
						margin-bottom: 8px;

						&::before {
							top: 50%;
							margin-top: -16px;
						}
					}
				}
			}
		}
		@media (max-width: 800px) {
			flex-wrap: wrap;
		}
	}
</style>

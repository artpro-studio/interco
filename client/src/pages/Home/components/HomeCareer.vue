<script lang="ts" setup>
	import { ref } from 'vue';
	import { useI18n } from 'vue-i18n';
	import ModalApplication from 'src/components/Modal/ModalApplication.vue';

	const { t } = useI18n();

	const isOpenDialog = ref(false);
</script>

<template>
	<div class="home-career text-center pt-12 pb-12">
		<div class="container">
			<div data-aos="zoom-in" class="home-career__body">
				<h4 class="home-career__title headline-1 text-gradient text-uppercase">{{ t('careerTitle') }}</h4>
				<p class="text-white">{{ t('careerText') }}</p>
				<q-btn color="white" class="home-career__btn text-bold" @click="isOpenDialog = true" flat>
					<div class="row no-wrap">
						<div>{{ t('moreDetailed') }}</div>
						<q-img src="icons/arrow-yellow-full.svg" class="q-ml-md" width="16px" :alt="t('moreDetailed')" />
					</div>
				</q-btn>
			</div>
		</div>
	</div>
	<q-dialog v-model="isOpenDialog">
		<modal-application @on-close="isOpenDialog = false" />
	</q-dialog>
</template>
<style lang="scss" scoped>
	.home-career {
		background-image: url('/images/career.png');
		background-color: var(--dark-blue);
		background-repeat: no-repeat;
		background-position: center;
		background-size: cover;
		position: relative;

		&::before {
			content: '';
			width: 100%;
			height: 100%;
			background-color: rgba(16,16,41, .69);
			position: absolute;
			top: 0;
			left: 0;
		}

		&__body {
			position: relative;
			padding: 0 40px;
		}

		&__title {
			margin-bottom: 24px;
		}

		p {
			font-weight: bold;
			font-size: 1.34em;
		}

		&__btn {
			margin-top: 76px;
		}

		@media (max-width: $breakpoint-sm-min) {
			&__body {
				padding: 0;
			}

			p {
				font-size: 1.15em;
			}

			&__btn {
				margin-top: 32px;
			}
		}
	}
</style>

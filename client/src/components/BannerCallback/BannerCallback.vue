<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';
	import VBtn from '../UI/VBtn/VBtn.vue';
	import ModalApplication from '../Modal/ModalApplication.vue';
	import { ref } from 'vue';

	const { t } = useI18n();
	const isOpenDialog = ref(false);
</script>
<template>
	<div class="banner-callback pt-8 pb-8 text-center">
		<div class="container">
			<div class="banner-callback__body">
				<h4 class="banner-callback__title headline-1 text-uppercase">{{ t('bannerCallbackTitle') }}</h4>
				<p class="banner-callback__text fonts-oswald">{{ t('bannerCallbackDescription') }}</p>
				<v-btn color="primary" class="banner-callback__btn" @on-click="isOpenDialog = true">
					<div class="row no-wrap">
						<span>{{ t('bannerCallbackBtnText') }}</span>
						<q-img src="icons/arrow-red.svg" fit="contain" width="16px" class="q-ml-md" />
					</div>
				</v-btn>
			</div>
		</div>
	</div>
	<q-dialog v-model="isOpenDialog">
		<modal-application @on-close="isOpenDialog = false" />
	</q-dialog>
</template>
<style lang="scss" scoped>
	.banner-callback {
		color: var(--white);
		background-image: url('/images/bg-client-contacts.png');
		background-repeat: no-repeat;
		background-position: center;
		background-size: cover;
		position: relative;

		&::before {
			content: '';
			width: 100%;
			height: 100%;
			background-color: rgba(16, 16, 41, 0.69);
			position: absolute;
			top: 0;
			left: 0;
		}

		&__body {
			position: relative;
		}

		&__title {
			margin-bottom: 24px;
		}

		&__text {
			max-width: 700px;
			margin: 0 auto;
			font-size: 1.22em;
			text-transform: uppercase;

			@media (max-width: $breakpoint-sm-min) {
				font-size: 1.12em;
			}
		}
		&__btn {
			margin-top: 64px;

			@media (max-width: $breakpoint-sm-min) {
				margin-top: 30px;
			}
		}
	}
</style>

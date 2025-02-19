<script lang="ts" setup>
	import SectionTitle from 'src/components/SectionTitle/SectionTitle.vue';
	import JobOpeningsSlide from './JobOpeningsSlide.vue';
	import { Swiper, SwiperSlide } from 'swiper/vue';
	import 'swiper/css';
	import { computed, inject, onMounted, ref, watch } from 'vue';
	import { useI18n } from 'vue-i18n';

	interface IProps {
		data: any;
	}
	defineProps<IProps>();

	const { t } = useI18n();

	const widthScreen = inject<any>('widthScreen', 0);
	const widthSlider = ref(0);

	watch(widthScreen, () => {
		getSilderWidth();
	})

	const getStyleWidth = computed(() => {
		return `calc(100% + ${widthSlider.value}px)`;
	})

	const getSilderWidth = () => {
		if (widthScreen._value > 1312) {
			widthSlider.value = (widthScreen._value - 1312) / 2 + 14;
		}
	}

	onMounted(() => {
		getSilderWidth();
	})
</script>

<template>
	<div class="job-openings pt-8 pb-8">
		<div class="container">
			<section-title :title="t('careerJobTitle')" />
		</div>
		<div class="job-openings__body">
			<div class="container">
				<div data-aos="fade-up" class="job-openings__body__wrapper" :style="{width: getStyleWidth}">
					<swiper
						class="swiper-container"
						:slidesPerView="'auto'"
						:space-between="40"
						:centeredSlides="false"
						:auto-height="true"
					>
						<swiper-slide v-for="(item, index) in data" :key="index">
							<job-openings-slide :data="item" />
						</swiper-slide>

					</swiper>
				</div>
			</div>
		</div>
	</div>
</template>
<style lang="scss">
	.job-openings {
		&__title {
			margin-bottom: 64px;
		}

		&__body {
			overflow: hidden;
			&__wrapper {
				position: relative;
			}
		}

		.swiper-slide {
			max-width: 520px;
			width: 520px;

			@media (max-width: $breakpoint-sm-min) {
				max-width: 330px;
				width: 330px;
			}
		}
	}
</style>

<script lang="ts" setup>
	import { useI18n } from 'vue-i18n';

	const { t } = useI18n();
</script>

<template>
	<div class="about-culture pt-8 pb-8 bg-white text-center">
		<div class="container">
			<div class="about-culture__body fonts-oswald">
				<h4 class="about-culture__title headline-1 text-gradient text-uppercase">{{ t('aboutCultureTitle') }}</h4>
				<p>{{ t('aboutCultureDescription') }}</p>
			</div>
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.about-culture {
		&__title {
			margin-bottom: 24px;
		}
		p {
			font-size: 1.22em;
			text-transform: uppercase;
			max-width: 840px;
			margin: 0 auto;
			font-weight: 500;
		}
	}
</style>

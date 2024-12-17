<script lang="ts" setup>
	import { computed } from 'vue';
import { useI18n } from 'vue-i18n';
	import { useRoute } from 'vue-router';

	const route = useRoute();
	const { locale } = useI18n({ useScope: 'global' })
	const localeOptions = [
        { value: 'ru', label: 'RU' },
        { value: 'en-US', label: 'EN' },
        { value: 'ch', label: 'CH' }
    ];

	const isWhite = computed(() => {
		return route.meta.background === 'white';
	})

	const onChange = (lang: string) => {
		locale.value = lang;
	}
</script>
<template>
	<div class="lang row no-wrap" :class="{white: isWhite}">
		<div v-for="item in localeOptions" :key="item.value" @click="onChange(item.value)" class="lang__item" :class="{'active': locale === item.value}">
			{{ item.label }}
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.lang {
		position: relative;
		z-index: 3;

		&__item {
			color: var(--white);
			cursor: pointer;
			position: relative;
			margin-right: 20px;
			font-size: .95em;
			opacity: .4;

			&::before {
				content: '/';
				position: absolute;
				top: 0;
				right: -15px;
				opacity: .4;
			}

			&:last-child {
				margin-right: 0;
				&::before {
					display: none;
				}
			}

			&.active {
				opacity: 1;
			}
		}

		&.white {
			.lang__item {
				color: #888891;
				opacity: 1;

				&.active {
					color: var(--dark-blue);;
				}
			}
		}
	}
</style>

<template>
	<div class="loader">
		<div class="loader__content q-gutter-md row items-center justify-center">
			<q-spinner color="warning" size="3em" />
		</div>
	</div>
</template>
<style lang="scss" scoped>
	.loader {
		background-color: var(--dark-blue);
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		z-index: 10000;

		&__content {
			height: 100%;
		}
	}
</style>

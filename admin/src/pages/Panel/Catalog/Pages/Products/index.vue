<script lang="ts" setup>
    import {createApp} from 'vue';
    import Products from './components/Products.vue';

    const app = createApp({});
    app.component('Products', Products);
</script>
<template>
    <div class="container">
        <products />
    </div>
</template>

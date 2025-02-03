<script lang="ts" setup>
    import {createApp} from 'vue';
    import ProductCreateOrUpdate from './components/ProductCreateOrUpdate.vue';

    const app = createApp({});
    app.component('ProductCreateOrUpdate', ProductCreateOrUpdate);
</script>

<template>
    <div class="container container-form">
        <product-create-or-update />
    </div>
</template>

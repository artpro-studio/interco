<script lang="ts" setup>
    import {createApp} from 'vue';
    import OrdersCrateOrUpdate from './components/OrdersCrateOrUpdate.vue';

    const app = createApp({});
    app.component('OrdersCrateOrUpdate', OrdersCrateOrUpdate);
</script>
<template>
    <div class="container container-form">
        <orders-crate-or-update />
    </div>
</template>

<script lang="ts" setup>
    import {createApp} from 'vue';
    import OrdersList from './components/OrdersList.vue';

    const app = createApp({});
    app.component('OrdersList', OrdersList);
</script>
<template>
    <div class="container">
        <orders-list />
    </div>
</template>

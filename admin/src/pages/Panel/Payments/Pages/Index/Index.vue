<script lang="ts" setup>
    import {createApp} from 'vue';
    import PaymentsList from './components/PaymentsList.vue';

    const app = createApp({});
    app.component('OrdersList', PaymentsList);
</script>
<template>
    <div class="container">
        <payments-list />
    </div>
</template>

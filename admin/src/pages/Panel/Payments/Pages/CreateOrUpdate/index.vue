<script lang="ts" setup>
    import {createApp} from 'vue';
    import PaymentsCrateOrUpdate from './components/PaymentsCrateOrUpdate.vue';

    const app = createApp({});
    app.component('PaymentsCrateOrUpdate', PaymentsCrateOrUpdate);
</script>
<template>
    <div class="container container-form">
        <payments-crate-or-update />
    </div>
</template>

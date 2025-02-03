<script lang="ts" setup>
    import {createApp} from 'vue';
    import WareHouseCreateOrUpdate from './components/WareHouseCreateOrUpdate.vue';

    const app = createApp({});
    app.component('WareHouseCreateOrUpdate', WareHouseCreateOrUpdate);
</script>
<template>
    <div class="container container-form">
        <ware-house-create-or-update />/
    </div>
</template>

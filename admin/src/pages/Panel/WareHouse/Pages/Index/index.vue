<script lang="ts" setup>
    import {createApp} from 'vue';
    import WareHouseList from './components/WareHouseList.vue';

    const app = createApp({});
    app.component('WareHouseList', WareHouseList);
</script>
<template>
    <div class="container">
        <ware-house-list />
    </div>
</template>

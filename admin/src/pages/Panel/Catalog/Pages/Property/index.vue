<script lang="ts" setup>
    import {createApp} from 'vue';
    import PropertyList from './components/PropertyList.vue';

    const app = createApp({});
    app.component('PropertyList', PropertyList);
</script>
<template>
    <div class="container">
        <property-list />
    </div>
</template>

<script lang="ts" setup>
    import { createApp } from 'vue';
    import SectionList from './components/SectionList.vue';

    const app = createApp({});
    app.component('SectionList', SectionList);

</script>
<template>
    <div class="container">
        <section-list />
    </div>
</template>

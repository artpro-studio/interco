<script lang="ts" setup>
    import {createApp} from 'vue';
    import SectionCreateOrUpdate from './components/SectionCreateOrUpdate.vue';
    const app = createApp({});
    app.component('SectionCreateOrUpdate', SectionCreateOrUpdate);
</script>
<template>
    <div class="container container-form">
        <section-create-or-update />/
    </div>
</template>

<script lang="ts" setup>
    import {createApp} from 'vue';
    import PropertyCreateOrUpdate from './components/PropertyCreateOrUpdate.vue';

    const app = createApp({});
    app.component('ProductCreateOrUpdate', PropertyCreateOrUpdate);
</script>

<template>
    <div class="container container-form">
        <property-create-or-update />
    </div>
</template>

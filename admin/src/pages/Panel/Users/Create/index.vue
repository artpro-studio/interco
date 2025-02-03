<script lang="ts" setup>
    import {createApp} from 'vue';
    import UserCrateOrUpdate from './components/UserCrateOrUpdate.vue';

    const app = createApp({});
    app.component('UserCrateOrUpdate', UserCrateOrUpdate);
</script>
<template>
    <div class="container container-form">
        <user-crate-or-update />
    </div>
</template>

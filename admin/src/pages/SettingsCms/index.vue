<script lang="ts" setup>
    import { createApp } from 'vue';
    import SettingsCmsBody from './components/SettingsCmsBody.vue';

    const app = createApp({});
    app.component('SettingsCmsBody', SettingsCmsBody);
</script>
<template>
    <settings-cms-body />
</template>

<script lang="ts" setup>
    import { createApp } from 'vue';
    import UsersList from './components/UsersList.vue';

    const app = createApp({});
    app.component('UsersList', UsersList);

</script>
<template>
    <div class="container">
        <users-list />
    </div>
</template>

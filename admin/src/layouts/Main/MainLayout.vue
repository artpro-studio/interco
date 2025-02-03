<script lang="ts">
    import { defineComponent, ref } from 'vue';
    import MainSidebar from 'layouts/Main/components/Sidebar/MainSidebar.vue';
    import MainHeader from 'layouts/Main/components/Header/MainHeader.vue';

    export default defineComponent({
        name: 'MainLayout',
        components: {
            MainSidebar,
            MainHeader,
        },
        setup() {
            const leftDrawerOpen = ref(false);

            return {
                leftDrawerOpen,
            };
        },
    });
</script>

<template>
    <q-layout view="lHh Lpr lFf">
        <main-sidebar :leftDrawerOpen="leftDrawerOpen" @update:model-value="leftDrawerOpen = $event" />
        <main-header :leftDrawerOpen="leftDrawerOpen" @update-sidebar="leftDrawerOpen = !leftDrawerOpen" />
        <q-page-container>
            <router-view />
        </q-page-container>
    </q-layout>
</template>

<style lang="scss">
    .q-card {
        box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
        border-radius: 12px;
    }
</style>

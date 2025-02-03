<template>
    <q-layout>
        <q-page-container>
            <header-login />
            <router-view />
        </q-page-container>
    </q-layout>
</template>

<script lang="ts">
    import { defineComponent } from 'vue';
    import HeaderLogin from 'src/components/HeaderLogin.vue';

    export default defineComponent({
        name: 'MainLogin',
        components: {
            HeaderLogin
        }
    });
</script>
<style lang="scss">
.main-container {
    max-width: 1400px;
    margin: 0 auto;
    padding: 0 15px;

    @media (max-width: 1400px) {
        padding: 0 45px;
    }


    @media (max-width: 650px) {
        padding: 0 30px;
    }
}
</style>

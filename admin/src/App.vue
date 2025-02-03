<template>
    <router-view />
</template>

<script lang="ts" setup>
    import { onMounted } from 'vue';
    import { useRoute, useRouter } from 'vue-router';
    import { getApiClientInitialParams, ResultDto, SettingsControllerClient } from './ApiClient/ApiClient';
    import { RouterName } from './router/routerName';
    import { useStore } from './store';

    const route = useRoute();
    const router = useRouter();
    const store = useStore();

    const isActiveSetting = async () => {
        const result: ResultDto = await new SettingsControllerClient(getApiClientInitialParams()).isActive();
        if (!result.isSuccess) {
            router.push('/settings-cms');
        }
    };

    const currentInfo = async () => {
        const accountInfo = await store.dispatch('accountModule/getAccountInfo');
        if (!accountInfo) {
            store.commit('authorizationModule/setToken', '');
            if (route.name !== RouterName.SettingsCMS) {
                router.push('/');
            }
        }
    };

    const loadData = async () => {
        // если это страницы личного кабинета то загружаем данные о пользователе
        if (route.meta.isNeedLogin) {
            await currentInfo();
        } else {
            if (store.getters['authorizationModule/getIsLogged']) {
                await currentInfo();
            } else {
                store.commit('authorizationModule/setToken', '');
                console.log(route.name, RouterName.SettingsCMS);
                if (route.name !== RouterName.SettingsCMS) {
                    router.push('/');
                }
            }
        }
    };

    onMounted(() => {
        setTimeout(async () => {
            loadData();
            await isActiveSetting();
        }, 500);
    });
</script>

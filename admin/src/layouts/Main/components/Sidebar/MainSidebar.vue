<script lang="ts" setup>
    import { useRouter } from 'vue-router';
    import { RouterName } from 'src/router/routerName';
    import { computed, ref, Ref } from 'vue';
    import { dataMenu, IMenuContent } from './data';
    import { useStore } from 'src/store';

    const router = useRouter();
    const store = useStore();

    const emit = defineEmits(['update:model-value']);
    const props = defineProps({
        leftDrawerOpen: Boolean,
    });

    const menu: Ref<IMenuContent[]> = ref(dataMenu);

    const currentValue = computed({
        get: () => props.leftDrawerOpen,
        set: (value) => emit('update:model-value', value),
    });

    const getRouter = (namePage: RouterName | undefined): string => {
        const path = router.resolve({
            name: namePage,
        });
        return path.fullPath;
    };

    const onLogout = async () => {
        await store.dispatch('authorizationModule/logout');
        router.push({
            name: RouterName.Login,
        });
    };
</script>

<template>
    <q-drawer class="main-sidebar" :model-value="currentValue" :mini="true" :width="70" @hide="currentValue = false" show-if-above bordered>
        <div class="main-sidebar__wrapper">
            <div class="main-sidebar__top">
                <div class="main-sidebar__header">
                    <router-link class="main-sidebar__logo row items-center" to="/">
                        <img src="/images/logo.svg" alt="" />
                    </router-link>
                </div>
                <q-list class="main-sidebar__body">
                    <div v-for="(item, index) in menu" :key="'menu-' + index">
                        <div class="main-sidebar__content">
                            <div v-for="(el, indx) in item.content" :key="'menu-item-' + indx">
                                <q-item v-if="!el.children" :to="getRouter(el.path)" class="main-sidebar__item" exact>
                                    <q-icon class="material-symbols-rounded" :name="el.icon" size="18px" />
                                    <q-tooltip anchor="center right" self="center left">{{ el.name }}</q-tooltip>

                                    <q-menu> </q-menu>
                                </q-item>
                                <q-item class="main-sidebar__item" v-else>
                                    <q-icon class="material-symbols-rounded" :name="el.icon" size="18px" />
                                    <q-tooltip anchor="center right" self="center left">{{ el.name }}</q-tooltip>

                                    <q-menu anchor="center right" self="center left" class="main-sidebar__item__children">
                                        <q-list class="main-sidebar__item__children__list">
                                            <q-item
                                                v-for="(children, indexChildren) in el.children"
                                                :key="'menu-child-' + indexChildren"
                                                class="main-sidebar__item__children__list__item"
                                                :to="getRouter(children.path)"
                                                clickable
                                                exact
                                            >
                                                <q-item-section class="main-sidebar__item__children__list__item__section">
                                                    {{ children.title }}
                                                </q-item-section>
                                            </q-item>
                                        </q-list>
                                    </q-menu>
                                </q-item>
                            </div>
                        </div>
                        <div class="main-sidebar__line"></div>
                    </div>
                </q-list>
            </div>
            <div class="main-sidebar__bottom">
                <q-item to="/panel" class="main-sidebar__item" exact>
                    <q-icon class="material-symbols-rounded" name="notifications" size="18px" />
                    <q-tooltip anchor="center right" self="center left">Уведомления</q-tooltip>
                </q-item>
                <div class="main-sidebar__user">
                    <q-avatar class="main-sidebar__user__avatar" size="24px">Я.А.</q-avatar>
                    <q-menu anchor="center right" self="center left" class="main-sidebar__item__children">
                        <q-list class="main-sidebar__item__children__list">
                            <q-item class="main-sidebar__item__children__list__item" clickable @click="onLogout">
                                <q-item-section class="main-sidebar__item__children__list__item__section"> Выйти </q-item-section>
                            </q-item>
                        </q-list>
                    </q-menu>
                </div>
            </div>
        </div>
    </q-drawer>
</template>
<style lang="scss">
    .material-symbols-rounded {
        font-variation-settings: 'FILL' 1, 'wght' 700, 'GRAD' 200, 'opsz' 48;
    }
</style>
<style lang="scss">
    .main-sidebar {
        text-align: center;
        padding: 20px 10px !important;

        &__wrapper {
            display: flex;
            flex-wrap: nowrap;
            flex-direction: column;
            justify-content: space-between;
            height: 100%;
        }

        &__logo {
            text-align: center;
            margin-bottom: 40px;

            img {
                margin: 0 auto;
            }
        }

        &__content {
        }

        &__item {
            min-height: auto !important;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 10px;
            padding: 10px 5px !important;
            position: relative;

            &:before {
                content: '';
                height: 100%;
                width: 4px;
                background-color: var(--q-primary);
                position: absolute;
                top: 0;
                left: -10px;
                transition: 0.4s all;
                opacity: 0;
            }

            i {
                color: #d5d6de;
            }

            .q-focus-helper {
                display: none !important;
            }

            &.q-router-link--active {
                i {
                    color: var(--q-primary);
                }

                &:before {
                    opacity: 1;
                }
            }

            &__children {
                box-shadow: 23px 0px 20px rgba(24, 30, 56, 0.03);
                z-index: 6005 !important;

                &__list {
                    &__item {
                        padding: 5px 10px;
                        min-height: 40px;
                        &__section {
                            font-size: 12px;
                        }
                    }
                }
            }
        }

        &__line {
            width: 21px;
            height: 1px;
            background-color: #e3e7f9;
            margin: 15px auto;
        }

        &__user {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: var(--q-dark);
            color: #fff;
            margin: 0 auto;
            margin-top: 20px;
        }
    }
    .q-drawer {
        background: transparent !important;

        @media (max-width: 1024px) {
            background-color: #f7f7fa !important;

            &__backdrop {
                background-color: transparent !important;
            }
        }
    }
</style>

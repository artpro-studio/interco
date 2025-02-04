<script lang="ts" setup>
    import { RouteLocationMatched, RouteLocationNormalizedLoaded, useRoute } from 'vue-router';
    import { computed, onMounted, onUnmounted, reactive, ref, Ref, watch } from 'vue';

    const route = useRoute();

    const emit = defineEmits(['update-sidebar']);
    const props: {
        leftDrawerOpen: boolean;
    } = defineProps({
        leftDrawerOpen: Boolean,
    });
    const head = reactive({
        title: '',
    });
    const isScroll: Ref<boolean> = ref(false);

    watch(route, (newRouter: RouteLocationNormalizedLoaded) => {
        const { meta } = newRouter;
        head.title = meta.title as string;
    });

    const breadcrumbsData = computed(() => {
        const breadcrumbs: RouteLocationMatched[] = [];
        route.matched.forEach((item: RouteLocationMatched, index: number, array: RouteLocationMatched[]) => {
            if (array[index - 1]) {
                if (item.path !== array[index - 1].path) {
                    breadcrumbs.push(item);
                }
            } else {
                breadcrumbs.push(item);
            }
        });

        return breadcrumbs;
    });

    const changeManu = () => {
        emit('update-sidebar');
    };

    const scrollHeader = () => {
        isScroll.value = window.scrollY > 40;
    };

    onMounted(() => {
        const { meta } = route;
        head.title = meta.title as string;
        window.addEventListener('scroll', scrollHeader);
    });

    onUnmounted(() => {
        window.removeEventListener('scroll', scrollHeader);
    });
</script>
<template>
    <q-header class="main-header" :class="{ active: isScroll }">
        <div class="main-header__mobile">
            <div class="container">
                <div class="main-header__mobile__body row items-center">
                    <div class="col-4">
                        <q-btn flat @click="changeManu" round dense :icon="!props.leftDrawerOpen ? 'menu' : 'close'" />
                    </div>
                    <div class="col-4">
                        <router-link to="/panel" class="main-header__logo text-center">
                            <img src="/images/logo.svg" alt="" />
                        </router-link>
                    </div>
                    <div class="col-4">
                        <div class="main-header__mobile__right text-right">
                            <q-btn flat round dense icon="settings" class="main-header__settings q-ml-sm" size="12px" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="main-header__body">
                <div class="row items-center">
                    <div class="col col-lg-5 col-md-6 col-sm-12">
                        <div class="main-header__breadcrumbs">
                            <q-breadcrumbs active-color="dark">
                                <q-breadcrumbs-el v-for="(item, index) in breadcrumbsData" :key="'breadcrumbs-' + index" :to="item.path" :label="item.meta.title" />
                            </q-breadcrumbs>
                        </div>
                        <div class="main-header__title">
                            <h1 class="text-dark">{{ head.title }}</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </q-header>
</template>
<style lang="scss">
    .main-header {
        background: transparent;
        padding: 18px 0;
        padding-bottom: 40px;
        transition: 0.4s all;

        &.active {
            background-color: #f7f7fa;
            padding-bottom: 20px;
        }

        &__mobile {
            display: block;

            @media (min-width: 1024px) {
                display: none;
            }
        }

        &__breadcrumbs {
            a,
            .q-breadcrumbs__separator {
                color: var(--q-gray);
                font-size: 12px;
            }
            .q-breadcrumbs--last {
                a {
                    color: var(--q-dark);
                }
            }
        }

        &__title {
            margin-top: 5px;
            h1 {
                color: var(--q-dark);
                font-size: 1em;
                font-weight: bold;
            }
        }

        &__settings {
            color: var(--q-gray);
            font-size: 20px;
        }
    }
    @media (max-width: 1023px) {
        .main-header {
            padding-top: 0;
            &__mobile {
                background-color: #fff;
                padding: 4px 0;
                margin-bottom: 10px;
            }

            &__logo {
                display: block;
            }
        }
        .hidden-mobile {
            display: none;
        }
    }
</style>

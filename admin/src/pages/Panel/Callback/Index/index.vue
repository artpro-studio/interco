<script lang="ts" setup>
    import { CallbackControllerClient, CallbackDto, CallbackListDto, getApiClientInitialParams } from '@/ApiClient/ApiClient';
    import useResultException from '@/helpers/useResultException';
    import { RouterName } from '@/router/routerName';
    import { onMounted, ref, Ref } from 'vue';
    import { useRoute, useRouter } from 'vue-router';
    import { ICallback, ICallbackFilter } from '../interface';
    import CallbackTable from './components/CallbackTable.vue';

    const router = useRouter();
    const route = useRoute();
    const { resultError } = useResultException();

    let isLoading: Ref<boolean> = ref(true);
    const rows: Ref<ICallback[]> = ref([]);
    const limit: Ref<number> = ref(0);
    const count: Ref<number> = ref(0);
    const api = new CallbackControllerClient(getApiClientInitialParams());
    const filters: Ref<ICallbackFilter> = ref({
        search: '',
        pagesType: null,
        page: 1,
        limit: 10,
    });

    const generateRoute = () => {
        router.replace({
            name: RouterName.Callback,
            query: { ...filters.value },
        });
    };

    const updatePage = async (event: number) => {
        filters.value.page = event;
        create();
    };

    const create = async () => {
        isLoading.value = true;
        generateRoute();
        console.log(filters.value);
        const result: CallbackListDto | any = await api.get(filters.value.search ? filters.value.search : '', filters.value.page, filters.value.limit);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            rows.value =
                result.entity.entity.map((el: CallbackDto) => {
                    return {
                        ...el,
                        isChecked: false,
                    };
                }) || [];
            count.value = result.entity!.count!;
            limit.value = result.entity!.limit!;
        }
        isLoading.value = false;
    };

    const deleteUser = () => {
        filters.value.page = 1;
        create();
    };

    const getRouter = (namePage: RouterName): string => {
        const path = router.resolve({
            name: namePage,
        });

        return path.fullPath;
    };

    onMounted(() => {
        filters.value = {
            search: (route.query.search as string) || '',
            page: Number(route.query.page) || 1,
            limit: filters.value.limit,
        };
        create();
    });
</script>

<template>
    <div class="container">
        <pages-filter :filters="filters" @on-filters="create" />
        <div class="q-pa-md flex flex-center" v-if="isLoading">
            <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
        </div>
        <template v-else>
            <callback-table :rows="rows" :filters="filters" :count="count" :limit="limit" @update-page="updatePage" @on-delete="deleteUser" />
        </template>
        <q-btn color="primary" class="circle fixed" :to="getRouter(RouterName.CallbackCreate)">
            <q-icon name="add"></q-icon>
        </q-btn>
    </div>
</template>

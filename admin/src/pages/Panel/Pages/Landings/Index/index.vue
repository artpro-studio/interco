<script lang="ts" setup>
    import {
        getApiClientInitialParams,
        PagesControllerClient,
        PagesDto,
        PagesListDto,
        PagesType,
    } from 'src/ApiClient/ApiClient';
    import useResultException from 'src/helpers/useResultException';
    import { RouterName } from 'src/router/routerName';
    import { onMounted, ref, Ref } from 'vue';
    import { useRoute, useRouter } from 'vue-router';
    import { IPages, IPagesFilter } from '../../interface';
    import PagesTable from 'src/pages/Panel/Pages/Index/components/PagesTable.vue';
    import PagesFilter from '../../components/PagesFilter.vue';

    const router = useRouter();
    const route = useRoute();
    const { resultError } = useResultException();

    let isLoading: Ref<boolean> = ref(true);
    const rows: Ref<IPages[] | null> = ref(null);
    const limit: Ref<number> = ref(0);
    const count: Ref<number> = ref(0);
    const api = new PagesControllerClient(getApiClientInitialParams());
    const filters: Ref<IPagesFilter> = ref({
        search: '',
        pagesType: PagesType.Landing,
        page: 1,
        limit: 10,
    });

    const generateRoute = () => {
        router.push({
            name: RouterName.PagesLanding,
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
        const result: PagesListDto | any = await api.get(
            filters.value.search ? filters.value.search : '',
            filters.value.page,
            filters.value.limit,
            filters.value.pagesType || undefined
        );
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            rows.value =
                result.entity.entity.map((el: PagesDto) => {
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
            query: { type: PagesType.Landing },
        });

        return path.fullPath;
    };

    onMounted(() => {
        filters.value = {
            search: (route.query.search as string) || '',
            page: Number(route.query.page) || 1,
            limit: filters.value.limit,
            pagesType: PagesType.Landing,
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
            <pages-table
                :rows="rows"
                :filters="filters"
                :count="count"
                :limit="limit"
                @update-page="updatePage"
                @on-delete="deleteUser"
            />
        </template>
        <q-btn color="primary" class="circle fixed" :to="getRouter(RouterName.PagesCreate)">
            <q-icon name="add"></q-icon>
        </q-btn>
    </div>
</template>

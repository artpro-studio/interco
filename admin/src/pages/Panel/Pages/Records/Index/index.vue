e
<script lang="ts" setup>
    import {
        DropDownDto,
        getApiClientInitialParams,
        PagesControllerClient,
        RecordsControllerClient,
        RecordsDto,
        RecordsListDto,
    } from 'src/ApiClient/ApiClient';
    import useResultException from 'src/helpers/useResultException';
    import { RouterName } from 'src/router/routerName';
    import { onMounted, ref, Ref } from 'vue';
    import { useRoute, useRouter } from 'vue-router';
    import { IRecords, IRecordsFilter } from '../interface';
    import RecordsTable from './components/RecordsTable.vue';
    import RecordsFilter from '../components/RecordsFilter.vue';

    const router = useRouter();
    const route = useRoute();
    const { resultError } = useResultException();

    let isLoading: Ref<boolean> = ref(true);
    const rows: Ref<IRecords[] | null> = ref(null);
    const limit: Ref<number> = ref(0);
    const count: Ref<number> = ref(0);
    const api = new RecordsControllerClient(getApiClientInitialParams());
    const filters: Ref<IRecordsFilter> = ref({
        search: '',
        page: 1,
        limit: 10,
        pages: [],
    });
    const id: Ref<number | null> = ref(null);

    const generateRoute = () => {
        router.replace({
            name: RouterName.Records,
            query: {
                ...filters.value,
                pages: filters.value.pages.map((el) => el.value),
            },
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
        const result: RecordsListDto | any = await api.get(
            filters.value.search ? filters.value.search : '',
            filters.value.page,
            filters.value.limit,
            id.value || undefined,
            filters.value.page ? filters.value.pages.map((el) => el.value) : undefined
        );
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            rows.value =
                result.entity.entity.map((el: RecordsDto) => {
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
            query: { page: id.value || undefined },
        });

        return path.fullPath;
    };

    const getInfoPagesIds = async (ids: string | string[]): Promise<DropDownDto[]> => {
        let getIds: number[] = [];
        if (Array.isArray(ids)) {
            getIds = ids.map((el) => Number(el));
        } else {
            getIds = [Number(ids)];
        }
        const result = await new PagesControllerClient(getApiClientInitialParams()).getSelectIds(getIds);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            return result.entity.entity!;
        }

        return [];
    };

    onMounted(async () => {
        id.value = route.params.id ? Number(route.params.id) : null;
        filters.value = {
            search: (route.query.search as string) || '',
            page: Number(route.query.page) || 1,
            limit: filters.value.limit,
            pages: route.query.pages ? await getInfoPagesIds(route.query.pages as string[]) : [],
        };
        create();
    });
</script>

<template>
    <div class="container">
        <records-filter :filters="filters" @on-filters="create" />
        <div class="q-pa-md flex flex-center" v-if="isLoading">
            <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
        </div>
        <template v-else>
            <records-table
                :rows="rows"
                :filters="filters"
                :count="count"
                :limit="limit"
                @update-page="updatePage"
                @on-delete="deleteUser"
            />
        </template>
        <q-btn color="primary" class="circle fixed" :to="getRouter(RouterName.PagesBlogsRecordsCreate)">
            <q-icon name="add"></q-icon>
        </q-btn>
    </div>
</template>

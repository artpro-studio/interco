<script lang="ts" setup>
    import { CallbackFieldControllerClient, CallbackInstancesControllerClient, getApiClientInitialParams } from '@/ApiClient/ApiClient';
    import useResultException from '@/helpers/useResultException';
    import { RouterName } from '@/router/routerName';
    import { onMounted, ref } from 'vue';
    import { useRoute } from 'vue-router';
    import { useRouter } from 'vue-router';
    import CallbackInstancesTable from './components/CallbackInstancesTable.vue';
    import { ICallbackFilter, ICallbackInstances } from '../../interface';

    const apiField = new CallbackFieldControllerClient(getApiClientInitialParams());
    const apiInstances = new CallbackInstancesControllerClient(getApiClientInitialParams());
    const router = useRouter();
    const route = useRoute();
    const { resultError } = useResultException();
    const columns = ref<any>([
        {
            name: 'actions',
            label: '',
        },
        {
            name: 'id',
            label: 'ID',
            align: 'left',
        },
    ]);
    const rows = ref<ICallbackInstances[]>([]);
    const count = ref(0);
    const filters = ref<ICallbackFilter>({
        page: 1,
        limit: 10,
        search: '',
    });

    const redicrectCreate = () => {
        router.push({
            name: RouterName.CallbackInstancesCreate,
            params: {
                id: route.params.id,
            },
        });
    };

    const getField = async () => {
        const result = await apiField.get('', 1, 100, Number(route.params.id));
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            result.entity?.entity?.forEach((el: any) => {
                columns.value.push({
                    name: el.attribute,
                    label: el.name,
                    align: 'left',
                });
            });
        }
    };

    const updatePage = async (event: number) => {
        filters.value.page = event;
        getInfo();
    };

    const getInfo = async () => {
        const result = await apiInstances.get(filters.value.search, filters.value.page, filters.value.limit, Number(route.params.id));
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            rows.value = (result.entity!.entity! as any).map((el) => {
                return {
                    ...el,
                    isChecked: false,
                };
            });
            count.value = result.entity?.count || 0;
        }
    };

    onMounted(async () => {
        await getField();
        await getInfo();
    });
</script>

<template>
    <div>
        <callback-instances-table :rows="rows" :columns="columns" :count="count" :filters="filters" @update-page="updatePage" />
    </div>
    <q-btn color="primary" class="circle fixed" @click="redicrectCreate">
        <q-icon name="add"></q-icon>
    </q-btn>
</template>

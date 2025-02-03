<script lang="ts" setup>
    import { getApiClientInitialParams, ReferenceBookAttributeControllerClient, ReferenceBookInstancesControllerClient } from '@/ApiClient/ApiClient';
    import useResultException from '@/helpers/useResultException';
    import { RouterName } from '@/router/routerName';
    import { onMounted, ref } from 'vue';
    import { useRoute } from 'vue-router';
    import { useRouter } from 'vue-router';
    import ReferenceBookInstancesTable from './components/ReferenceBookInstancesTable.vue';
    import { IReferenceBookFilter, IReferenceBookInstances } from '../../interface';

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
    const rows = ref<IReferenceBookInstances[]>([]);
    const count = ref(0);
    const filters = ref<IReferenceBookFilter>({
        page: 1,
        limit: 10,
        search: '',
    });

    const redicrectCreate = () => {
        router.push({
            name: RouterName.ReferenceBookInstancesCreate,
            params: {
                id: route.params.id,
            },
        });
    };

    const getAttributes = async () => {
        const result = await new ReferenceBookAttributeControllerClient(getApiClientInitialParams()).get('', 1, 100, Number(route.params.id));
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            result.entity?.entity?.forEach((el: any) => {
                columns.value.push({
                    name: el.slug,
                    label: el.name,
                    align: 'left',
                });
            });
        }
    };

    const getInfo = async () => {
        const result = await new ReferenceBookInstancesControllerClient(getApiClientInitialParams()).get(
            filters.value.search,
            filters.value.page,
            filters.value.limit,
            Number(route.params.id)
        );
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
        await getAttributes();
        await getInfo();
    });
</script>

<template>
    <div>
        <reference-book-instances-table :rows="rows" :columns="columns" :count="count" :filters="filters" />
    </div>
    <q-btn color="primary" class="circle fixed" @click="redicrectCreate">
        <q-icon name="add"></q-icon>
    </q-btn>
</template>

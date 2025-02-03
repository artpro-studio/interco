<script lang="ts" setup>
    import {
        FullReferenceBookAttributesDto,
        getApiClientInitialParams,
        ReferenceBookAttributeControllerClient,
        ReferenceBookAttributesListDto,
    } from '@/ApiClient/ApiClient';
    import useResultException from '@/helpers/useResultException';
    import { onMounted, ref, Ref } from 'vue';
    import { useRoute } from 'vue-router';
    import { IReferenceBookAttribute, IReferenceBookAttributeFilter } from './interface';
    import AttributeIndexTable from './AttributeIndexTable.vue';
    import AttributeCreateOrUpdate from '../AttributeCreateOrUpdate/AttributeCreateOrUpdate.vue';

    const route = useRoute();
    const { resultError } = useResultException();

    let isLoading: Ref<boolean> = ref(true);
    const rows: Ref<IReferenceBookAttribute[]> = ref([]);
    const limit: Ref<number> = ref(0);
    const count: Ref<number> = ref(0);
    const api = new ReferenceBookAttributeControllerClient(getApiClientInitialParams());
    const filters: Ref<IReferenceBookAttributeFilter> = ref({
        search: '',
        pagesType: null,
        page: 1,
        limit: 10,
    });
    const modalCreateOrUpdate: Ref<{
        isOpen: boolean;
        id: number | null;
    }> = ref({
        isOpen: false,
        id: null,
    });

    const openCreateOrUpdate = (id: number | null) => {
        modalCreateOrUpdate.value = {
            isOpen: true,
            id,
        };
    };

    const closeCreateOrUpdate = () => {
        modalCreateOrUpdate.value = {
            isOpen: false,
            id: null,
        };
        getInfo();
    };

    // const generateRoute = () => {
    //     // router.replace({
    //     //     name: RouterName.ReferenceBookCreate,
    //     //     query: { ...filters.value },
    //     // });
    // };

    const updatePage = async (event: number) => {
        filters.value.page = event;
        getInfo();
    };

    const getInfo = async () => {
        isLoading.value = true;
        //generateRoute();
        const result: ReferenceBookAttributesListDto | any = await api.get(
            filters.value.search ? filters.value.search : '',
            filters.value.page,
            filters.value.limit,
            Number(route.params.id)
        );
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            rows.value =
                result.entity.entity.map((el: FullReferenceBookAttributesDto) => {
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
        getInfo();
    };

    onMounted(() => {
        filters.value = {
            search: (route.query.search as string) || '',
            page: Number(route.query.page) || 1,
            limit: filters.value.limit,
        };
        getInfo();
    });
</script>

<template>
    <div class="container">
        <div class="q-pa-md flex flex-center" v-if="isLoading">
            <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
        </div>
        <template v-else>
            <attribute-index-table
                :rows="rows"
                :filters="filters"
                :count="count"
                :limit="limit"
                @update-page="updatePage"
                @on-delete="deleteUser"
                @on-edit="(event: number) => openCreateOrUpdate(event)"
            />
        </template>
        <q-dialog v-model="modalCreateOrUpdate.isOpen" @hide="closeCreateOrUpdate">
            <attribute-create-or-update :reference-book-id="Number(route.params.id)" :id="modalCreateOrUpdate.id" @on-close="closeCreateOrUpdate" />
        </q-dialog>
        <q-btn color="primary" class="circle fixed" @click="() => openCreateOrUpdate(null)">
            <q-icon name="add"></q-icon>
        </q-btn>
    </div>
</template>

<script lang="ts" setup>
    import { getApiClientInitialParams, SendsSubscriptionControllerClient, SendsSubscriptionDto, SendsSubscriptionListDto } from 'src/ApiClient/ApiClient';
    import useResultException from 'src/helpers/useResultException';
    import { RouterName } from 'src/router/routerName';
    import { onMounted, ref, Ref } from 'vue';
    import { useRoute, useRouter } from 'vue-router';
    import { ISendsSubscription, ISendsSubscriptionFilter } from './interface';
    import SendsSubscriptionTable from './components/SendsSubscriptionTable.vue';
    import CreateSendsSubscription from './components/CreateSendsSubscription.vue';

    const router = useRouter();
    const route = useRoute();
    const { resultError } = useResultException();

    let isLoading: Ref<boolean> = ref(true);
    const rows: Ref<ISendsSubscription[]> = ref([]);
    const limit: Ref<number> = ref(0);
    const count: Ref<number> = ref(0);
    const api = new SendsSubscriptionControllerClient(getApiClientInitialParams());
    const filters: Ref<ISendsSubscriptionFilter> = ref({
        search: '',
        page: 1,
        limit: 10,
    });
    const modalCreate = ref<{
        isOpen: boolean;
        id: number | null;
    }>({
        isOpen: false,
        id: null,
    });

    const opOpenModalCreate = (id?: number) => {
        modalCreate.value = {
            isOpen: true,
            id: id ? id : null,
        };
    };

    const opCloseModalCreate = () => {
        modalCreate.value = {
            isOpen: false,
            id: null,
        };

        create();
    };

    const generateRoute = () => {
        router.replace({
            name: RouterName.SendsSubScription,
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
        const result: SendsSubscriptionListDto | any = await api.get(filters.value.search ? filters.value.search : '', filters.value.page, filters.value.limit);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            rows.value =
                result.entity.entity.map((el: SendsSubscriptionDto) => {
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
        <div class="q-pa-md flex flex-center" v-if="isLoading">
            <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
        </div>
        <template v-else>
            <sends-subscription-table :rows="rows" :filters="filters" :count="count" :limit="limit" @update-page="updatePage" @on-open="opOpenModalCreate" />
        </template>

        <q-btn color="primary" class="circle fixed" @click="() => opOpenModalCreate()">
            <q-icon name="add"></q-icon>
        </q-btn>

        <q-dialog v-model="modalCreate.isOpen" @hide="opCloseModalCreate">
            <create-sends-subscription :id="modalCreate.id" @on-close="opCloseModalCreate" />
        </q-dialog>
    </div>
</template>

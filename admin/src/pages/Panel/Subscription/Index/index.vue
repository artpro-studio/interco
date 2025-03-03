<script lang="ts" setup>
    import { getApiClientInitialParams, SubscriptionControllerClient, SubscriptionDto, SubscriptionListDto } from 'src/ApiClient/ApiClient';
    import useResultException from 'src/helpers/useResultException';
    import { RouterName } from 'src/router/routerName';
    import { onMounted, ref, Ref } from 'vue';
    import { useRoute, useRouter } from 'vue-router';
    import { ISubscription, ISubscriptionFilter } from './interface';
    import SubscriptionTable from './components/SubscriptionTable.vue';

    const router = useRouter();
    const route = useRoute();
    const { resultError } = useResultException();

    let isLoading: Ref<boolean> = ref(true);
    const rows: Ref<ISubscription[]> = ref([]);
    const limit: Ref<number> = ref(0);
    const count: Ref<number> = ref(0);
    const api = new SubscriptionControllerClient(getApiClientInitialParams());
    const filters: Ref<ISubscriptionFilter> = ref({
        search: '',
        page: 1,
        limit: 10,
    });

    const generateRoute = () => {
        router.replace({
            name: RouterName.Subscription,
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
        const result: SubscriptionListDto | any = await api.get(filters.value.search ? filters.value.search : '', filters.value.page, filters.value.limit);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            rows.value =
                result.entity.entity.map((el: SubscriptionDto) => {
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
            <subscription-table :rows="rows" :filters="filters" :count="count" :limit="limit" @update-page="updatePage" @on-delete="deleteUser" />
        </template>
    </div>
</template>

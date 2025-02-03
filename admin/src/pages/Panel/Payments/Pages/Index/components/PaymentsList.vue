<script lang="ts" setup>
    import {
        CreatePaymentsDto,
        getApiClientInitialParams,
        PaymentsControllerClient, ResponsePaymentsListDto,
    } from 'src/ApiClient/ApiClient';
    import {computed, createApp, onMounted, Ref, ref} from 'vue';
    import {useRouter} from 'vue-router';
    import {RouterName} from 'src/router/routerName';
    import {useQuasar} from 'quasar';
    import Pagination from 'src/components/Pagination/Pagination.vue';

    const app = createApp({});
    app.component('Pagination', Pagination);


    const $q = useQuasar();
    const router = useRouter();

    const columns = [
        {
            name: 'id',
            label: 'ID',
            align: 'left',
        },
        {
            name: 'name',
            label: 'Название',
            align: 'left',
        },
        {
            name: 'description',
            label: 'Описание',
            align: 'left',
        },
        {
            name: 'type',
            label: 'Тип оплаты',
            align: 'left',
        },
    ];

    let isLoading: Ref<boolean> = ref(true);
    const content: Ref<CreatePaymentsDto[] | null>= ref(null);
    const limit: Ref<number> = ref(0);
    const count: Ref<number> = ref(0);
    const page: Ref<number> = ref(1);
    const api =  new PaymentsControllerClient(getApiClientInitialParams());

    const lengthPages = computed(() => {
        return Math.ceil(count.value / limit.value);
    });

    const updatePage = (event: number) => {
        page.value = event;
        create();
    };

    const getRouterDetail = (id: number): string => {
        const path = router.resolve({
            name : RouterName.PaymentsEdit,
            params: {id: id.toString()}
        });

        return path.fullPath;
    };

    const create = async () => {
        const result: ResponsePaymentsListDto | any = await api.get(page.value);
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка'
            });
        } else {
            content.value = result.entity?.entity || [];
            count.value = result.entity!.count!;
            limit.value = result.entity!.limit!;
        }
        isLoading.value = false;
    };

    const getRouter = (namePage: RouterName): string => {
        const path = router.resolve({
            name : namePage,
        });

        return path.fullPath;
    };

    onMounted(() => {
        create();
    });

</script>
<template>
    <div>
        <div class="q-pa-md flex flex-center" v-if="isLoading">
            <q-circular-progress
                indeterminate
                size="50px"
                color="primary"
                class="q-ma-md"
                :thickness="0.1"
            />
        </div>
        <template v-else>
            <q-table
                :rows="content"
                :columns="columns"
                no-data-label="Ничего не найдено"
                row-key="name"
            >
                <template v-slot:body="props">
                    <tr>
                        <td class="text-left">{{ props.row.id }}</td>
                        <td class="text-left">
                            <router-link :to="getRouterDetail(props.row.id)">{{ props.row.name }}</router-link>
                        </td>
                        <td class="text-left">
                            <router-link :to="getRouterDetail(props.row.id)">{{ props.row.description }}</router-link>
                        </td>
                        <td class="text-left">
                            <router-link :to="getRouterDetail(props.row.id)">{{ props.row.type }}</router-link>
                        </td>
                    </tr>
                </template>
                <template v-slot:bottom v-if="lengthPages">
                    <pagination
                        :page="page"
                        :count="count"
                        :max="lengthPages"
                        @update="updatePage"
                    />
                </template>
            </q-table>
        </template>
        <q-btn
            color="primary"
            class="circle fixed"
            :to="getRouter(RouterName.PaymentsCreate)"
        >
            <q-icon name="add"></q-icon>
        </q-btn>
    </div>
</template>

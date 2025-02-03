<script lang="ts" setup>
    import NoItems from 'components/NoItems/NoItems.vue';
    import {computed, onMounted, ref, Ref} from 'vue';
    import {
        CounterWareHouseControllerClient, FullCounterCommercialWareHouseDto,
        getApiClientInitialParams,
        ResponseCounterWareHouseListDto
    } from 'src/ApiClient/ApiClient';
    import {useQuasar} from 'quasar';
    import UTPWareHouseCreateOrUpdate
        from 'pages/Panel/Catalog/Pages/UTPCreateOrUpdate/components/UTPWareHouseCreateOrUpdate.vue';

    const $q = useQuasar();

    const props: {
        idCommercial: number,
    } = defineProps({
        idCommercial: {
            required: true,
            type: Number,
        }
    });

    const api = new CounterWareHouseControllerClient(getApiClientInitialParams());
    const isLoading: Ref<boolean> = ref(true);
    const content: Ref<FullCounterCommercialWareHouseDto[]> = ref([]);
    const limit: Ref<number> = ref(0);
    const count: Ref<number> = ref(0);
    const page: Ref<number> = ref(1);
    const columns = [
        {
            name: 'id',
            label: 'ID',
            align: 'left',
        },
        {
            name: 'created_at',
            label: 'Дата создания',
            align: 'left',
        },
        {
            name: 'quantity',
            label: 'Кол-во',
            align: 'left',
        },
        {
            name: 'wareHouse',
            label: 'Склад',
            align: 'left',
        },
    ];
    const isCreateOrUpdate: Ref<boolean> = ref(false);
    const idCounterWareHouse: Ref<number | null> = ref(null);

    const lengthPages = computed(() => {
        return Math.ceil(count.value / limit.value);
    });

    // Выбранные склады
    const ids = computed((): number[] | null => {
        return content.value && content.value.length ? content.value.map((el) => el.id!) : null;
    });

    const updatePage = (event: number) => {
        page.value = event;
        isLoading.value = true;
        create();
    };


    const openUpdate = (id: number) => {
        idCounterWareHouse.value = id;
        isCreateOrUpdate.value = true;
    };

    const closeCreateOrUpdate = () => {
        idCounterWareHouse.value = null;
        isCreateOrUpdate.value = false;
        create();
    };

    const create = async () => {
        const result: ResponseCounterWareHouseListDto = await api.get(props.idCommercial, page.value);
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка'
            });
        } else {
            content.value = result.entity!.entity!;
            limit.value = result.entity!.limit!;
            count.value = result.entity!.count!;
        }

        isLoading.value = false;
    };

    onMounted(() => {
        if (props.idCommercial) {
            create();
        }
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
        <template v-else-if="content && content.length">
            <q-table
                :rows="content"
                :columns="columns"
                no-data-label="Ничего не найдено"
                :rows-per-page-options="[0]"
                row-key="name"
            >
                <template v-slot:body="props">
                    <tr>
                        <td class="text-left">
                            <span @click="openUpdate(props.row.id )" class="link">{{ props.row.id }}</span>
                        </td>
                        <td class="text-left">
                            <span @click="openUpdate(props.row.id )" class="link"> {{ props.row.created_at }} </span>
                        </td>
                        <td class="text-left">
                            <span @click="openUpdate(props.row.id )" class="link">{{ props.row.quantity }}</span>
                        </td>
                        <td class="text-left">
                            <span v-if="props.row.warehouse" @click="openUpdate(props.row.id )" class="link">
                                {{ props.row.warehouse.name }}
                            </span>
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
            <q-btn class="gradient-black q-mt-lg" @click="isCreateOrUpdate = !isCreateOrUpdate">Добавить</q-btn>
        </template>
        <no-items
            v-else
            text="Добавьте кол-во на складе"
            @click="isCreateOrUpdate = true"
        />

        <q-dialog v-model="isCreateOrUpdate" @hide="closeCreateOrUpdate">
            <UTPWareHouseCreateOrUpdate
                :id="idCounterWareHouse"
                :idCommercial="props.idCommercial"
                :ids="ids"
                @change="closeCreateOrUpdate" />
        </q-dialog>
    </div>

</template>

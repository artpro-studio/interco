<script lang="ts" setup>
    import { computed, onMounted, ref, Ref } from 'vue';
    import {
        CommercialControllerClient,
        getApiClientInitialParams,
        ResponseCommercialListDto,
    } from 'src/ApiClient/ApiClient';
    import { useQuasar } from 'quasar';
    import { useRoute, useRouter } from 'vue-router';
    import { RouterName } from 'src/router/routerName';
    import { ICreateProductCommercialOffersDto } from 'pages/Panel/Catalog/Pages/ProductCreatOrUpdate/interface';
    import useDateUntil from 'src/helpers/useDateUntil';
    import useMoneyUntil from 'src/helpers/useMoneyUntil';
    import TableHeaderActions from 'components/Table/TableHeaderActions/TableHeaderActions.vue';
    import TableBodyActions from 'components/Table/TableBodyActions/TableBodyActions.vue';
    import NoItems from 'components/NoItems/NoItems.vue';
    import ModalsInfo from 'src/components/Modals/ModalsInfo.vue';

    const $q = useQuasar();
    const router = useRouter();
    const route = useRoute();
    const { getFormattedDateTime } = useDateUntil();
    const { moneyFormat } = useMoneyUntil();

    const props: {
        productId: number;
    } = defineProps({
        productId: {
            type: Number,
            required: true,
        },
    });

    const isLoading: Ref<boolean> = ref(true);
    const page: Ref<number> = ref(1);
    const limit: Ref<number> = ref(0);
    const count: Ref<number> = ref(0);
    const content: Ref<ICreateProductCommercialOffersDto[]> = ref([]);
    const columns = [
        {
            name: 'actions',
            label: '',
        },
        {
            name: 'id',
            label: 'ID',
            align: 'left',
        },
        {
            name: 'article',
            label: 'Артикул',
            align: 'left',
        },
        {
            name: 'created_at',
            label: 'Дата создания',
            align: 'left',
        },
        {
            name: 'updated_at',
            label: 'Дата изменения',
            align: 'left',
        },
        {
            name: 'basePrice',
            label: 'Базовая цена',
            align: 'left',
        },
        {
            name: 'salePrice',
            label: 'Цена по акции',
            align: 'left',
        },
        {
            name: 'purchasePrice',
            label: 'Закупочная цена',
            align: 'left',
        },
    ];

    const modalDelete: Ref<{
        isOpen: boolean;
        id: number | null;
    }> = ref({
        isOpen: false,
        id: null,
    });
    const modalDeleteIds: Ref<{
        isOpen: boolean;
        ids: string[] | null;
    }> = ref({
        isOpen: false,
        ids: null,
    });

    const lengthPages = computed(() => {
        return Math.ceil(count.value / limit.value);
    });

    const routeUTPCreate = computed((): string => {
        const path = router.resolve({
            name: RouterName.CatalogUTPCreate,
            params: {
                slug: route.params.id,
            },
        });

        return path.fullPath;
    });

    const routeCommercialUpdate = (id: number): string => {
        const path = router.resolve({
            name: RouterName.CatalogUTPEdit,
            params: {
                slug: route.params.id,
                id,
            },
        });
        return path.fullPath;
    };

    const updatePage = (event: number) => {
        page.value = event;
        isLoading.value = true;
        getInfo();
    };

    const onChecked = (status: boolean) => {
        content.value =
            content.value?.map((el) => {
                el.isChecked = status;
                return el;
            }) || [];
    };

    const clearModalDelete = () => {
        modalDelete.value = {
            isOpen: false,
            id: null,
        };

        modalDeleteIds.value = {
            isOpen: false,
            ids: null,
        };
    };

    const onDeleteIds = () => {
        const checkedUser = content.value.filter((el) => el.isChecked);
        if (checkedUser) {
            modalDeleteIds.value = {
                isOpen: true,
                ids: checkedUser.map((el) => el.id!.toString()),
            };
        } else {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Товар не выбранны',
            });
        }
    };

    const onDelete = (id: number) => {
        modalDelete.value = {
            isOpen: true,
            id,
        };
    };

    const deleteIds = async () => {
        const result = await new CommercialControllerClient(getApiClientInitialParams()).deleteIds(
            modalDeleteIds.value.ids!
        );
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка',
            });
        }
        clearModalDelete();
        getInfo();
    };

    const deleteItem = async () => {
        const result = await new CommercialControllerClient(getApiClientInitialParams()).delete(
            modalDelete.value.id!.toString()
        );
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка',
            });
        }
        clearModalDelete();
        getInfo();
    };

    const getInfo = async () => {
        const result: ResponseCommercialListDto = await new CommercialControllerClient(getApiClientInitialParams()).get(
            props.productId,
            page.value
        );
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка',
            });
        } else {
            content.value = result.entity!.entity!.map((el) => {
                return {
                    ...el,
                    isChecked: false,
                };
            });
        }
        isLoading.value = false;
    };

    onMounted(() => {
        getInfo();
    });
</script>
<template>
    <div>
        <div class="q-pa-md flex flex-center" v-if="isLoading">
            <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
        </div>
        <template v-else-if="content && content.length">
            <q-table :rows="content" :columns="columns" no-data-label="Ничего не найдено" row-key="name">
                <template v-slot:header-cell-actions>
                    <table-header-actions ref="tableHeaderActionRef" @on-delete="onDeleteIds" @on-checked="onChecked" />
                </template>
                <template v-slot:body="props">
                    <tr>
                        <td>
                            <table-body-actions
                                :value="props.row.isChecked"
                                @input="props.row.isChecked = !props.row.isChecked"
                                @on-delete="onDelete(props.row.id)"
                            />
                        </td>
                        <td class="text-left">
                            <router-link :to="routeCommercialUpdate(props.row.id)">{{ props.row.id }}</router-link>
                        </td>
                        <td class="text-left">
                            <router-link :to="routeCommercialUpdate(props.row.id)">{{ props.row.article }}</router-link>
                        </td>
                        <td class="text-left">
                            <div>{{ getFormattedDateTime(props.row.created_at) }}</div>
                        </td>
                        <td class="text-left">
                            <div>{{ getFormattedDateTime(props.row.updated_at) }}</div>
                        </td>
                        <td class="text-left">
                            <div v-html="moneyFormat(props.row.basePrice)"></div>
                        </td>
                        <td class="text-left">
                            <div v-html="moneyFormat(props.row.salePrice)"></div>
                        </td>
                        <td class="text-left">
                            <div v-html="moneyFormat(props.row.purchasePrice)"></div>
                        </td>
                    </tr>
                </template>
                <template v-slot:bottom>
                    <pagination
                        v-if="lengthPages"
                        :page="page"
                        :count="count"
                        :max="lengthPages"
                        @update="updatePage"
                    />
                </template>
            </q-table>
        </template>
        <q-card v-else class="section-create-form">
            <q-card-section>
                <no-items text="Добавьте торговое предложение" @click="router.push(routeUTPCreate)" />
            </q-card-section>
        </q-card>
        <q-btn :to="routeUTPCreate" color="primary" class="circle fixed is-form">
            <q-icon name="add"></q-icon>
            <q-tooltip anchor="center left" self="center right">Добавить УТП</q-tooltip>
        </q-btn>

        <q-dialog v-model="modalDelete.isOpen" @hide="clearModalDelete">
            <modals-info
                icon="delete"
                icon-color="negative"
                title="Вы точно хотите удалить УТП?"
                text="Удаленный УТП нельзя будет восстановить"
                @on-success="deleteItem"
            />
        </q-dialog>
        <q-dialog v-model="modalDeleteIds.isOpen" @hide="clearModalDelete">
            <modals-info
                icon="delete"
                icon-color="negative"
                title="Вы точно хотите удалить УТП?"
                text="Удаленные УПТ нельзя будет восстановить"
                @on-success="deleteIds"
            />
        </q-dialog>
    </div>
</template>

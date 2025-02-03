<script lang="ts" setup>
    import {computed, PropType, ref, Ref, toRefs} from 'vue';
    import {dataColumnsTable, IProducts, IProductsFilter} from 'pages/Panel/Catalog/Pages/Products/interface';
    import {RouterName} from 'src/router/routerName';
    import {useRouter} from 'vue-router';
    import Pagination from 'src/components/Pagination/Pagination.vue';
    import TableHeaderActions from 'components/Table/TableHeaderActions/TableHeaderActions.vue';
    import TableBodyActions from 'components/Table/TableBodyActions/TableBodyActions.vue';
    import {useQuasar} from 'quasar';
    import {getApiClientInitialParams, ProductControllerClient} from 'src/ApiClient/ApiClient';
    import ModalsInfo from 'src/components/Modals/ModalsInfo.vue';
    import useDateUntil from 'src/helpers/useDateUntil';

    const router = useRouter();
    const $q = useQuasar();
    const {getFormattedDateTime} = useDateUntil();

    const emit = defineEmits(['update-page', 'on-delete']);
    const props: {
        products: IProducts[],
        filters: IProductsFilter,
        count: number,
        limit: number,
    } = defineProps({
        products: {
            type: Array as PropType<IProducts[]>,
            required: true
        },
        filters: {
            type: Object as PropType<IProductsFilter>,
            required: true
        },
        count: {
            type: Number,
            required: true,
        },
        limit: {
            type: Number,
            required: true,
        },
    });

    const columns = dataColumnsTable;
    const {products} = toRefs(props);
    const modalDelete: Ref<{
        isOpen: boolean,
        id: number | null
    }> = ref({
        isOpen: false,
        id: null
    });
    const modalDeleteIds: Ref<{
        isOpen: boolean,
        ids: string[] | null
    }> = ref({
        isOpen: false,
        ids: null
    });

    const lengthPages = computed(() => {
        return Math.ceil(props.count / props.limit);
    });

    const onChecked = (status: boolean) => {
        products.value = props.products?.map((el) => {
            el.isChecked = status;
            return el;
        }) || [];
    };

    const getRouterDetail = (id: number): string => {
        const path = router.resolve({
            name : RouterName.CatalogProductsEdit,
            params: {id: id.toString()}
        });

        return path.fullPath;
    };

    const onDeleteIds = () => {
        const checkedUser = products.value.filter((el) => el.isChecked);
        if (checkedUser) {
            modalDeleteIds.value = {
                isOpen: true,
                ids: checkedUser.map((el) => el.id!.toString())
            };
        } else {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Товар не выбранны'
            });
        }
    };

    const clearModalDelete = () => {
        modalDelete.value = {
            isOpen: false,
            id: null
        };

        modalDeleteIds.value = {
            isOpen: false,
            ids: null
        };
    };

    const onDelete = (id: number) => {
        modalDelete.value = {
            isOpen: true,
            id,
        };
    };

    const deleteItem = async () => {
        const result = await new ProductControllerClient(getApiClientInitialParams()).delete(modalDelete.value.id!.toString());
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка'
            });
        }
        clearModalDelete();
        emit('on-delete');
    };

    const deleteIds = async () => {
        const result = await new ProductControllerClient(getApiClientInitialParams()).deleteIds(modalDeleteIds.value.ids!);
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка'
            });
        }
        clearModalDelete();
        emit('on-delete');
    };

    const onDuplicate = async (id: number) => {
        const result = await new ProductControllerClient(getApiClientInitialParams()).duplicate(id);
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка'
            });
        } else {
            $q.notify({
                color: 'positive',
                textColor: 'white',
                icon: 'check',
                message: 'Дубликат создан'
            });
        }
    };
</script>
<template>
    <q-table
        :rows="props.products"
        :columns="columns"
        no-data-label="Ничего не найдено"
        :rows-per-page-options="[0]"
        row-key="name"
    >
        <template v-slot:header-cell-actions>
            <table-header-actions ref="tableHeaderActionRef" @on-delete="onDeleteIds" @on-checked="onChecked" />
        </template>
        <template v-slot:body="props">
            <tr>
                <td>
                    <table-body-actions
                        :value="props.row.isChecked"
                        :is-duplicate="true"
                        @input="props.row.isChecked = !props.row.isChecked"
                        @on-delete="onDelete(props.row.id)"
                        @on-duplicate="onDuplicate(props.row.id)"
                    />
                </td>
                <td class="text-left">{{ props.row.id }}</td>
                <td class="text-left">
                    <router-link :to="getRouterDetail(props.row.id)">{{ props.row.name }}</router-link>
                </td>
                <td class="text-left">
                    <router-link :to="getRouterDetail(props.row.id)">{{ props.row.code }}</router-link>
                </td>
                <td class="text-left">
                    <router-link :to="getRouterDetail(props.row.id)">{{ getFormattedDateTime(props.row.created_at) }}</router-link>
                </td>
                <td class="text-left">
                    <router-link :to="getRouterDetail(props.row.id)">{{ getFormattedDateTime(props.row.updated_at) }}</router-link>
                </td>
                <td class="text-left">
                    <router-link :to="getRouterDetail(props.row.id)">
                        <q-checkbox v-model="props.row.isNew" disable />
                    </router-link>
                </td>
                <td class="text-left">
                    <router-link :to="getRouterDetail(props.row.id)">
                        <q-checkbox v-model="props.row.isLeader" disable />
                    </router-link>
                </td>
            </tr>
        </template>
        <template v-slot:bottom v-if="lengthPages">
            <pagination
                :page="filters.page"
                :count="count"
                :max="lengthPages"
                @update="emit('update-page', $event)"
            />
        </template>
    </q-table>
    <q-dialog v-model="modalDelete.isOpen" @hide="clearModalDelete">
        <modals-info
            icon="delete"
            icon-color="negative"
            title="Вы точно хотите удалить товар?"
            text="Удаленный товар нельзя будет восстановить"
            @on-success="deleteItem"
        />
    </q-dialog>
    <q-dialog v-model="modalDeleteIds.isOpen" @hide="clearModalDelete">
        <modals-info
            icon="delete"
            icon-color="negative"
            title="Вы точно хотите удалить товары?"
            text="Удаленные товары нельзя будет восстановить"
            @on-success="deleteIds"
        />
    </q-dialog>
</template>

<script lang="ts" setup>
    import { computed, onMounted, ref, Ref } from 'vue';
    import TableHeaderActions from '@/components/Table/TableHeaderActions/TableHeaderActions.vue';
    import TableBodyActions from '@/components/Table/TableBodyActions/TableBodyActions.vue';
    import Pagination from '@/components/Pagination/Pagination.vue';
    import ModalsInfo from '@/components/Modals/ModalsInfo.vue';
    import { useQuasar } from 'quasar';
    import useDateUntil from 'src/helpers/useDateUntil';
    import { getApiClientInitialParams, PagesIblockControllerClient, PagesIblockRecordsControllerClient } from '@/ApiClient/ApiClient';
    import useResultException from '@/helpers/useResultException';
    import { IPagesIblockRecordsDto, PagesIblockRecordsColumnsTable } from './interface';
    import CreateOrUpdateRecords from './components/CreateOrUpdateRecords.vue';
    import { useRoute, useRouter } from 'vue-router';
    import { RouterName } from '@/router/routerName';

    const $q = useQuasar();
    const route = useRoute();
    const router = useRouter();
    const { getDateDayMonthYear } = useDateUntil();
    const { resultError } = useResultException();

    const api = new PagesIblockRecordsControllerClient(getApiClientInitialParams());
    const apiIblock = new PagesIblockControllerClient(getApiClientInitialParams());
    const isLoading = ref(true);
    const filters = ref({
        search: '',
        page: 1,
        limit: 10,
        count: 0,
    });
    const rows = ref<IPagesIblockRecordsDto[]>([]);
    const columns = ref(PagesIblockRecordsColumnsTable);
    const tableHeaderActionRef = ref(null);
    const modalDelete: Ref<{
        isOpen: boolean;
        id: number | null;
    }> = ref({
        isOpen: false,
        id: null,
    });
    const modalDeleteIds: Ref<{
        isOpen: boolean;
        ids: number[] | null;
    }> = ref({
        isOpen: false,
        ids: null,
    });

    const modalCreateOrUpdate: Ref<{
        isOpen: boolean;
        id: number | null;
    }> = ref({
        isOpen: false,
        id: null,
    });

    const lengthPages = computed(() => {
        return Math.ceil(filters.value.count / filters.value.limit);
    });

    const onOpenCreateOrUpdate = (id?: number) => {
        modalCreateOrUpdate.value = {
            isOpen: true,
            id: id || null,
        };
    };
    const onCloseCreateOrUpdate = () => {
        modalCreateOrUpdate.value = {
            isOpen: false,
            id: null,
        };
        if (!isLoading.value) {
            getInfo();
        }
    };

    const onChecked = (status: boolean) => {
        rows.value =
            rows?.value.map((el: IPagesIblockRecordsDto) => {
                el.isChecked = status;
                return el;
            }) || [];
    };

    const onDelete = (id: number) => {
        modalDelete.value = {
            isOpen: true,
            id,
        };
    };
    const onDeleteRequest = async () => {
        const result = await api.delete(modalDelete.value.id!);
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка',
            });
        }
        clearModalDeleteUser();
        getInfo();
    };

    const clearModalDeleteUser = () => {
        modalDelete.value = {
            isOpen: false,
            id: null,
        };

        modalDeleteIds.value = {
            isOpen: false,
            ids: null,
        };
    };

    const onDeleteIdsRequest = async () => {
        const result = await api.deleteIds(modalDeleteIds.value.ids!);
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка',
            });
        }
        clearModalDeleteUser();
        getInfo();
    };

    const onDeleteIds = () => {
        const checked = rows.value.filter((el: IPagesIblockRecordsDto) => el.isChecked);
        if (checked) {
            modalDeleteIds.value = {
                isOpen: true,
                ids: checked.map((el: IPagesIblockRecordsDto) => el.id!),
            };
        } else {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Записи не выбранны',
            });
        }
    };

    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    const onPush = (id: number) => {
        router.push({
            name: RouterName.Iblock,
            params: {id}
        });
    };

    const onUpdatePage = (page: number) => {
        filters.value.page = page;
        getInfo();
    };

    const getInfo = async () => {
        isLoading.value = true;
        const result = await api.get(filters.value.search, filters.value.page, filters.value.limit, Number(route.params.id));
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            rows.value =
                result.entity?.entity?.map((el) => {
                    return {
                        isChecked: false,
                        ...el,
                    };
                }) || [];
            filters.value.count = result.entity?.count || 0;
        }
        isLoading.value = false;
    };

    const getFields = async () => {
        const result = await apiIblock.getFields('', 1, 200, Number(route.params.id));
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            const arrayColumns = [...columns.value].splice(0,3);
            const arrayEndColumns = [...columns.value].splice(3, columns.value.length - 1);
            result.entity?.entity?.forEach((el) => [
                arrayColumns.push({
                    name: el.slug,
                    label: el.name,
                    align: 'left',
                    field: (row: any) => {
                        let value = '';
                        for (let key in row.fields[el.slug]) {
                            value += `${key}: ${row.fields[el.slug][key].value}; `;
                        }
                        return value.length > 50 ? value.slice(0, 50) + '...' : '';
                    },
                })
            ]);

            arrayColumns.push(...arrayEndColumns);
            columns.value = arrayColumns;
        }
    };

    onMounted(async () => {
        await getFields();
        getInfo();
    });
</script>

<template>
    <div class="q-pa-md flex flex-center" v-if="isLoading">
        <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
    </div>
    <q-table v-else :rows="rows" :columns="columns" no-data-label="Ничего не найдено" row-key="name" :rows-per-page-options="[0]">
        <template v-slot:header-cell-actions>
            <table-header-actions ref="tableHeaderActionRef" @on-delete="onDeleteIds" @on-checked="onChecked" />
        </template>
        <template v-slot:body-cell-actions="props">
            <q-td class="text-left">
                <table-body-actions
                    :value="props.row.isChecked"
                    :row="props.row"
                    isEdit
                    @input="props.row.isChecked = !props.row.isChecked"
                    @on-delete="onDelete(props.row.id)"
                    @on-edit="onOpenCreateOrUpdate(props.row.id)"
                />
            </q-td>
        </template>
        <template v-slot:body-cell-createAt="props">
            <q-td class="text-left">
                {{ getDateDayMonthYear(props.row.createdAt) }}
            </q-td>
        </template>
        <template v-slot:bottom v-if="lengthPages">
            <pagination :page="filters.page" :count="filters.count" :max="lengthPages" @update="onUpdatePage" />
        </template>
    </q-table>
    <q-dialog v-model="modalDelete.isOpen" @hide="clearModalDeleteUser">
        <modals-info title="Вы точно хотите удалить?" text="Удаленную запись нельзя будет восстановить" @on-success="onDeleteRequest" />
    </q-dialog>
    <q-dialog v-model="modalDeleteIds.isOpen" @hide="clearModalDeleteUser">
        <modals-info title="Вы точно хотите удалить?" text="Удаленные записи нельзя будет восстановить" @on-success="onDeleteIdsRequest" />
    </q-dialog>
    <q-dialog v-model="modalCreateOrUpdate.isOpen" @hide="onCloseCreateOrUpdate">
        <create-or-update-records :id="modalCreateOrUpdate.id" :iblockID="Number(route.params.id)" @on-close="modalCreateOrUpdate.isOpen = false" />
    </q-dialog>
    <q-btn color="primary" class="circle fixed" @click="() => onOpenCreateOrUpdate()">
        <q-icon name="add"></q-icon>
    </q-btn>
</template>

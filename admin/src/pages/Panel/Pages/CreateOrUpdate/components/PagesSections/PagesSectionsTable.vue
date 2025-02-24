<script lang="ts" setup>
    import { computed, onMounted, ref, Ref } from 'vue';
    import TableHeaderActions from '@/components/Table/TableHeaderActions/TableHeaderActions.vue';
    import TableBodyActions from '@/components/Table/TableBodyActions/TableBodyActions.vue';
    import Pagination from '@/components/Pagination/Pagination.vue';
    import ModalsInfo from '@/components/Modals/ModalsInfo.vue';
    import { useQuasar } from 'quasar';
    import useDateUntil from 'src/helpers/useDateUntil';
    import { getApiClientInitialParams, PagesDto, PagesSectionsControllerClient, PagesSectionsValueDto } from '@/ApiClient/ApiClient';
    import useResultException from '@/helpers/useResultException';
    import { IPagesSectionsDto, PagesSectionsColumnsTable } from './interface';
    import CreatePagesSections from './CreatePagesSections.vue';
    import { useRouter } from 'vue-router';
    import { RouterName } from '@/router/routerName';

    interface IProps {
        page: PagesDto;
    }
    const props = defineProps<IProps>();

    const $q = useQuasar();
    const router = useRouter();
    const { getDateDayMonthYear } = useDateUntil();
    const { resultError } = useResultException();

    const api = new PagesSectionsControllerClient(getApiClientInitialParams());
    const isLoading = ref(true);
    const filters = ref({
        search: '',
        page: 1,
        limit: 10,
        count: 0,
    });
    const rows = ref<IPagesSectionsDto[]>([]);
    const columns = PagesSectionsColumnsTable;
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

    const getNames = (data: PagesSectionsValueDto[]): string  => {
        return data.map((el) => {
            return `${el.lang}: ${el.value}`;
        }).join(',');
    };

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
            rows?.value.map((el: IPagesSectionsDto) => {
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
        const checked = rows.value.filter((el: IPagesSectionsDto) => el.isChecked);
        if (checked) {
            modalDeleteIds.value = {
                isOpen: true,
                ids: checked.map((el: IPagesSectionsDto) => el.id!),
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
        const result = await api.get(filters.value.search, filters.value.page, filters.value.limit, props.page.id!);
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

    onMounted(() => {
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
        <template v-slot:body="props">
            <tr @click="onPush(props.row.id)" class="cursor-pointer">
                <td class="text-left">
                    <table-body-actions
                        :value="props.row.isChecked"
                        :row="props.row"
                        isEdit
                        @input="props.row.isChecked = !props.row.isChecked"
                        @on-delete="onDelete(props.row.id)"
                        @on-edit="onOpenCreateOrUpdate(props.row.id)"
                    />
                </td>
                <td class="text-left">{{ props.row.id }}</td>
                <td class="text-left">
                    {{ getNames(props.row.title) }}
                </td>
                <td class="text-left">
                    {{ getDateDayMonthYear(props.row.createdAt) }}
                </td>
            </tr>
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
        <CreatePagesSections :id="modalCreateOrUpdate.id" :page="props.page" @on-close="modalCreateOrUpdate.isOpen = false" />
    </q-dialog>
    <q-btn color="primary" class="circle fixed" @click="() => onOpenCreateOrUpdate()">
        <q-icon name="add"></q-icon>
    </q-btn>
</template>

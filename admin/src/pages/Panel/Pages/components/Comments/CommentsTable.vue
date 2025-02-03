<script lang="ts" setup>
    import { computed, onMounted, ref } from 'vue';
    import TableHeaderActions from 'components/Table/TableHeaderActions/TableHeaderActions.vue';
    import TableBodyActions from 'components/Table/TableBodyActions/TableBodyActions.vue';
    import Pagination from 'src/components/Pagination/Pagination.vue';
    import Filters from 'components/Filters/Filters.vue';
    import SelectsCommentStatus from './Selects/SelectsCommentStatus.vue';
    import ModalsInfo from '@/components/Modals/ModalsInfo.vue';
    import useDateUntil from 'src/helpers/useDateUntil';
    import { CommentStatus, getApiClientInitialParams, PagesCommentsControllerClient, PagesCommentsDto } from 'src/ApiClient/ApiClient';
    import useResultException from '@/helpers/useResultException';
    import { CommentsColumnsTable, IPagesComments } from './interface';
    import CommentsCreateOrUpdate from './CommentsCreateOrUpdate.vue';
    import CommentsStatusChip from './CommentsStatusChip.vue';
    import { ITableAction } from '@/components/Table/interface';
    import { useQuasar } from 'quasar';

    interface IProps {
        pageId?: number;
        recordId?: number;
    }
    const props = defineProps<IProps>();

    const $q = useQuasar();
    const { resultError } = useResultException();
    const { getDateDayMonthYear } = useDateUntil();
    const api = new PagesCommentsControllerClient(getApiClientInitialParams());

    const isLoading = ref(false);
    const filter = ref({
        page: 1,
        count: 0,
        limit: 10,
        search: '',
        status: null,
    });
    const rows = ref<IPagesComments[]>([]);
    const columns = CommentsColumnsTable;
    const tableHeaderActionRef = ref(null);
    const modalCreateOrUpdate = ref<{
        id: number | null;
        pageId: number | null;
        isOpen: boolean;
    }>({
        id: null,
        pageId: null,
        isOpen: false,
    });
    const modalDeleteUser = ref<{
        isOpen: boolean;
        id: number | null;
    }>({
        isOpen: false,
        id: null,
    });
    const modalDeleteUsersIds = ref<{
        isOpen: boolean;
        ids: number[] | null;
    }>({
        isOpen: false,
        ids: null,
    });

    const menuHeaderActions = ref<ITableAction[]>([
        {
            name: 'Проверена',
            icon: 'check',
            action: () => onChangeSuccess(),
            isView: true,
        },
        {
            name: 'Не проверена',
            icon: 'remove_done',
            action: () => onChangeVerify(),
            isView: true,
        },
    ]);
    const menuActions = ref<ITableAction[]>([
        {
            name: 'Проверена',
            icon: 'check',
            action: (row?: any) => onChangeStatus(row),
            isView: true,
            onIsView: (row?: any) => row.status === CommentStatus.Verify,
        },
        {
            name: 'Не проверена',
            icon: 'remove_done',
            action: (row?: any) => onChangeStatus(row),
            isView: true,
            onIsView: (row?: any) => row.status === CommentStatus.Success,
        },
    ]);

    const lengthPages = computed(() => {
        return Math.ceil(filter.value.count / filter.value.limit);
    });

    const onChangeSuccess = async () => {
        const ids = rows.value.filter((el) => el.isChecked).map((el) => Number(el.id));
        const result = await api.onSuccessStatusIds(CommentStatus.Success, ids);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            $q.notify({
                color: 'positive',
                textColor: 'white',
                icon: 'check',
                message: result.message,
            });
            getInfo();
        }
    };

    const onChangeVerify = async () => {
        const ids = rows.value.filter((el) => el.isChecked).map((el) => Number(el.id));
        const result = await api.onSuccessStatusIds(CommentStatus.Verify, ids);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            $q.notify({
                color: 'positive',
                textColor: 'white',
                icon: 'check',
                message: result.message,
            });
            getInfo();
        }
    };

    const onChangeStatus = async (row?: IPagesComments) => {
        if (row) {
            const status = row?.status === CommentStatus.Verify ? CommentStatus.Success : CommentStatus.Verify;
            const result = await api.onSuccessStatus(status, row.id!);
            if (!result.isSuccess) {
                resultError(result, null);
            } else {
                $q.notify({
                    color: 'positive',
                    textColor: 'white',
                    icon: 'check',
                    message: result.message,
                });
            }
            getInfo();
        }
    };

    const onCloseModalCreateOrUpdate = () => {
        modalCreateOrUpdate.value = {
            id: null,
            pageId: null,
            isOpen: false,
        };
        getInfo();
    };

    const onOpenModalCreateOrUpdate = (id?: number) => {
        modalCreateOrUpdate.value = {
            id: id ? id : null,
            pageId: props.pageId || null,
            isOpen: true,
        };
    };

    const onDelete = (id: number) => {
        modalDeleteUser.value = {
            isOpen: true,
            id,
        };
    };
    const deleteUser = async () => {
        const result = await api.delete(modalDeleteUser.value.id!);
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
        modalDeleteUser.value = {
            isOpen: false,
            id: null,
        };

        modalDeleteUsersIds.value = {
            isOpen: false,
            ids: null,
        };
    };

    const deleteUserIds = async () => {
        const result = await api.deleteIds(modalDeleteUsersIds.value.ids!);
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
        const checkedUser = rows.value.filter((el) => el.isChecked);
        if (checkedUser) {
            modalDeleteUsersIds.value = {
                isOpen: true,
                ids: checkedUser.map((el) => el.id!),
            };
        } else {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Пользователи не выбранны',
            });
        }
    };

    const onChecked = (status: boolean) => {
        rows.value =
            rows.value?.map((el) => {
                el.isChecked = status;
                return el;
            }) || [];
    };

    const onUpdatePage = (page: number) => {
        filter.value.page = page;
        getInfo();
    };

    const onFilter = () => {
        filter.value.page = 1;
        getInfo();
    };

    const getInfo = async () => {
        isLoading.value = true;
        const result = await api.get(filter.value.search, filter.value.page, filter.value.limit, props.recordId, props.pageId, filter.value.status || undefined);
        if (!result.isSuccess) {
            resultError(result, null);
        } else {
            rows.value =
                result.entity?.entity?.map((el: PagesCommentsDto) => {
                    return {
                        ...el,
                        isChecked: false,
                    };
                }) || [];
            filter.value.count = result.entity?.count || 0;
        }
        isLoading.value = false;
    };

    onMounted(() => {
        getInfo();
    });
</script>

<template>
    <filters @on-submit="onFilter">
        <template #default>
            <div class="filters-components__field" style="min-width: 320px">
                <q-input v-model="filter.search" label="Комментарий" outlined clearable @update:model-value="getInfo" debounce="500">
                    <template v-slot:prepend>
                        <q-icon name="search" />
                    </template>
                </q-input>
            </div>
            <div class="filters-components__field">
                <selects-comment-status v-model="filter.status" />
            </div>
        </template>
    </filters>
    <div class="q-pa-md flex flex-center" v-if="isLoading">
        <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
    </div>
    <template v-else>
        <q-table :rows="rows" :columns="columns" no-data-label="Ничего не найдено" row-key="name" :rows-per-page-options="[0]">
            <template v-slot:header-cell-actions>
                <table-header-actions ref="tableHeaderActionRef" :data="menuHeaderActions" @on-delete="onDeleteIds" @on-checked="onChecked" />
            </template>
            <template v-slot:body="props">
                <tr>
                    <td class="text-left">
                        <table-body-actions
                            :data="menuActions"
                            :value="props.row.isChecked"
                            :row="props.row"
                            @input="props.row.isChecked = !props.row.isChecked"
                            :is-edit="true"
                            @on-edit="onOpenModalCreateOrUpdate(props.row.id!)"
                            @on-delete="onDelete(props.row.id)"
                        />
                    </td>
                    <td class="text-left">{{ props.row.id }}</td>
                    <td class="text-left">
                        <comments-status-chip :status="props.row.status" />
                    </td>
                    <td class="text-left">
                        <div v-html="props.row.content"></div>
                    </td>
                    <td class="text-left">
                        {{ getDateDayMonthYear(props.row.createdAt) }}
                    </td>
                    <td class="text-left">
                        {{ getDateDayMonthYear(props.row.updatedAt) }}
                    </td>
                    <td class="text-left">
                        {{ props.row.deletedAt ? getDateDayMonthYear(props.row.deletedAt) : '' }}
                    </td>
                </tr>
            </template>
            <template v-slot:bottom v-if="lengthPages">
                <pagination :page="filter.page" :count="filter.count" :max="lengthPages" @update="onUpdatePage($event)" />
            </template>
        </q-table>
    </template>

    <q-dialog v-model="modalCreateOrUpdate.isOpen" @hide="onCloseModalCreateOrUpdate">
        <comments-create-or-update :id="modalCreateOrUpdate.id" @on-close="onCloseModalCreateOrUpdate" />
    </q-dialog>

    <q-btn color="primary" class="circle fixed" @click="() => onOpenModalCreateOrUpdate()">
        <q-icon name="add"></q-icon>
    </q-btn>

    <q-dialog v-model="modalDeleteUser.isOpen" @hide="clearModalDeleteUser">
        <modals-info title="Вы точно хотите удалить страницу?" text="Удаленную страницу нельзя будет восстановить" @on-success="deleteUser" />
    </q-dialog>
    <q-dialog v-model="modalDeleteUsersIds.isOpen" @hide="clearModalDeleteUser">
        <modals-info title="Вы точно хотите удалить страницы?" text="Удаленные страницы нельзя будет восстановить" @on-success="deleteUserIds" />
    </q-dialog>
</template>

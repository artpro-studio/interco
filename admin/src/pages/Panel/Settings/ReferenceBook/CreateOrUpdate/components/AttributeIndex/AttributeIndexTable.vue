<script lang="ts" setup>
    import { computed, PropType, ref, Ref, toRefs } from 'vue';
    import TableHeaderActions from '@/components/Table/TableHeaderActions/TableHeaderActions.vue';
    import TableBodyActions from '@/components/Table/TableBodyActions/TableBodyActions.vue';
    import Pagination from '@/components/Pagination/Pagination.vue';
    import ModalsInfo from '@/components/Modals/ModalsInfo.vue';
    import { useQuasar } from 'quasar';
    import useDateUntil from 'src/helpers/useDateUntil';
    import { IReferenceBookAttribute, IReferenceBookAttributeFilter, ReferenceBookAttributeColumnsTable } from './interface';
    import { getApiClientInitialParams, ReferenceBookAttributeControllerClient } from '@/ApiClient/ApiClient';

    const $q = useQuasar();
    const { getDateDayMonthYear } = useDateUntil();

    const emit = defineEmits(['update-page', 'on-delete', 'on-edit']);
    const props: {
        rows: IReferenceBookAttribute[];
        filters: IReferenceBookAttributeFilter;
        count: number;
        limit: number;
    } = defineProps({
        rows: {
            type: Array as PropType<IReferenceBookAttribute[]>,
            required: true,
        },
        filters: {
            type: Object as PropType<IReferenceBookAttribute>,
            required: true,
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

    const api = new ReferenceBookAttributeControllerClient(getApiClientInitialParams());
    const { rows } = toRefs(props);
    const columns = ReferenceBookAttributeColumnsTable;
    const tableHeaderActionRef = ref(null);
    const modalDeleteUser: Ref<{
        isOpen: boolean;
        id: number | null;
    }> = ref({
        isOpen: false,
        id: null,
    });
    const modalDeleteUsersIds: Ref<{
        isOpen: boolean;
        ids: number[] | null;
    }> = ref({
        isOpen: false,
        ids: null,
    });

    const lengthPages = computed(() => {
        return Math.ceil(props.count / props.limit);
    });

    const onChecked = (status: boolean) => {
        rows.value =
            props.rows?.map((el) => {
                el.isChecked = status;
                return el;
            }) || [];
    };

    const getRouterDetail = (id: number) => {
        emit('on-edit', id);
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
        emit('on-delete');
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
        emit('on-delete');
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
</script>

<template>
    <q-table :rows="rows" :columns="columns" no-data-label="Ничего не найдено" row-key="name" :rows-per-page-options="[0]">
        <template v-slot:header-cell-actions>
            <table-header-actions ref="tableHeaderActionRef" @on-delete="onDeleteIds" @on-checked="onChecked" />
        </template>
        <template v-slot:body="props">
            <tr>
                <td class="text-left">
                    <table-body-actions
                        :value="props.row.isChecked"
                        :row="props.row"
                        isEdit
                        @input="props.row.isChecked = !props.row.isChecked"
                        @on-delete="onDelete(props.row.id)"
                        @on-edit="emit('on-edit', props.row.id)"
                    />
                </td>
                <td class="text-left" @click="getRouterDetail(props.row.id)">{{ props.row.id }}</td>
                <td class="text-left" @click="getRouterDetail(props.row.id)">
                    {{ props.row.name }}
                </td>
                <td class="text-left" @click="getRouterDetail(props.row.id)">
                    {{ getDateDayMonthYear(props.row.createdAt) }}
                </td>
            </tr>
        </template>
        <template v-slot:bottom v-if="lengthPages">
            <pagination :page="filters.page" :count="count" :max="lengthPages" @update="emit('update-page', $event)" />
        </template>
    </q-table>
    <q-dialog v-model="modalDeleteUser.isOpen" @hide="clearModalDeleteUser">
        <modals-info title="Вы точно хотите удалить меню?" text="Удаленное меню нельзя будет восстановить" @on-success="deleteUser" />
    </q-dialog>
    <q-dialog v-model="modalDeleteUsersIds.isOpen" @hide="clearModalDeleteUser">
        <modals-info title="Вы точно хотите удалить меню?" text="Удаленные меню нельзя будет восстановить" @on-success="deleteUserIds" />
    </q-dialog>
</template>

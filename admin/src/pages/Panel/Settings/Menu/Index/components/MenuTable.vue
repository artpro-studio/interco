<script lang="ts" setup>
    import { computed, PropType, ref, Ref, toRefs } from 'vue';
    import TableHeaderActions from 'components/Table/TableHeaderActions/TableHeaderActions.vue';
    import TableBodyActions from 'components/Table/TableBodyActions/TableBodyActions.vue';
    import Pagination from '@/components/Pagination/Pagination.vue';
    import ModalsInfo from '@/components/Modals/ModalsInfo.vue';
    import { useQuasar } from 'quasar';
    import { useRouter } from 'vue-router';
    import useDateUntil from 'src/helpers/useDateUntil';
    import { RouterName } from 'src/router/routerName';
    import { getApiClientInitialParams, SettingsMenuControllerClient } from 'src/ApiClient/ApiClient';
    import { IMenuFilter, ISettingsMenu, MenuColumnsTable } from '../../interface';

    const $q = useQuasar();
    const router = useRouter();
    const { getDateDayMonthYear } = useDateUntil();

    const emit = defineEmits(['update-page', 'on-delete']);
    const props: {
        rows: ISettingsMenu[];
        filters: IMenuFilter;
        count: number;
        limit: number;
    } = defineProps({
        rows: {
            type: Array as PropType<ISettingsMenu[]>,
            required: true,
        },
        filters: {
            type: Object as PropType<IMenuFilter>,
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

    const api = new SettingsMenuControllerClient(getApiClientInitialParams());
    const { rows } = toRefs(props);
    const columns = MenuColumnsTable;
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

    const onRedirectEdit = (id: number) => {
        router.push({
            name: RouterName.SettingsMenuEdit,
            params: {
                id,
            },
        });
    };

    const onChecked = (status: boolean) => {
        rows.value =
            props.rows?.map((el) => {
                el.isChecked = status;
                return el;
            }) || [];
    };

    const getRouterDetail = (id: number): string => {
        const path = router.resolve({
            name: RouterName.SettingsMenuInfo,
            params: { id: id.toString() },
        });

        return path.fullPath;
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
    <q-table
        :rows="rows"
        :columns="columns"
        no-data-label="Ничего не найдено"
        row-key="name"
        :rows-per-page-options="[0]"
    >
        <template v-slot:header-cell-actions>
            <table-header-actions ref="tableHeaderActionRef" @on-delete="onDeleteIds" @on-checked="onChecked" />
        </template>
        <template v-slot:body="props">
            <tr>
                <td class="text-left">
                    <table-body-actions
                        :value="props.row.isChecked"
                        isEdit
                        @input="props.row.isChecked = !props.row.isChecked"
                        @on-delete="onDelete(props.row.id)"
                        @on-edit="onRedirectEdit(props.row.id)"
                    />
                </td>
                <td class="text-left">{{ props.row.id }}</td>
                <td class="text-left">
                    <router-link :to="getRouterDetail(props.row.id)">
                        {{ props.row.title }}
                    </router-link>
                </td>
                <td class="text-left">
                    <router-link :to="getRouterDetail(props.row.id)">
                        {{ props.row.slug }}
                    </router-link>
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
            <pagination :page="filters.page" :count="count" :max="lengthPages" @update="emit('update-page', $event)" />
        </template>
    </q-table>
    <q-dialog v-model="modalDeleteUser.isOpen" @hide="clearModalDeleteUser">
        <modals-info
            title="Вы точно хотите удалить меню?"
            text="Удаленное меню нельзя будет восстановить"
            @on-success="deleteUser"
        />
    </q-dialog>
    <q-dialog v-model="modalDeleteUsersIds.isOpen" @hide="clearModalDeleteUser">
        <modals-info
            title="Вы точно хотите удалить меню?"
            text="Удаленные меню нельзя будет восстановить"
            @on-success="deleteUserIds"
        />
    </q-dialog>
</template>

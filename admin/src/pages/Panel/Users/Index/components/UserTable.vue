<script lang="ts" setup>
    import { dataColumnsTable, IUserFilter, IUsers } from '../interface';
    import { computed, PropType, Ref, ref, toRefs } from 'vue';
    import { RouterName } from 'src/router/routerName';
    import { useRouter } from 'vue-router';
    import useDateUntil from 'src/helpers/useDateUntil';
    import { ParseRole } from '@/components/UI/Selects/SelectsRole/interface';
    import TableHeaderActions from '@/components/Table/TableHeaderActions/TableHeaderActions.vue';
    import TableBodyActions from '@/components/Table/TableBodyActions/TableBodyActions.vue';
    import Pagination from 'src/components/Pagination/Pagination.vue';
    import ModalsInfo from 'src/components/Modals/ModalsInfo.vue';
    import { getApiClientInitialParams, UserControllerClient } from 'src/ApiClient/ApiClient';
    import { useQuasar } from 'quasar';

    const $q = useQuasar();
    const router = useRouter();
    const { getDateDayMonthYear } = useDateUntil();

    const emit = defineEmits(['update-page', 'on-delete']);
    const props: {
        users: IUsers[];
        filters: IUserFilter;
        count: number;
        limit: number;
    } = defineProps({
        users: {
            type: Array as PropType<IUsers[]>,
            required: true,
        },
        filters: {
            type: Object as PropType<IUserFilter>,
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
    const { users } = toRefs(props);
    const columns = dataColumnsTable;
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
        users.value =
            props.users?.map((el) => {
                el.isChecked = status;
                return el;
            }) || [];
    };

    const getRouterDetail = (id: number): string => {
        const path = router.resolve({
            name: RouterName.UsersEdit,
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
        const result = await new UserControllerClient(getApiClientInitialParams()).delete(modalDeleteUser.value.id!);
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
        const result = await new UserControllerClient(getApiClientInitialParams()).deleteIds(modalDeleteUsersIds.value.ids!);
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
        const checkedUser = users.value.filter((el) => el.isChecked);
        if (checkedUser) {
            modalDeleteUsersIds.value = {
                isOpen: true,
                ids: checkedUser.map((el) => el.id!.toString()),
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
    <q-table :rows="users" :columns="columns" no-data-label="Ничего не найдено" row-key="name" :rows-per-page-options="[0]">
        <template v-slot:header-cell-actions>
            <table-header-actions ref="tableHeaderActionRef" @on-delete="onDeleteIds" @on-checked="onChecked" />
        </template>
        <template v-slot:body="props">
            <tr>
                <td class="text-left">
                    <table-body-actions :value="props.row.isChecked" @input="props.row.isChecked = !props.row.isChecked" @on-delete="onDelete(props.row.id)" />
                </td>
                <td class="text-left">{{ props.row.id }}</td>
                <td class="text-left">
                    <router-link :to="getRouterDetail(props.row.id)"> {{ props.row.lastName }} {{ props.row.firstName }} {{ props.row.middleName }} </router-link>
                </td>
                <td class="text-left">
                    <router-link :to="getRouterDetail(props.row.id)">{{ props.row.email }}</router-link>
                </td>
                <td class="text-left">
                    <router-link :to="getRouterDetail(props.row.id)">{{ ParseRole[props.row.role] }}</router-link>
                </td>
                <td class="text-left">
                    {{ getDateDayMonthYear(props.row.createdAt) }}
                </td>
                <td class="text-left">
                    {{ getDateDayMonthYear(props.row.updatedAt) }}
                </td>
            </tr>
        </template>
        <template v-slot:bottom v-if="lengthPages">
            <pagination :page="filters.page" :count="count" :max="lengthPages" @update="emit('update-page', $event)" />
        </template>
    </q-table>
    <q-dialog v-model="modalDeleteUser.isOpen" @hide="clearModalDeleteUser">
        <modals-info title="Вы точно хотите удалить пользователя?" text="Удаленного пользователя нельзя будет восстановить" @on-success="deleteUser" />
    </q-dialog>
    <q-dialog v-model="modalDeleteUsersIds.isOpen" @hide="clearModalDeleteUser">
        <modals-info title="Вы точно хотите удалить пользователей?" text="Удаленных пользователей нельзя будет восстановить" @on-success="deleteUserIds" />
    </q-dialog>
</template>

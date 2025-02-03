<script lang="ts" setup>
    import { getApiClientInitialParams, Role, UserControllerClient, UserDto, UserListDto } from 'src/ApiClient/ApiClient';
    import { onMounted, Ref, ref } from 'vue';
    import { useRoute, useRouter } from 'vue-router';
    import { RouterName } from 'src/router/routerName';
    import { useQuasar } from 'quasar';
    import UserFilters from 'pages/Panel/Users/Index/components/UserFilters.vue';
    import { IUserFilter, IUsers } from '../interface';
    import UserTable from 'pages/Panel/Users/Index/components/UserTable.vue';

    const $q = useQuasar();
    const router = useRouter();
    const route = useRoute();

    let isLoading: Ref<boolean> = ref(true);
    const users: Ref<IUsers[] | null> = ref(null);
    const limit: Ref<number> = ref(0);
    const count: Ref<number> = ref(0);
    const api = new UserControllerClient(getApiClientInitialParams());
    const filters: Ref<IUserFilter> = ref({
        search: '',
        role: [],
        page: 1,
        limit: 10,
    });

    const generateRoute = () => {
        router.push({
            name: RouterName.Users,
            query: { ...filters.value },
        });
    };

    const updatePage = async (event: number) => {
        filters.value.page = event;
        create();
    };

    const create = async () => {
        isLoading.value = true;
        generateRoute();
        console.log(filters.value);
        const result: UserListDto | any = await api.get(
            filters.value.search ? filters.value.search : '',
            filters.value.page,
            filters.value.limit,
            filters.value.role || undefined
        );
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка',
            });
        } else {
            users.value =
                result.entity.entity.map((el: UserDto) => {
                    return {
                        ...el,
                        isChecked: false,
                    };
                }) || [];
            count.value = result.entity!.count!;
            limit.value = result.entity!.limit!;
        }
        isLoading.value = false;
    };

    const deleteUser = () => {
        filters.value.page = 1;
        create();
    };

    const getRouter = (namePage: RouterName): string => {
        const path = router.resolve({
            name: namePage,
        });

        return path.fullPath;
    };

    onMounted(() => {
        filters.value = {
            search: (route.query.search as string) || '',
            page: Number(route.query.page) || 1,
            limit: filters.value.limit,
            role: route.query.role ? (Array.isArray(route.query.role) ? (route.query.role as Role[]) : [route.query.role]) : [],
        };
        create();
    });
</script>
<template>
    <div>
        <user-filters :filters="filters" @on-filters="create" />
        <div class="q-pa-md flex flex-center" v-if="isLoading">
            <q-circular-progress indeterminate size="50px" color="primary" class="q-ma-md" :thickness="0.1" />
        </div>
        <template v-else>
            <user-table :users="users" :filters="filters" :count="count" :limit="limit" @update-page="updatePage" @on-delete="deleteUser" />
        </template>
        <q-btn color="primary" class="circle fixed" :to="getRouter(RouterName.UsersCreate)">
            <q-icon name="add"></q-icon>
        </q-btn>
    </div>
</template>

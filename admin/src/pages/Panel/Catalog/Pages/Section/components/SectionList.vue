<script lang="ts" setup>
    import {CreateSectionDto, getApiClientInitialParams, ResponseSectionsListDto, SectionControllerClient} from 'src/ApiClient/ApiClient';
    import {onMounted, ref} from 'vue';
    import {useRouter} from 'vue-router';
    import {RouterName} from 'src/router/routerName';
    import {useQuasar} from 'quasar';

    const $q = useQuasar();
    const router = useRouter();

    const columns = [
        {
            name: 'id',
            label: 'ID',
            align: 'left',
        },
        {
            name: 'name',
            label: 'Название',
            align: 'left',
        },
        {
            name: 'code',
            label: 'Символьный код',
            align: 'left',
        },
        {
            name: 'parent',
            label: 'Родительский раздел',
            align: 'left',
        },
        {
            name: 'isActive',
            label: 'Активна?',
            align: 'left',
        },
    ];

    let isLoading: boolean = ref(true);
    let sections: CreateSectionDto[] | null = ref(null);


    const getRouterDetail = (id: number): string => {
        const path = router.resolve({
            name : RouterName.CatalogSectionEdit,
            params: {id: id.toString()}
        });

        return path.fullPath;
    };

    const createSection = async () => {
        const result: ResponseSectionsListDto = await new SectionControllerClient(getApiClientInitialParams()).get();
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка'
            });
        } else {
            sections.value = result.entity;
        }
        isLoading.value = false;
    };

    const getRouter = (namePage: RouterName): string => {
        const path = router.resolve({
            name : namePage,
        });

        return path.fullPath;
    };

    onMounted(() => {
        createSection();
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
        <template v-else>
            <q-table
                :rows="sections"
                :columns="columns"
                no-data-label="Ничего не найдено"
                row-key="name"
            >
                <template v-slot:body="props">
                    <tr>
                        <td class="text-left">{{ props.row.id }}</td>
                        <td class="text-left"><router-link :to="getRouterDetail(props.row.id)">{{ props.row.name }}</router-link></td>
                        <td class="text-left">{{ props.row.code }}</td>
                        <td class="text-left">
                            <div v-if="props.row.parent">
                                <router-link :to="getRouterDetail(props.row.parent.id)">{{ props.row.parent.name }}</router-link>
                            </div>
                        </td>
                        <td class="text-left">
                            <q-checkbox v-model="props.row.isActive" disable />
                        </td>
                    </tr>
                </template>
            </q-table>
        </template>
        <q-btn
            color="primary"
            class="circle fixed"
            :to="getRouter(RouterName.CatalogSectionCreate)"
        >
            <q-icon name="add"></q-icon>
        </q-btn>
    </div>
</template>

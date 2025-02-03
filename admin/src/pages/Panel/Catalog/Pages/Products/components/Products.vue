<script lang="ts" setup>
    import {
        FullProductsDto,
        getApiClientInitialParams,
        ProductControllerClient, ResponseProductsListDto,
    } from 'src/ApiClient/ApiClient';
    import {onMounted, Ref, ref} from 'vue';
    import {useRouter} from 'vue-router';
    import {RouterName} from 'src/router/routerName';
    import {useQuasar} from 'quasar';
    import ProductsContent from 'pages/Panel/Catalog/Pages/Products/components/ProductsContent.vue';
    import {IProducts, IProductsFilter} from 'pages/Panel/Catalog/Pages/Products/interface';
    import ProductsFilters from 'pages/Panel/Catalog/Pages/Products/components/ProductsFilters.vue';

    const $q = useQuasar();
    const router = useRouter();

    let isLoading: Ref<boolean> = ref(true);
    const products: Ref<IProducts[] | null>= ref(null);
    const limit: Ref<number> = ref(0);
    const count: Ref<number> = ref(0);
    const filters: Ref<IProductsFilter> = ref({
        search: '',
        page: 1,
    });
    const api =  new ProductControllerClient(getApiClientInitialParams());


    const updatePage = (event: number) => {
        filters.value.page = event;
        create();
    };

    const create = async () => {
        const result: ResponseProductsListDto = await api.get(filters.value.page, filters.value.search);
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка'
            });
        } else {
            products.value = result.entity!.entity!.map((el: FullProductsDto) => {
                return {
                    ...el,
                    isChecked: false
                };
            }) || [];
            count.value = result.entity!.count!;
            limit.value = result.entity!.limit!;
        }
        isLoading.value = false;
    };

    const deleteUser = async () => {
        filters.value.page = 1;
        create();
    };

    const getRouter = (namePage: RouterName): string => {
        const path = router.resolve({
            name : namePage,
        });

        return path.fullPath;
    };

    onMounted(() => {
        create();
    });

</script>
<template>
    <div>
        <products-filters :filters="filters" @on-filters="create" />
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
            <products-content
                :products="products"
                :filters="filters"
                :count="count"
                :limit="limit"
                @update-page="updatePage"
                @on-delete="deleteUser"
            />
        </template>
        <q-btn
            color="primary"
            class="circle fixed"
            :to="getRouter(RouterName.CatalogProductsCreate)"
        >
            <q-icon name="add"></q-icon>
        </q-btn>
    </div>
</template>

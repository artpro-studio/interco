<script lang="ts" setup>
    import {onMounted, Ref, ref} from 'vue';
    import UTPSettings from 'pages/Panel/Catalog/Pages/UTPCreateOrUpdate/components/UTPSettings.vue';
    import {
        CommercialControllerClient, CreateProductCommercial,
        CreateProductCommercialOffersDto, getApiClientInitialParams,
        ResponseCommercialDto
    } from 'src/ApiClient/ApiClient';
    import {useRoute} from 'vue-router';
    import {useQuasar} from 'quasar';
    import FormButtons from 'src/components/UI/FormButtons.vue';
    import Property from 'pages/Panel/Catalog/Pages/ProductCreatOrUpdate/components/property/Property.vue';
    import UTPWareHouse from 'pages/Panel/Catalog/Pages/UTPCreateOrUpdate/components/UTPWareHouse.vue';

    const route = useRoute();
    const $q = useQuasar();

    const api = new CommercialControllerClient(getApiClientInitialParams());
    const isLoading: Ref<boolean> = ref(true);
    const tab: Ref<string> = ref('settings');
    const form: Ref<CreateProductCommercialOffersDto> = ref({
        id: null,
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
        article: '',
        basePrice: 0,
        purchasePrice: 0,
        salePrice: 0,
        weight: 0,
        length: 0,
        width: 0,
        height: 0,
        quantitativeAccounting: false,
        purchaseNotProducts: false,
        warehouse: null,
        propertyes: [],
    });

    const getInfo = async () => {
        const result: ResponseCommercialDto =  await api.getOne(route.params.id.toString());
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка'
            });
        } else {
            form.value = result.entity!;
        }

        isLoading.value = false;
    };

    const createCommercial = async () => {
        const body: CreateProductCommercial = {
            id: Number(route.params.slug),
            form: form.value,
        };
        const result: ResponseCommercialDto = await api.create(body);
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка'
            });
        } else {
            $q.notify({
                color: 'positive',
                textColor: 'white',
                icon: 'warning',
                message: 'Торговое предложение создано'
            });
            form.value = result.entity!;
        }
        isLoading.value = false;
    };

    const updateCommercial = async () => {
        const result: ResponseCommercialDto = await api.update(form.value);
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка'
            });
        } else {
            $q.notify({
                color: 'positive',
                textColor: 'white',
                icon: 'warning',
                message: 'Изменения сохранены'
            });
        }
        isLoading.value = false;
    };

    const onChange = () => {
        isLoading.value = true;
        if (form.value.id) {
            updateCommercial();
        } else {
            createCommercial();
        }
    };

    onMounted(() => {
        if (route.params.id) {
            getInfo();
        } else {
            isLoading.value = false;
        }
    });
</script>
<template>
    <div class="product-create form-edit">
        <div class="q-pa-md flex flex-center" v-if="isLoading">
            <q-circular-progress
                indeterminate
                size="50px"
                color="primary"
                class="q-ma-md"
                :thickness="0.1"
            />
        </div>
        <div>
            <q-tabs
                v-model="tab"
                color="primary"
                active-color="primary"
                :breakpoint="0"
                dense
                inline-label
            >
                <q-tab name="settings" icon="settings" label="Основные настройки" />
                <q-tab name="propertyes" icon="description" label="Свойства" />
                <q-tab name="wareHouse" icon="tune" label="Кол-во на складе" />
            </q-tabs>
            <q-form ref="formRef">
                <q-tab-panels
                    v-model="tab"
                    animated
                    transition-prev="jump-up"
                    transition-next="jump-up"
                    class="product-create__tabs-panels"
                    dense
                    swipeable
                    inline-label
                >
                    <q-tab-panel class="product-create__tab-panel" name="settings">
                        <UTPSettings :form="form" />
                    </q-tab-panel>
                    <q-tab-panel class="product-create__tab-panel" name="propertyes">
                        <property :idCommercial="form.id" />
                    </q-tab-panel>
                    <q-tab-panel class="product-create__tab-panel" name="wareHouse">
                        <UTPWareHouse :id-commercial="form.id" />
                    </q-tab-panel>
                </q-tab-panels>
            </q-form>
        </div>
        <form-buttons @success="onChange" />
    </div>
</template>

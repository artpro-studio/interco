<script lang="ts" setup>
    import {createApp, onMounted, Ref, ref} from 'vue';
    import {
        CommercialControllerClient, CreateProductCommercial,
        CreateProductCommercialOffersDto, getApiClientInitialParams, ResponseCommercialDto
    } from 'src/ApiClient/ApiClient';
    import {useQuasar} from 'quasar';
    import Property from 'pages/Panel/Catalog/Pages/ProductCreatOrUpdate/components/property/Property.vue';
    import CommercialWareHouse
        from 'pages/Panel/Catalog/Pages/ProductCreatOrUpdate/components/Commercial/CommercialWareHouse.vue';

    const app = createApp({});
    app.component('Property', Property);

    const $q = useQuasar();

    const emit = defineEmits(['change']);

    const props: {
        commercialId: number,
        productId: number,
    } = defineProps({
        commercialId: {
            type: Number,
            required: false,
        },
        productId: {
            type: Number,
            required: true,
        },
    });
    const isLoading: Ref<boolean> = ref(true);
    const api = new CommercialControllerClient(getApiClientInitialParams());
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

    const createCommercial = async () => {
        const body: CreateProductCommercial = {
            id: props.productId,
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
            emit('change');
        }
        isLoading.value = false;
    };

    const onChange = async () => {
        isLoading.value = true;
        if (props.commercialId) {
            updateCommercial();
        } else {
            createCommercial();
        }
    };

    const getInfo = async () => {
        const result: ResponseCommercialDto =  await api.getOne(props.commercialId.toString());
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

    onMounted(() => {
        if (props.commercialId) {
            getInfo();
        } else {
            isLoading.value = false;
        }
    });

</script>
<template>
    <q-card class="commercial-create-or-update">
        <div class="q-pa-md flex flex-center" v-if="isLoading">
            <q-circular-progress
                indeterminate
                size="50px"
                color="primary"
                class="q-ma-md"
                :thickness="0.1"
            />
        </div>
        <q-card-section>
            <div class="commercial-create-or-update__title q-mb-lg">
                <h4 class="text-h4" v-if="!props.commercialId">Создание торгового предложения</h4>
                <h4 class="text-h4" v-else>Редактирование торгового предложения</h4>
            </div>
            <q-form>
                <q-tabs
                    v-model="tab"
                    color="primary"
                    align="justify"
                    :breakpoint="0"
                    class="q-mb-md q-pa-md"
                    dense
                >
                    <q-tab name="settings" icon="mail" label="Основные настройки" />
                    <q-tab name="propertyes" icon="alarm" label="Свойства" v-if="form.id" />
                    <q-tab name="wareHouse" icon="alarm" label="Кол-во на складе" v-if="form.id" />
                </q-tabs>
                <q-tab-panels
                    v-model="tab"
                    animated
                    swipeable
                    transition-prev="jump-up"
                    transition-next="jump-up"
                    class="product-create__tabs-panels"
                >
                    <q-tab-panel class="product-create__tab-panel" name="settings">
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                v-model="form.article"
                                label="Артикул"
                                outlined
                                lazy-rules
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                type="number"
                                v-model="form.basePrice"
                                label="Базовая цена"
                                outlined
                                lazy-rules
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                type="number"
                                v-model="form.purchasePrice"
                                label="Закупочная цена "
                                outlined
                                lazy-rules
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                type="number"
                                v-model="form.salePrice"
                                label="Цена по акции"
                                outlined
                                lazy-rules
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                type="number"
                                v-model="form.weight"
                                label="Вес"
                                outlined
                                lazy-rules
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                type="number"
                                v-model="form.length"
                                label="Длина"
                                outlined
                                lazy-rules
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                type="number"
                                v-model="form.width"
                                label="Ширина"
                                outlined
                                lazy-rules
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                type="number"
                                v-model="form.height"
                                label="Высота"
                                outlined
                                lazy-rules
                            />
                        </div>
                        <div class="section-create-form__field row q-gutter-md">
                            <q-toggle
                                color="secondary"
                                v-model="form.quantitativeAccounting"
                                label="Включить количественный учет?"
                            />
                            <q-toggle
                                color="secondary"
                                v-model="form.purchaseNotProducts"
                                label="Разрешить покупку при отсутствии товара? "
                            />
                        </div>
                        <div class="commercial-create-or-update__buttons q-mt-lg">
                            <q-btn class="gradient-black" @click="onChange">
                                <span v-if="!form.id">Создать</span>
                                <span v-else>Сохранить</span>
                            </q-btn>
                        </div>
                    </q-tab-panel>
                    <q-tab-panel class="product-create__tab-panel" name="propertyes" v-if="form.id">
                        <property :idCommercial="form.id" />
                    </q-tab-panel>
                    <q-tab-panel class="product-create__tab-panel" name="wareHouse" v-if="form.id">
                        <commercial-ware-house :id-commercial="form.id" />
                    </q-tab-panel>
                </q-tab-panels>
            </q-form>
        </q-card-section>
    </q-card>
</template>
<style lang="scss" scoped>
    .commercial-create-or-update {
        &__buttons {
            button {
                width: 100%;
            }
        }
    }
</style>

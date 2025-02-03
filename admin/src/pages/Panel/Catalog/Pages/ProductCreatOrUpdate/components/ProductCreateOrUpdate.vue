<script lang="ts" setup>
    import {createApp, onMounted, ref, Ref} from 'vue';
    import {
        CreateSectionDto,
        FullProductsDto,
        getApiClientInitialParams,
        ProductControllerClient,
        ResponseProductDetailDto,
        ResponseProductDto,
        SectionControllerClient
    } from 'src/ApiClient/ApiClient';
    import useValidationRules from 'src/helpers/useValidationRules';
    import {useQuasar} from 'quasar';
    import {RouterName} from 'src/router/routerName';
    import {useRoute, useRouter} from 'vue-router';
    import FormButtons from '/src/components/UI/FormButtons.vue';
    import Property from './property/Property.vue';
    import CommercialBody from 'pages/Panel/Catalog/Pages/ProductCreatOrUpdate/components/Commercial/CommercialBody.vue';

    const app = createApp({});
    app.component('FormButtons', FormButtons);
    const { isRequired } = useValidationRules();
    const $q = useQuasar();
    const router = useRouter();
    const route = useRoute();

    const api = new ProductControllerClient(getApiClientInitialParams());
    const isEdit: Ref<boolean> = ref(false);
    let id: Ref<number | null> = ref(null);
    const formRef: Ref<any> = ref(null);
    const form: Ref<FullProductsDto> = ref({
        id: null,
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
        name: '',
        code: '',
        rating: 0,
        description: '',
        images: null,
        isNew: false,
        isLeader: false,
        isSpecialOffer: false,
        video: null,
        seoTitle: '',
        seoDesctiption: '',
        seoKeywords: '',
        propertyes: null,
        reviews: null,
        section: null,
        commercialOffers: null,
    });
    const tab: Ref<string> = ref('settings');
    // Модель всех разделов
    let allSections: Ref<CreateSectionDto[]> = ref([]);

    const routeCreateUTP = () => {
        router.push({
            name: RouterName.CatalogUTPCreate,
            params: {
                slug: route.params.id,
            }
        });
    };

    const changeTab = () => {
        router.push({
            name: form.value.id ? RouterName.CatalogProductsEdit : RouterName.CatalogProductsCreate,
            params: {
                id: form.value.id
            },
            query: {
                tab: tab.value
            }
        });
    };

    const saveForm = () => {
        formRef.value!.validate().then(async (success: boolean) => {
            if (success) {
                console.log(form.value);
                const result = await api.create(form.value);
                if (!result.isSuccess) {
                    $q.notify({
                        color: 'negative',
                        textColor: 'white',
                        icon: 'warning',
                        message: 'Произошла ошибка'
                    });
                } else {
                    $q.notify({
                        color: 'positive',
                        textColor: 'white',
                        icon: 'check',
                        message: 'Раздел создан'
                    });

                    router.push({
                        name: RouterName.CatalogProducts,
                    });
                }
            }
        });
    };

    const deleteItem = async () => {
        const result: ResponseProductDto = await api.delete(id.value!.toString());
        if (result.isSuccess) {
            $q.notify({
                color: 'positive',
                textColor: 'white',
                icon: 'check',
                message: 'Раздел удален'
            });
        } else {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка'
            });
        }

        router.push({name: RouterName.CatalogProducts});
    };

    // Получение товара
    const getDetailInfo = async () => {
        const result: ResponseProductDetailDto = await api.detail(id!.value!.toString());
        if (!result.isSuccess && !result.entity) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка'
            });
        } else {
            form.value = result.entity!;
        }
    };

    // Получение всех разделов
    const getAllSections = async () => {
        const result = await  new SectionControllerClient(getApiClientInitialParams()).get();
        if (!result.isSuccess) {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка'
            });
        } else {
            allSections!.value = result.entity!.filter((el: CreateSectionDto) => el.id !== id.value);
        }
    };

    onMounted(() => {
        if (route.name === RouterName.CatalogProductsEdit) {
            id.value = Number(route.params.id);
            isEdit.value = true;
            getDetailInfo();
        }

        getAllSections();

        if (route.query.tab) {
            tab.value = route.query.tab.toString();
        }
    });
</script>
<template>
    <div>
        <div class="product-create form-edit">
            <q-tabs
                v-model="tab"
                color="primary"
                active-color="primary"
                dense
                swipeable
                inline-label
                @update:model-value="changeTab"
            >
                <q-tab name="settings" icon="settings" label="Основные настройки" />
                <q-tab name="seo" icon="tune" label="Seo парамметры" />
                <q-tab name="commercialOffers" icon="category" label="Уникальные торговые предложения">
                    <q-btn class="product-create__tabs__btn q-ml-sm" icon="more_vert" round>
                        <q-menu
                            class="product-create__tabs__menu"
                            anchor="top right"
                            self="top left"
                        >
                            <q-list style="min-width: 100px">
                                <q-item class="product-create__tabs__menu__item" clickable v-close-popup>
                                    <q-item-section class="product-create__tabs__menu__item__content" @click="routeCreateUTP">Создать УТП</q-item-section>
                                </q-item>
                                <q-item class="product-create__tabs__menu__item" clickable v-close-popup>
                                    <q-item-section class="product-create__tabs__menu__item__content">Генерация УТП</q-item-section>
                                </q-item>
                            </q-list>
                        </q-menu>
                    </q-btn>
                </q-tab>
                <q-tab name="propertyes" icon="description" label="Свойства" />
                <q-tab name="reviews" icon="comment" label="Отзывы" />
            </q-tabs>
            <q-form ref="formRef">
                <q-tab-panels
                    v-model="tab"
                    animated
                    transition-prev="jump-up"
                    transition-next="jump-up"
                    class="product-create__tabs-panels"
                >
                    <q-tab-panel class="product-create__tab-panel" name="settings">
                        <q-card class="section-create-form">
                            <q-card-section class="product-create__content">
                                <div class="section-create-form__field q-mb-md" v-if="form">
                                    <q-input
                                        color="primary"
                                        v-model="form.name"
                                        label="Название"
                                        outlined
                                        lazy-rules
                                        :rules="[isRequired]"
                                    />
                                </div>
                                <div class="section-create-form__field q-mb-md">
                                    <q-input
                                        color="primary"
                                        v-model="form.code"
                                        label="Символьный код"
                                        outlined
                                        lazy-rules
                                        :rules="[isRequired]"
                                    />
                                </div>
                                <div class="section-create-form__field q-mb-md">
                                    <q-input
                                        color="primary"
                                        type="textarea"
                                        v-model="form.description"
                                        label="Описание товара"
                                        outlined
                                    />
                                </div>
                                <div class="section-create-form__field q-mb-md">
                                    <q-select
                                        v-model="form.section"
                                        :options="allSections"
                                        option-label="name"
                                        option-value="id"
                                        color="primary"
                                        label="Раздел"
                                        outlined
                                        clearable
                                        multiple
                                    />
                                </div>
                                <q-btn
                                    class="q-mt-lg"
                                    v-if="isEdit"
                                    color="negative full"
                                    @click="deleteItem"
                                    flat
                                >Удалить товара</q-btn>
                            </q-card-section>
                        </q-card>

                    </q-tab-panel>
                    <q-tab-panel class="product-create__tab-panel" name="seo">
                        <q-card class="section-create-form">
                            <q-card-section class="product-create__content">
                                <div class="section-create-form__field q-mb-md">
                                    <q-input
                                        color="primary"
                                        v-model="form.seoTitle"
                                        label="Заголовок"
                                        outlined
                                    />
                                </div>
                                <div class="section-create-form__field q-mb-md">
                                    <q-input
                                        color="primary"
                                        v-model="form.seoDesctiption"
                                        label="Описание"
                                        outlined
                                    />
                                </div>
                                <div>
                                    <q-input
                                        color="primary"
                                        type="textarea"
                                        v-model="form.seoKeywords"
                                        label="Ключевые слова"
                                        outlined
                                    />
                                </div>
                            </q-card-section>
                        </q-card>
                    </q-tab-panel>
                    <q-tab-panel class="product-create__tab-panel" name="commercialOffers" v-if="form.id">
                        <commercial-body
                            :product-id="form.id"
                        />
                    </q-tab-panel>
                    <q-table-panel class="product-create__tab-panel" name="propertyes">
                        <property :id="form.id" />
                    </q-table-panel>
                </q-tab-panels>

            </q-form>
        </div>
        <form-buttons @success="saveForm" />
    </div>
</template>
<style lang="scss">
    .product-create {
        .q-tab {
            text-transform: none;
            color: var(--q-black-gray);
            letter-spacing: normal;
            border-radius: 7px 7px 0 0;

            &__content {
                padding: 10px 0;

                .q-icon {
                    color: var(--q-gray-light);
                }
            }

            &.q-tab--active {
                .q-icon {
                    color: var(--q-primary) !important;
                }
            }
        }
        .q-tabs {
            &__content {
                border-bottom: 1px #D5D6DE solid;
            }
        }
        &__tabs-panels {
            background-color: transparent;
        }

        .q-tab-panel {
            padding: 0;
            background: transparent;
        }

        &__tab-panel {
            background-color: transparent;
        }
        &__tabs {
            &__menu {
                &__item {
                    font-size: 12px;
                    min-height: 30px;
                    padding: 0;

                    &__content {
                        padding: 8px 16px;
                    }
                }
            }
            &__btn {
                min-width: 25px;
                min-height: 25px;

                i {
                    font-size: 18px !important;
                }
            }
        }
    }
</style>

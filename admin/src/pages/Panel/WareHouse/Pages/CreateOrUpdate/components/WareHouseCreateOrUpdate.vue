<script lang="ts" setup>
    import { createApp, onMounted, Ref, ref } from 'vue';
    import { useRoute, useRouter } from 'vue-router';
    import {
        FullWarehouseDto,
        getApiClientInitialParams,
        ResponseWareHouseDto,
        WareHouseControllerClient
    } from 'src/ApiClient/ApiClient';
    import { RouterName } from 'src/router/routerName';
    import { useQuasar } from 'quasar';
    import FormButtons from '/src/components/UI/FormButtons.vue';

    const app = createApp({});
    app.component('FormButtons', FormButtons);

    const $q = useQuasar();

    const route = useRoute();
    const router = useRouter();

    // Ref на форму
    const formEdit = ref();

    let id: Ref<number | null> = ref(null);
    // Модель загрузки
    const isLoading = ref(true);
    // Модель раздела
    let form: Ref<FullWarehouseDto> = ref({
        id: null,
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
        name: '',
        description: '',
        idWarehouse: 0,
        address: '',
        phone: '',
        email: '',
        timeWork: '',
        gpsLan: 0,
        gpsLon: 0,
        productCommercialOffers: null,

    });
    const api = new WareHouseControllerClient(getApiClientInitialParams());

    // Сохранение раздела
    const saveForm = () => {
        formEdit.value!.validate().then(async (success: boolean) => {
            if (success) {
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
                        name: RouterName.WareHouse,
                    });
                }
            }
        });
    };

    const deleteItem = async () => {
        const result: ResponseWareHouseDto = await api.delete(id.value!.toString());
        if (result.isSuccess) {
            $q.notify({
                color: 'positive',
                textColor: 'white',
                icon: 'check',
                message: 'Склад удален'
            });
        } else {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: 'Произошла ошибка'
            });
        }

        router.push({name: RouterName.WareHouse});
    };

    // Получение раздела
    const getDetailInfo = async () => {
        console.log('id.value', id.value);
        const result: ResponseWareHouseDto = await api.getOne(id!.value!.toString());
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

    onMounted(() => {
        isLoading.value = false;
        if (route.name === RouterName.WareHouseEdit) {
            id.value = Number(route.params.id);
            getDetailInfo();
        }
    });
</script>

<template>
    <div>
        <div class="row items-center justify-center" v-if="isLoading">
            <q-spinner
                color="primary"
                size="4em"
                :thickness="3"
            />
        </div>
        <div class="section-create form-edit" v-else>
            <h4 class="text-h4 q-mb-lg">Основные настройки</h4>
            <q-card class="section-create-form">
                <q-card-section>
                    <q-form  ref="formEdit">
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                type="number"
                                v-model="form.idWarehouse"
                                label="ID скалад для связи"
                                outlined
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                v-model="form.name"
                                label="Название"
                                outlined
                                lazy-rules
                                :rules="[ val => val && val.length > 0 || 'Заполните поле']"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                type="textarea"
                                v-model="form.description"
                                label="Описание"
                                outlined
                                lazy-rules
                                :rules="[ val => val && val.length > 0 || 'Заполните поле']"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                v-model="form.address"
                                label="Адрес"
                                outlined
                                lazy-rules
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                type="number"
                                v-model="form.gpsLon"
                                label="Долгота"
                                outlined
                                lazy-rules
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                type="number"
                                v-model="form.gpsLan"
                                label="Широта"
                                outlined
                                lazy-rules
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                v-model="form.phone"
                                label="Телефон"
                                outlined
                                lazy-rules
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                v-model="form.email"
                                label="E-mail"
                                outlined
                                lazy-rules
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                v-model="form.timeWork"
                                label="Время работы"
                                outlined
                                lazy-rules
                            />
                        </div>
                    </q-form>
                </q-card-section>
            </q-card>

            <q-btn
                class="q-mt-lg"
                color="negative full"
                @click="deleteItem"
                outline
            >Удалить склад</q-btn>
        </div>
        <form-buttons @success="saveForm" />

    </div>
</template>

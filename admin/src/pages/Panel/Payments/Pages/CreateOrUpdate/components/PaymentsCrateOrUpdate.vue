<script lang="ts" setup>
    import { computed, createApp, onMounted, Ref, ref} from 'vue';
    import ModalsInfo from 'src/components/Modals/ModalsInfo.vue';
    import FormButtons from 'src/components/UI/FormButtons.vue';
    import { useRoute, useRouter } from 'vue-router';
    import useValidationRules from 'src/helpers/useValidationRules';
    import {
        getApiClientInitialParams,
        Result,
        PaymentsControllerClient,
        ResponsePaymentsDto,
        CreatePaymentsDto,
        CreatePaymentsDtoType, CreatePaymentsDtoTypeCompany
    } from 'src/ApiClient/ApiClient';
    import { RouterName } from 'src/router/routerName';
    import { useQuasar } from 'quasar';
    import SelectsTypePayments
        from 'pages/Panel/Payments/Pages/CreateOrUpdate/components/Selects/SelectsTypePayments.vue';
    import SelectsTypeCompanyPayments
        from 'pages/Panel/Payments/Pages/CreateOrUpdate/components/Selects/SelectsTypeCompanyPayments.vue';

    const app = createApp({});
    app.component('FormButtons', FormButtons)
        .component('ModalInfo', ModalsInfo);

    const $q = useQuasar();
    const route = useRoute();
    const router = useRouter();

    const { isRequired } = useValidationRules();

    let id: Ref<number | null> = ref(null);
    // Ref на форму
    const formEdit = ref();
    // Модель загрузки
    const isLoading = ref(true);
    // Модель раздела
    let form: Ref<CreatePaymentsDto  > = ref({
        id: null,
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
        name: '',
        description: '',
        idPayment: '',
        endpoint: '',
        idAccount: '',
        password: '',
        type: CreatePaymentsDtoType.Cashless,
        typeCompany: CreatePaymentsDtoTypeCompany.Yookassa,
    });
    // Сущность для модального окна удаление
    const isDelete: Ref<boolean> = ref(false);

    const api = computed((): PaymentsControllerClient => {
        return new PaymentsControllerClient(getApiClientInitialParams());
    });

    const updateData = async () => {
        const result: ResponsePaymentsDto = await api.value.update(form.value);
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
                icon: 'check',
                message: 'Сохранено успешно'
            });

            router.push({
                name: RouterName.Payments,
            });
        }
    };

    const createData = async () => {
        const result: ResponsePaymentsDto = await api.value.create(form.value);

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
                icon: 'check',
                message: 'Сохранено успешно'
            });

            router.push({
                name: RouterName.Payments,
            });
        }
    };

    // Сохранение раздела
    const saveForm = () => {
        formEdit.value!.validate().then(async (success: boolean) => {
            if (success) {
                if (route.name === RouterName.UsersEdit) {
                    updateData();
                } else {
                    createData();
                }
            }
        });
    };

    const deleteItem = async () => {
        isDelete.value = false;

        const result: Result = await api.value.delete(id.value!.toString());
        if (result.isSuccess) {
            $q.notify({
                color: 'positive',
                textColor: 'white',
                icon: 'check',
                message: 'Заказ удален'
            });
            router.push({name: RouterName.Orders});
        } else {
            $q.notify({
                color: 'negative',
                textColor: 'white',
                icon: 'warning',
                message: result.message || 'Произошла ошибка'
            });
        }
    };

    // Получение раздела
    const getDetailInfo = async () => {
        console.log('id.value', id.value);
        const result: ResponsePaymentsDto = await api.value.getOne(id.value!.toString());
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
        if (route.name === RouterName.PaymentsEdit) {
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
            <q-card class="section-create-form q-mb-lg">
                <q-card-section>
                    <q-form @submit="saveForm" ref="formEdit">
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                v-model="form.name"
                                label="Название"
                                outlined
                                lazy-rules
                                :rules="[isRequired]"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                v-model="form.description"
                                label="Описание"
                                outlined
                                lazy-rules
                                :rules="[isRequired]"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                v-model="form.idPayment"
                                label="ID плтаженой системы"
                                outlined
                                lazy-rules
                                :rules="[isRequired]"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                v-model="form.endpoint"
                                label="Ссылка для API"
                                outlined
                                lazy-rules
                                :rules="[isRequired]"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                v-model="form.idAccount"
                                label="ID аккаунта"
                                outlined
                                lazy-rules
                                :rules="[isRequired]"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                v-model="form.password"
                                label="Пароль"
                                outlined
                                lazy-rules
                                :rules="[isRequired]"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <selects-type-payments
                                v-model="form.type"
                                @update-model="form.type = $event"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <selects-type-company-payments
                                v-model="form.typeCompany"
                                @update-model="form.typeCompany = $event"
                            />
                        </div>

                    </q-form>
                </q-card-section>
            </q-card>

            <q-btn
                color="negative full"
                @click="isDelete = true"
                outline
            >Удалить платежной системы</q-btn>
        </div>
        <form-buttons @success="saveForm" />

        <q-dialog v-model="isDelete">
            <modals-info text="Подтвердите ваше действие" @success="deleteItem" />
        </q-dialog>
    </div>
</template>

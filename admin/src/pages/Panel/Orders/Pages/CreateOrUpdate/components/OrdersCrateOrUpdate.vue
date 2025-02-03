<script lang="ts" setup>
    import { computed, createApp, onMounted, Ref, ref} from 'vue';
    import ModalsInfo from 'src/components/Modals/ModalsInfo.vue';
    import FormButtons from 'src/components/UI/FormButtons.vue';
    import { useRoute, useRouter } from 'vue-router';
    import useValidationRules from 'src/helpers/useValidationRules';
    import {
        CreateOrdersDtoStatus,
        getApiClientInitialParams,
        Result,
        FullOrdersDto,
        OrdersControllerClient,
        ResponseOrdersDto,
        ResponseOrdersFullDto,
        CreateProductCommercialOffersDto
    } from 'src/ApiClient/ApiClient';
    import { RouterName } from 'src/router/routerName';
    import { useQuasar } from 'quasar';
    import SelectsCommercial from 'components/UI/Selects/SelectsCommercial.vue';
    import SelectPayments from 'pages/Panel/Orders/Pages/CreateOrUpdate/components/SelectPayments.vue';

    const app = createApp({});
    app.component('FormButtons', FormButtons)
        .component('ModalInfo', ModalsInfo);

    const $q = useQuasar();
    const route = useRoute();
    const router = useRouter();

    const { isRequired, isRequiredEmail } = useValidationRules();

    let id: Ref<number | null> = ref(null);
    // Ref на форму
    const formEdit = ref();
    // Модель загрузки
    const isLoading = ref(true);
    // Модель раздела
    let form: Ref<FullOrdersDto  > = ref({
        id: null,
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
        address: '',
        email: '',
        phone: '',
        amount: 0,
        status: CreateOrdersDtoStatus.Decoration,
        commercial: null,
        payment: null,
        user: null,
    });
    // Сущность для модального окна удаление
    const isDelete: Ref<boolean> = ref(false);

    const api = computed((): OrdersControllerClient => {
        return new OrdersControllerClient(getApiClientInitialParams());
    });

    const amount = computed((): number => {
        let amount = 0;
        if (form.value.commercial) {
            form.value.commercial.forEach((el: CreateProductCommercialOffersDto) => {
                amount += el.basePrice;
            });
        }
        return amount;
    });

    const updateData = async () => {
        form.value.amount = amount.value;
        const result: ResponseOrdersDto = await api.value.update(form.value);
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
                name: RouterName.Orders,
            });
        }
    };

    const createData = async () => {
        form.value.amount = amount.value;
        const result: ResponseOrdersDto = await api.value.create(form.value);

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

            // router.push({
            //     name: RouterName.Orders,
            // });
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
        const result: ResponseOrdersFullDto = await api.value.getOne(id.value!.toString());
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
        if (route.name === RouterName.OrdersEdit) {
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
            <q-card class="section-create-form q-mb-lg">
                <q-card-section>
                    <q-form @submit="saveForm" ref="formEdit">
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                v-model="form.address"
                                label="Адрес"
                                outlined
                                lazy-rules
                                :rules="[isRequired]"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                v-model="form.email"
                                label="E-mail"
                                outlined
                                lazy-rules
                                :rules="[isRequiredEmail]"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <q-input
                                color="secondary"
                                v-model="form.phone"
                                label="Телефон"
                                outlined
                                lazy-rules
                                :rules="[isRequired]"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <selects-commercial
                                v-model="form.commercial"
                                @update-model="form.commercial = $event"
                            />
                        </div>
                        <div class="section-create-form__field q-mb-md">
                            <select-payments
                                v-model="form.payment"
                                @update-model="form.payment = $event"
                            />
                        </div>
                        <div>
                            <p>Общая сумма: {{ amount }}</p>
                        </div>
                    </q-form>
                </q-card-section>
            </q-card>

            <q-btn
                color="negative full"
                @click="isDelete = true"
                outline
            >Удалить заказ</q-btn>
        </div>
        <form-buttons @success="saveForm" />

        <q-dialog v-model="isDelete">
            <modals-info text="Подтвердите ваше действие" @success="deleteItem" />
        </q-dialog>
    </div>
</template>

<script lang="ts" setup>
    import { computed, onMounted, ref, Ref } from 'vue';
    import ModalSuccess from '../modals/ModalSuccess.vue';
    import ModalPolice from '../modals/ModalSuccess.vue';
    import { QForm } from 'quasar';
    import { getApiClientInitialParams, PublicReferenceBookInstancesControllerClient } from 'src/ApiClient/ApiClient';

    const formRef = ref(null);
    const form: Ref<{
        name: string;
        phone: string;
        date: {
            from: string;
            to: string;
        };
        type: any;
        format: any;
        area: any;
    }> = ref({
        name: '',
        phone: '',
        date: {
            from: new Date().toLocaleDateString(),
            to: new Date().toLocaleDateString(),
        },
        type: null,
        format: null,
        area: null,
    });
    const optionsType: Ref<any> = ref([]);
    const optionsFormat: Ref<any> = ref([]);
    const optionsArea: Ref<any> = ref([]);

    const isSuccessOpen: Ref<boolean> = ref(false);
    const isPoliceOpen: Ref<boolean> = ref(false);

    const priceCalc = computed((): number => {
        let price = 0;
        if (form.value.type) {
            price += form.value.type.price;
        }
        if (form.value.format) {
            price += form.value.format.price;
        }
        if (form.value.area) {
            price += form.value.area.price;
        }
        return price;
    });

    const closeSuccess = () => {
        isSuccessOpen.value = !isSuccessOpen.value;
    };

    const updateArea = () => {
        form.value.type = null;
        form.value.format = null;
    };

    const updateType = () => {
        form.value.format = null;
    };

    const sendCallback = () => {
        (formRef.value! as InstanceType<typeof QForm>).validate().then(async (success: boolean) => {
            if (success) {
                const sendForm: any = {
                    name: form.value.name,
                    phone: form.value.phone,
                    message: `Тип размещения: ${form.value.type!.name}, Формат: ${form.value.format!.name}, Район: ${
                        form.value.area!.name
                    }`,
                };

                console.log(sendForm);
            }
        });
    };

    const getAreaOptions = async () => {
        const result = await new PublicReferenceBookInstancesControllerClient(getApiClientInitialParams()).get(
            '',
            1,
            10,
            'area'
        );
        if (result.isSuccess) {
            optionsArea.value = result.entity?.entity;
        }
    };

    onMounted(() => {
        getAreaOptions();
    });
</script>
<template>
    <q-intersection once>
        <section class="calculate" id="calculate">
            <div class="container">
                <div class="calculate__body q-pa-lg">
                    <div class="calculate__header q-mb-lg">
                        <h4>Расчитать стоимость рекламы</h4>
                        <p>Выберите подходящие для вас настройки</p>
                    </div>
                    <q-form class="calculate__form" ref="formRef">
                        <div class="calculate__form__body row items-center q-gutter-sm">
                            <div class="calculate__form__field">
                                <q-field v-model="form.area" ref="areaRef" class="q-main-field" outlined>
                                    <q-select
                                        v-model="form.area"
                                        :options="optionsArea"
                                        class="q-main-field__select"
                                        label="Район"
                                        option-value="id"
                                        option-label="name"
                                        @update:model-value="updateArea"
                                        use-chips
                                        outlined
                                    />
                                </q-field>
                            </div>
                            <div class="calculate__form__field">
                                <q-field v-model="form.type" ref="typeRef" class="q-main-field" outlined>
                                    <q-select
                                        v-model="form.type"
                                        :options="optionsType"
                                        class="q-main-field__select"
                                        label="Размещение рекламы"
                                        option-value="id"
                                        option-label="name"
                                        @update:model-value="updateType"
                                        use-chips
                                        outlined
                                    />
                                </q-field>
                            </div>
                            <div class="calculate__form__field">
                                <q-field v-model="form.format" ref="formatRef" class="q-main-field" outlined>
                                    <q-select
                                        v-model="form.format"
                                        :options="optionsFormat"
                                        class="q-main-field__select"
                                        label="Формат баннера"
                                        option-value="id"
                                        option-label="name"
                                        outlined
                                        use-chips
                                    />
                                </q-field>
                            </div>
                            <div class="calculate__form__field">
                                <q-field ref="dateRef" v-model="form.date" label="Срок размещения" outlined>
                                    <div class="calculate__form__date">
                                        <div class="calculate__form__date__body row items-center justify-between">
                                            <div class="calculate__form__date__text">
                                                {{ form.date.from }} - {{ form.date.to }}
                                            </div>
                                            <q-icon
                                                name="event"
                                                size="24px"
                                                class="calculate__form__date__icon cursor-pointer"
                                            />
                                        </div>
                                    </div>
                                    <q-popup-proxy
                                        class="date-picker-modal"
                                        cover
                                        transition-show="scale"
                                        transition-hide="scale"
                                    >
                                        <q-date v-model="form.date" mask="DD-MM-YYYY" range>
                                            <div class="row items-center justify-end">
                                                <q-btn v-close-popup label="Закрыть" color="primary" flat />
                                            </div>
                                        </q-date>
                                    </q-popup-proxy>
                                </q-field>
                            </div>
                            <div class="calculate__form__field">
                                <q-input ref="nameRef" v-model="form.name" label="Ваше имя" outlined>
                                    <template v-slot:prepend>
                                        <q-icon name="person"></q-icon>
                                    </template>
                                </q-input>
                            </div>
                            <div class="calculate__form__field">
                                <q-input
                                    ref="phoneRef"
                                    v-model="form.phone"
                                    label="Телефон"
                                    mask="+7 (###) ###-##-##"
                                    outlined
                                >
                                    <template v-slot:prepend>
                                        <q-icon name="phone"></q-icon>
                                    </template>
                                </q-input>
                            </div>
                            <div class="calculate__form__buttons">
                                <div class="calculate__form__buttons__body row items-center q-mt-md">
                                    <div class="calculate__form__buttons__price q-mr-md">
                                        <span class="q-mr-sm">{{ priceCalc }}</span> рублей
                                    </div>
                                    <q-btn
                                        class="calculate__form__buttons__btn q-ml-lg"
                                        color="primary"
                                        @click="sendCallback"
                                    >
                                        Заказать рекламу
                                    </q-btn>
                                </div>
                                <p class="q-mt-lg">
                                    Нажимая на кнопку вы соглашаетсь с
                                    <a href="javascript:void(0)" @click="isPoliceOpen = !isPoliceOpen">
                                        политикой конфедециальности
                                    </a>
                                </p>
                            </div>
                        </div>
                    </q-form>
                </div>
            </div>
            <q-dialog v-model="isSuccessOpen">
                <modal-success @close="closeSuccess" />
            </q-dialog>
            <q-dialog v-model="isPoliceOpen">
                <modal-police @close="isPoliceOpen = !isPoliceOpen" />
            </q-dialog>
        </section>
    </q-intersection>
</template>
<style lang="scss" scoped>
    .calculate {
        margin-top: -115px;
        position: relative;
        &__body {
            background: #ffffff;
            box-shadow: 0px 4px 30px rgba(35, 31, 32, 0.15);
            border-radius: 10px;
        }
        &__header {
            h4 {
                font-size: 1.5em;
                color: var(--q-dark);
                font-weight: 700;
            }
            p {
                font-size: 1.1em;
            }
        }

        &__form {
            &__field {
                width: calc(33.3333% - 16px);
            }

            &__date {
                width: 100%;
                margin-top: 5px;
                position: relative;

                &__text {
                    color: var(--q-dark);
                }

                &__icon {
                    position: absolute;
                    top: -10px;
                    right: 0;
                    color: #747574;
                }
            }

            &__buttons {
                &__price {
                    font-weight: 700;
                    font-size: 1.2em;
                    span {
                        font-weight: 800;
                        font-size: 1.5em;
                    }
                }

                p {
                    font-size: 12px;

                    a {
                        color: var(--q-primary);
                    }
                }
            }

            @media (max-width: 820px) {
                &__field {
                    width: calc(50% - 16px);
                }
            }
            @media (max-width: 650px) {
                &__field {
                    width: 100%;
                }

                &__buttons {
                    width: 100%;
                    &__body {
                        width: 100%;
                    }
                    &__price {
                        width: 100%;
                        text-align: center;
                        margin-right: 0;
                        margin-bottom: 20px;
                    }

                    p {
                        text-align: center;
                    }
                }
            }
        }

        @media (max-width: 1024px) {
            margin-top: 20px;

            &__body {
                box-shadow: none;
                padding: 0;
            }
        }
    }
</style>
<style lang="scss">
    .calculate__form__buttons__btn {
        height: 61px;
        width: 256px;

        &:before {
            box-shadow: 0px 0px 30px rgba(32, 184, 129, 0.5);
        }

        @media (max-width: 650px) {
            width: 100%;
            margin-left: 0;
        }
    }
</style>

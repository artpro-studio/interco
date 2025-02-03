<script lang="ts" setup>
    import { ref, Ref } from 'vue';
    import useValidationRules from 'src/helpers/useValidationRules';
    import { useQuasar } from 'quasar';

    const { isRequired } = useValidationRules();
    const $q = useQuasar();

    const emit = defineEmits(['close']);

    const formRef = ref(null);
    const form: Ref<CreateCallbackDto> = ref({
        name: '',
        phone: '',
        message: '',
    });
    const isSuccessOpen: Ref<boolean> = ref(false);
    const isPoliceOpen: Ref<boolean> = ref(false);

    const close = () => {
        emit('close');
    };

    const sendCallback = async () => {
        // formRef.value.validate().then(async (success) => {
        //     if (success) {
        //         const result = await new CallbackControllerClient(getApiClientInitialParams()).create(form.value);
        //         if (!result.isSuccess) {
        //             $q.notify({
        //                 color: 'negative',
        //                 textColor: 'white',
        //                 icon: 'warning',
        //                 message: result.message || 'Заполните все поля',
        //             });
        //         } else {
        //             isSuccessOpen.value = true;
        //         }
        //     }
        // });
    };

    const closeSuccess = () => {
        isSuccessOpen.value = !isSuccessOpen.value;
        close();
    };
</script>
<template>
    <q-card class="callback-modal modal q-pt-lg">
        <q-card-section class="q-pa-lg">
            <div class="callback-modal__header modal__header q-mb-lg text-center">
                <h4 class="callback-modal__header__title modal__header__title">Оставьте заявку</h4>
                <p class="callback-modal__header__desc modal__header__desc">И мы свяжемся с вами в ближайшее время</p>
                <q-btn icon="close" round class="modal__header__close" @click="close"></q-btn>
            </div>
            <q-form class="callback-modal__form q-mt-lg" ref="formRef">
                <div class="callback-modal__form__body">
                    <div class="callback-modal__form__field q-mb-md">
                        <q-input ref="nameRef" v-model="form.name" label="Ваше имя" :rules="[isRequired]" filled />
                    </div>
                    <div class="callback-modal__form__field q-mb-md">
                        <q-input
                            ref="phoneRef"
                            v-model="form.phone"
                            mask="+7 (###) ###-##-##"
                            :rules="[isRequired]"
                            label="Телефон"
                            filled
                        />
                    </div>
                    <div class="callback-modal__form__button q-mb-md">
                        <q-btn color="primary" class="callback-modal__form__button__btn" @click="sendCallback">
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
            </q-form>
        </q-card-section>
    </q-card>
    <q-dialog v-model="isSuccessOpen" @hide="closeSuccess">
        <modal-success @close="closeSuccess" />
    </q-dialog>
    <q-dialog v-model="isPoliceOpen">
        <modal-police @close="isPoliceOpen = !isPoliceOpen" />
    </q-dialog>
</template>
<style lang="scss" scoped>
    .callback-modal {
        &__form {
            &__button {
                &__btn {
                    width: 100%;
                    height: 54px;

                    &:before {
                        box-shadow: 0px 0px 30px rgba(32, 184, 129, 0.5);
                    }
                }
            }
            p {
                text-align: center;
                font-size: 12px;
                a {
                    color: var(--q-primary);
                }
            }
        }
    }
</style>
